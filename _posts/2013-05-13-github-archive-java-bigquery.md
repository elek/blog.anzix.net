---
title: Github Java projektek
---

A github nyilvános API-ján keresztül elérhető adatok mind le vannak [archiválva][gitarchive] és az adatok ráadásul elérhetőek a Google [BigQuery][bigquery] rendszeréből is. Persze a Github nem reprezentálja az összes Open Source projektet, különösen a Java világban nem, ahol az apache.org projektek külön világban élnek, valamint talán annak is van hatása, hogy a JDK a mercurial mellett döntött annó, több projektet ismerek, aki ellenáll a trendnek és mercurialt használ (pl. [bitbucket](http://bitbucket.org)-en) Ennek ellenére jó szorakozás megnézni, hogy mi a helyzet a Java-val a GitHub-on.

A csak kicsit korlátozott [BigQuery SQL dialect][sqldialect]-en kiadott query-kre válaszul rögtön ömlik ránk az adat:

Azoknak a repositoryknak a listája, amiket a legtöbben figyeltek és a Github Java-nak detektálta a legtöbb forrást.

{% highlight sql %}
select 
   repository_url,repository_description,max(repository_watchers) as repository_watchers
FROM [githubarchive:github.timeline] 
where
   repository_language = 'Java'
   and repository_owner !=''
group by repository_url,repository_description
order by repository_watchers desc
limit 20;
{% endhighlight %}

&nbsp;



<table class="table table-striped">
<tr><td><a href="repository_url">repository_name</a></td><td>repository_description</td><td>repository_watchers</td></tr>
<tr><td><a href="https://github.com/nathanmarz/storm">storm</a></td><td>"Distributed and fault-tolerant realtime computation: stream processing continuous computation distributed RPC and more"</td><td>5797</td></tr>
<tr><td><a href="https://github.com/elasticsearch/elasticsearch">elasticsearch</a></td><td>"Open Source Distributed RESTful Search Engine"</td><td>3981</td></tr>
<tr><td><a href="https://github.com/JakeWharton/ActionBarSherlock">ActionBarSherlock</a></td><td>Library for implementing the action bar design pattern using the native action bar on Android 4.0+ and a custom implementation on pre-4.0 through a single API and theme.</td><td>3557</td></tr>
<tr><td><a href="https://github.com/phonegap/phonegap-plugins">phonegap-plugins</a></td><td>Plugins for use with PhoneGap.</td><td>3049</td></tr>
<tr><td><a href="https://github.com/jfeinstein10/SlidingMenu">SlidingMenu</a></td><td>An Android library that allows you to easily create applications with slide-in menus. You may use it in your Android apps provided that you cite this project and include the license in your app. Thanks!</td><td>2560</td></tr>
<tr><td><a href="https://github.com/facebook/facebook-android-sdk">facebook-android-sdk</a></td><td>Facebook SDK for Android</td><td>2361</td></tr>
<tr><td><a href="https://github.com/clojure/clojure">clojure</a></td><td>The Clojure programming language</td><td>2303</td></tr>
<tr><td><a href="https://github.com/github/android">android</a></td><td>GitHub Android App</td><td>2199</td></tr>
<tr><td><a href="https://github.com/vert-x/vert.x">vert.x</a></td><td>vert.x - Effortless asynchronous application development for the modern web and enterprise</td><td>2080</td></tr>
<tr><td><a href="https://github.com/jenkinsci/jenkins">jenkins</a></td><td>Jenkins Continuous Integration Server</td><td>1960</td></tr>
<tr><td><a href="https://github.com/JakeWharton/Android-ViewPagerIndicator">Android-ViewPagerIndicator</a></td><td>Paging indicator widgets compatible with the ViewPager from the Android Support Library and ActionBarSherlock. Originally based on Patrik Åkerfeldt's ViewFlow.</td><td>1943</td></tr>
<tr><td><a href="https://github.com/Bukkit/CraftBukkit">CraftBukkit</a></td><td>The Minecraft Server Mod API Implementation</td><td>1836</td></tr>
<tr><td><a href="https://github.com/SpringSource/spring-framework">spring-framework</a></td><td>The Spring Framework</td><td>1769</td></tr>
<tr><td><a href="https://github.com/chrisbanes/Android-PullToRefresh">Android-PullToRefresh</a></td><td>Implementation of the Pull-to-Refresh UI Pattern for Android</td><td>1714</td></tr>
<tr><td><a href="https://github.com/tenderlove/nokogiri">nokogiri</a></td><td>"Nokogiri (鋸) is an HTML XML SAX and Reader parser with XPath and CSS selector support."</td><td>1676</td></tr>
<tr><td><a href="https://github.com/cyrilmottier/GreenDroid">GreenDroid</a></td><td>GreenDroid is a development library for the Android platform. It makes UI developments easier and consistent through your applications.</td><td>1666</td></tr>
<tr><td><a href="https://github.com/netty/netty">netty</a></td><td>Netty project - an event-driven asynchronous network application framework</td><td>1665</td></tr>
<tr><td><a href="https://github.com/arduino/Arduino">Arduino</a></td><td>open-source electronics prototyping platform</td><td>1637</td></tr>
<tr><td><a href="https://github.com/junit-team/junit">junit</a></td><td>A programmer-oriented testing framework for Java.</td><td>1567</td></tr>
<tr><td><a href="https://github.com/nostra13/Android-Universal-Image-Loader">Android-Universal-Image-Loader</a></td><td>"Powerful and flexible instrument for asynchronous loading caching and displaying images on Android."</td><td>1540</td></tr>
</table>

Nagy meglepetés nincsen: a projektek mintegy a fele android specifikus, valamit feltünik jó néhány régi motoros is. (jenkins, netty, elasticsearch, junit). A nokogiri-n kicsit lepődtem csak meg, én is használtam, és tényleg nagyon kézreálló library, de nem gondoltam, hogy már mainstream. Az arduino meg AVR-es c++-s fejlesztő eszköz, nem feltétlenül Java tool, de házi bütykölők körében kétségkívül nagyon népszerű. A CraftBukkit-et se tippeltem volna be látatlanban (ez kb egy minecraft server mod konténer), mégis nagyon előkelő helyen van (a sima Bukkit a 30-adik a listán.) 

De ha már kincset vadászunk nézzük meg mi történt év eleje óta (`PARSE_UTC_USEC(repository_created_at) >= PARSE_UTC_USEC('2013-01-01 00:00:00')` a where feltételbe:)

&nbsp;

<table class="table table-stripped">
<tr><td><a href="repository_url">repository_name</a></td><td>repository_description</td><td>repository_watchers</td></tr>
<tr><td><a href="https://github.com/47deg/android-swipelistview">android-swipelistview</a></td><td>An Android List View implementation with support for drawable cells and many other swipe related features</td><td>430</td></tr>
<tr><td><a href="https://github.com/fearofcode/bateman">bateman</a></td><td>Simple stock trading system that optimizes its parameters with particle swarm optimization</td><td>425</td></tr>
<tr><td><a href="https://github.com/Netflix/RxJava">RxJava</a></td><td>RxJava - a library for composing asynchronous and event-based programs using observable sequences for the Java VM.</td><td>391</td></tr>
<tr><td><a href="https://github.com/square/android-times-square">android-times-square</a></td><td>Standalone Android widget for picking a single date from a calendar view.</td><td>378</td></tr>
<tr><td><a href="https://github.com/0xdata/h2o">h2o</a></td><td>"h2o = fast statistical machine learning math runtime for bigdata"</td><td>348</td></tr>
<tr><td><a href="https://github.com/58code/Argo">Argo</a></td><td>58.com轻量级web框架</td><td>346</td></tr>
<tr><td><a href="https://github.com/processing/processing">processing</a></td><td>Source code for the Processing Development Environment (PDE)</td><td>303</td></tr>
<tr><td><a href="https://github.com/jfeinstein10/JazzyViewPager">JazzyViewPager</a></td><td>"An easy to use ViewPager that adds an awesome set of custom swiping animations. Just change your ViewPagers to JazzyViewPagers two more steps and you're good to go!"</td><td>299</td></tr>
<tr><td><a href="https://github.com/redsolution/xabber-android">xabber-android</a></td><td></td><td>289</td></tr>
<tr><td><a href="https://github.com/square/spoon">spoon</a></td><td>Distributing instrumentation tests to all your Androids.</td><td>285</td></tr>
<tr><td><a href="https://github.com/JakeWharton/butterknife">butterknife</a></td><td>"View ""injection"" library for Android."</td><td>282</td></tr>
<tr><td><a href="https://github.com/ManuelPeinado/RefreshActionItem">RefreshActionItem</a></td><td>Android - An action bar item which acts both as a refresh button and as a progress indicator</td><td>278</td></tr>
<tr><td><a href="https://github.com/chrisbanes/photup">photup</a></td><td>photup</td><td>263</td></tr>
<tr><td><a href="https://github.com/chrislacy/TweetLanes">TweetLanes</a></td><td>Tweet Lanes for Android</td><td>249</td></tr>
<tr><td><a href="https://github.com/6wunderkinder/android-sliding-layer-lib">android-sliding-layer-lib</a></td><td></td><td>246</td></tr>
<tr><td><a href="https://github.com/forcedotcom/phoenix">phoenix</a></td><td></td><td>239</td></tr>
<tr><td><a href="https://github.com/astuetz/PagerSlidingTabStrip">PagerSlidingTabStrip</a></td><td>An interactive indicator to navigate between the different pages of a ViewPager</td><td>220</td></tr>
<tr><td><a href="https://github.com/QuantumBadger/RedReader">RedReader</a></td><td>An unofficial open source Reddit client for Android.</td><td>215</td></tr>
<tr><td><a href="https://github.com/lucasr/twoway-view">twoway-view</a></td><td>An AdapterView with support for vertical and horizontal scrolling</td><td>210</td></tr>
<tr><td><a href="https://github.com/LarsWerkman/HoloColorPicker">HoloColorPicker</a></td><td>An Android Holo themed colorpicker designed by Marie Schweiz</td><td>198</td></tr>
</table>

Itt csak az év eleje óta létrehozott projektek vannak, és bár az android dominancia itt is látszik, jóval több az ismeretlenebb, kalandra csábító, felfedezetlen terület. (Az előző lista több mint a felét használtam legalább prototípus szinten, és nagy részéről tudtam, itt csak pislogok...) 

Próbáltam emberre lembontva is megnézni, de sajnos csak a pushok-at lehet látni az API-n keresztül, nem pedig a commit-okat, így az automatikusan publikáló és szinkronizáló felhasználók és CI botok nyernek mégha a commitok nevében nem is ők vannak...

ps: Eredetileg [ez](https://github.com/coyotebush/github-network-analysis) az összesítés adta az ötletet, ami a legnépszerűbb projektek összefüggéseit és forrás nyelvég vizualizálja. A PDF leírásban a bibliográfia részben további remek statisztikák is találhatóak.

[gitarchive]: http://www.githubarchive.org/
[bigquery]: https://bigquery.cloud.google.com/
[sqldialect]: https://developers.google.com/bigquery/docs/query-reference