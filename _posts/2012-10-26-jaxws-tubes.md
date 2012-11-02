---
title: Jaxws tubes
layout: post
tags: jaxws, soap, soap handler, tubes, metro
---


Ha egy adott műveletet minden kimenő és/vagy bejövő web service kérésnél meg kell hívni (pl. authorizáció elvégzéséhez vagy egyéb kontextus függő adatok átadásához) általában a JAXWS szaványban szereplő [SOAPHandler](http://docs.oracle.com/cd/E13222_01/wls/docs103/webserv_adv/handlers.html)-ket szokás ajánani.


A SOAPHandler-eknek azonban több erős korlátja is van:

* Nem lehet transzparensen, automatikusan aktiválni minden webservicre egy adott projekten belül.
* Bizonyos alacsony szintű (gyártó specifikus) objektumokhoz nem, vagy csak korlátozotton fér hozzá.

Az közül az első sokszor okozoz gondot. Egy autentikációt végző SOAPHandler pl. nem jó, hogy ha attól függ, hogy a fejlesztő definiálta-e, hogy a SOAPHandler-t meg kell hívni az adott webservice-re. A SOAPHandler definiálható annotációval (HandlerChain) vagy XML-ben (sun-jaxws.xml), de mindkét esetben külön kell definiálni minden egyes service-re.

Szerencsére van egy sokkal kevésbé ismert gyártó függő (tehát nem szabványos) megoldás a referencia implementációban.


Saját TubelineAssembler-t definiálva ugyanis a Metro feldolgozási sorába regisztrálhatunk új elemeket (és távolíthatunk el meglévőket), amik __minden__ bejövő és/vagy kimenő hívásra le tudnak futni. Az alapok jól össze vannak foglalva [ebben](http://marek.potociar.net/2009/10/19/custom-metro-tube-interceptor/) a cikkben, de ez még egy korábbi JAXWS verziót használ. Metro/JAXWS 2.1-től XML file helyett [Service Provider Interface][spi] használatával kell regisztrálnunk a saját implemetációnkat.

A megoldás így is elég egyszerű:

(1.) Kell egy file a META-INF/services/com.sun.xml.ws.api.pipe.TubelineAssemblerFactory jarban, aminek a tartalma a mi implmenteációnknak a neve.

    net.anzix.blog.CustomTubelineAssemblerFactory

(2.) Szükség van magára a Factory implementációra, ami legtöbb esetben egyszerűen létrehoyya a TubelineAssembler-t.

{% highlight java %}
public class CustomTubelineAssemblerFactory extends TubelineAssemblerFactory {

    @Override
    public TubelineAssembler doCreate(BindingID bindingID) {
        return new CustomTubelineAssembler();
    }

{% endhighlight %}
---

(3.) Sajnos az XML definícióhoz hasonlóan a TubelineAssembler-ünkben is definiálnunk kell az összes lépést, tehát le kell másolnunk az aktuális Metro verió alapértelmezett implementációját. (verziófüggőség)


{% highlight java %}
public class CustomTubelineAssembler implements TubelineAssembler {
    @NotNull
    public Tube createClient(ClientTubeAssemblerContext context) {
        Tube head = context.createTransportTube();
        head = context.createSecurityTube(head);
        head = context.createWsaTube(head);
        head = context.createClientMUTube(head);
        head = context.createValidationTube(head);
        head = new ClientSideTube(head, context.getWsdlModel());
        return context.createHandlerTube(head);
    }

    /**
     * On Server-side, HandlerChains cannot be changed after it is deployed.
     * During assembling the Pipelines, we can decide if we really need a
     * SOAPHandlerPipe and LogicalHandlerPipe for a particular Endpoint.
     */
    public Tube createServer(ServerTubeAssemblerContext context) {
        Tube head = context.getTerminalTube();
        head = context.createValidationTube(head);
        head = context.createHandlerTube(head);
        head = context.createMonitoringTube(head);
        head = context.createServerMUTube(head);
        head = context.createWsaTube(head);
        head = context.createSecurityTube(head);
        head = new ServerSideTube(head, context.getWsdlModel());
        return head;
    }


}

{% endhighlight %}

(4.) És végül kellenek maguk a Tubeline implementációk (az egyszerűség kedvéért a Metro abstract ősosztályát használva):

{% highlight java %}
public class ServerSideTube extends AbstractFilterTubeImpl {

    private WSDLPort wsdlPort;

    public ServerSideTube(Tube delegate, WSDLPort wsdlPort) {
        super(delegate);
        this.wsdlPort = wsdlPort;
    }

    @Override
    public NextAction processRequest(Packet request) {

        System.out.println("New incoming messages to the model " + wsdlPort.getName());
        return doInvoke(next, request);
    }


    @Override
    public AbstractTubeImpl copy(TubeCloner cloner) {
        return new ServerSideTube(cloner.copy(next), wsdlPort);
    }
}
{% endhighlight %}

Kliens oldalra hasonló osztály gyártható. Látszik, hogy SOAPHandler helyett Packet objektumot kapunk, amiből elérhető a SOAPMessage, de pl. az *enpointAdress* address. 

A Packet objektum az eredeti feldogozatlan szöveges request-et is tartalmazza. Egy lehetséges buktató, ha az eredeti JAXWS workflow lépéseket egészítettük ki, hogy ott egy adott ponton ez a szöveg át lesz alakítva feldolgozott SOAPMessage objektummá. Bizonyos stream alapú implementációknál azonban ezt csak egyszer lehet megtenni. Ezért pl. a beépített com.sun.xml.ws.util.pipe.DumpTube (ami a standard output-ra tudja kiírni a kimenő és bemenő üzeneteket) lemásolja az üzenetet mielőtt feldolgozná:

{% highlight java %}
packet.getMessage().copy().writeTo(writer);
{% endhighlight %}

Összességében ez még így is egy relatív egyszerű, de gyártó függő megoldás arra az esetre, ha a SOAPHandler-ek nem lennének elegek.

[SPI]: http://en.wikipedia.org/wiki/Service_provider_interface
