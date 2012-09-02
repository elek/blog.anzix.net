---
layout: post
title: Java persistence api
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2006/10/java-persistence-api.html
---
A mondás az, hogy azért került be csaj az EJB3 JSR alá, hogy gyorsabban át
lehessen nyomni a processen. Ezzel szembe akár standalone alkalmazásokba is
lehet használni.

A lényege, hogy Pojo entitásokat használ, és egy absztrakt apit definiál,
amivel perzisztálni lehet ezeket. Descriptor helyett pedig annotationok vannak
a Pojoban.

Szép, egyszerű: ide is rakok egy példát az íze kedvéért:

**Az entitás**
    
    
    package jpasample;
    
    import java.io.Serializable;
    
    @javax.persistence.Entity
    public class SampleEntity implements Serializable {
    
        @javax.persistence.Id
        private Long id;
    
        public SampleEntity() {
        }
    
        public Long getId() {
            return id;
        }
    
        public void setId(Long id) {
            this.id = id;
        }
    
        public int hashCode() {
            int hash = 0;
            hash += (this.id != null ? this.id.hashCode() : 0);
            return hash;
        }
    
        public boolean equals(Object object) {
            if (!(object instanceof SampleEntity)) {
                return false;
            }
            SampleEntity other = (SampleEntity)object;
            if (this.id != other.id && (this.id == null ||
                    !this.id.equals(other.id))) return false;
            return true;
        }
    
        public String toString() {
            return "jpasample.SampleEntity[id=" + id + "]";
        }
    
    }
    

**A meghívó program** már egy kicsit bonyolultabb, de csak a tranzakció és kivétel kezelés szórta meg nagyon. 
    
    
    package jpasample;
    
    import javax.persistence.EntityManager;
    import javax.persistence.EntityManagerFactory;
    import javax.persistence.Persistence;
    
    public class Main {
    
        //private static EntityManagerFactory emf =
           Persistence.createEntityManagerFactory("TopLinkPU");
        private static EntityManagerFactory emf =
           Persistence.createEntityManagerFactory("HibernatePU");
    
        public static void main(String[] args) {
            new Main().run();
        }
    
        public void run(){
    
            EntityManager em = emf.createEntityManager();
            SampleEntity entity = em.find(SampleEntity.class,1l);
            if (entity==null){
                System.out.println("nincs ilyen");
                entity = new SampleEntity();
                entity.setId(1l);
                em.getTransaction().begin();
                try {
                    em.persist(entity);
                    em.getTransaction().commit();
                } catch (Exception e) {
                    e.printStackTrace();
                    em.getTransaction().rollback();
                }
            } else {
                 System.out.println("van ilyen");
                 em.getTransaction().begin();
                try {
                    em.remove(entity);
                    em.getTransaction().commit();
                } catch (Exception e) {
                    e.printStackTrace();
                    em.getTransaction().rollback();
                }
    
            }
            em.close();
        }
    }
    

És persze kell hozzá még egy **descriptor** is, hogy melyik Persistence Api
implementációt használjuk:

    
    
    <?xml version="1.0" encoding="UTF-8"?>
    <persistence version="1.0" xmlns="http://java.sun.com/xml/ns/persistence"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://java.sun.com/xml/ns/persistence
    http://java.sun.com/xml/ns/persistence/persistence_1_0.xsd">
        <persistence-unit name="TopLinkPU" transaction-type="RESOURCE_LOCAL">
      <provider>
      oracle.toplink.essentials.ejb.cmp3.EntityManagerFactoryProvider
      </provider>
            <class>jpasample.SampleEntity</class>
            <properties>
                <!--<property name="toplink.jdbc.url" value="jdbc:derby:asd;create=true"/>-->
                <property name="toplink.jdbc.url"
                             value="jdbc:derby:asd"/>
                <property name="toplink.jdbc.user"
                             value=""/>
                <property name="toplink.jdbc.driver"
                             value="org.apache.derby.jdbc.EmbeddedDriver"/>
                <property name="toplink.jdbc.password"
                             value=""/>
                <!--<property name="toplink.ddl-generation"
                             value="create-tables"/>-->
                <property name="toplink.jdbc.url"
                             value="jdbc:derby:asd;create=true"/>
            </properties>
        </persistence-unit>
        <persistence-unit name="HibernatePU"
            transaction-type="RESOURCE_LOCAL">
            <provider>org.hibernate.ejb.HibernatePersistence</provider>
            <class>jpasample.SampleEntity</class>
            <properties>
                <property name="hibernate.connection.url"
                             value="jdbc:derby:asd;create=true"/>
                <property name="hibernate.connection.driver_class"
                             value="org.apache.derby.jdbc.EmbeddedDriver"/>
                <property name="hibernate.connection.password"
                             value=""/>
                <property name="hibernate.connection.username"
                             value=""/>
            </properties>
        </persistence-unit>
    </persistence>
    

A NetBeans (5.5 beta 2), amivel ezekenek a kódoknak a nagyrészét generáltam az
Oracle TopLink Essential-ját használja. De látható, hogy Hibernate Entity
Manager-rel is ment a dolog szépen, csak az EntityManagerFactory
konstruktorában kell más persistence-szre hivatkozni. És ez azért nagy
királyság: kész a program, de még cserélgethetem a persistence megoldást, hogy
megmérjem melyik jobb nekem.

Alapvetően egyébként a JDO is hasonló lehet (múltkor belelapoztam egy
könyvbe), elvileg meg is van ígérve, hogy a két speckót egyesítik. De a JPA
mellett szól az is, hogy az EJB3 pihepuha Entity Bean-jei is ezt használják.

