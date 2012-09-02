---
layout: post
title: printStackTrace()
tags:
- exception
status: publish
type: post
published: true
meta:
  _edit_last: '2'
---
Régóta tervezem, hogy indítok egy blogot, amiben csak exceptionok vannak. Egy munkahelyi csatorna már van, ahol ilyenekkel bombázom a kolegákat, nem mintha megoldást várnék tőlük, sőt. De úgy gondolom, hogy az exceptionok olyan méltatlanul mellőzőtt ipari képződmények, amik maguk egyszerűségében és monotonitásában valódi művészi értéket hordoznak.

Persze igazából egy stack trace megosztó social site lenne jó. Napi exception, hasonló exceptionnel barátkozó fejlesztők, ismerős exceptionok bejelölése, stb.

Amíg a nagyra törő álmok megvalósulnak, addig is itt egy kategória, ahová mintegy ilusztárcióként feltöltök egy-egy szép darabot.

<pre lang="java">
javax.ejb.EJBException: The bean encountered a non-application exception; nested exception is:
java.lang.reflect.UndeclaredThrowableException
at org.apache.openejb.core.ivm.BaseEjbProxyHandler.convertException(BaseEjbProxyHandler.java:358)
at org.apache.openejb.core.ivm.BaseEjbProxyHandler.invoke(BaseEjbProxyHandler.java:286)
at $Proxy54.existsValami(Unknown Source)
at hu.xxx.xxx.xxx.ValamiServiceV1X0Test.testExistsValami(ValamiServiceV1X0Test.java:59)
at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)
at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)
at java.lang.reflect.Method.invoke(Method.java:597)
at org.junit.runners.model.FrameworkMethod$1.runReflectiveCall(FrameworkMethod.java:44)
at org.junit.internal.runners.model.ReflectiveCallable.run(ReflectiveCallable.java:15)
at org.junit.runners.model.FrameworkMethod.invokeExplosively(FrameworkMethod.java:41)
at org.junit.internal.runners.statements.InvokeMethod.evaluate(InvokeMethod.java:20)
at org.junit.internal.runners.statements.RunBefores.evaluate(RunBefores.java:28)
at org.junit.internal.runners.statements.RunAfters.evaluate(RunAfters.java:31)
at org.junit.runners.BlockJUnit4ClassRunner.runChild(BlockJUnit4ClassRunner.java:73)
at org.junit.runners.BlockJUnit4ClassRunner.runChild(BlockJUnit4ClassRunner.java:46)
at org.junit.runners.ParentRunner.runChildren(ParentRunner.java:180)
at org.junit.runners.ParentRunner.access$000(ParentRunner.java:41)
at org.junit.runners.ParentRunner$1.evaluate(ParentRunner.java:173)
at org.junit.internal.runners.statements.RunBefores.evaluate(RunBefores.java:28)
at org.junit.internal.runners.statements.RunAfters.evaluate(RunAfters.java:31)
at org.junit.runners.ParentRunner.run(ParentRunner.java:220)
at org.apache.maven.surefire.junit4.JUnit4TestSet.execute(JUnit4TestSet.java:62)
at org.apache.maven.surefire.suite.AbstractDirectoryTestSuite.executeTestSet(AbstractDirectoryTestSuite.java:140)
at org.apache.maven.surefire.suite.AbstractDirectoryTestSuite.execute(AbstractDirectoryTestSuite.java:165)
at org.apache.maven.surefire.Surefire.run(Surefire.java:107)
at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)
at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)
at java.lang.reflect.Method.invoke(Method.java:597)
at org.apache.maven.surefire.booter.SurefireBooter.runSuitesInProcess(SurefireBooter.java:289)
at org.apache.maven.surefire.booter.SurefireBooter.main(SurefireBooter.java:993)
Caused by: java.lang.reflect.UndeclaredThrowableException
at $Proxy55.getEM(Unknown Source)
at hu.xxx.xxx.xxx.ValamiServiceV1X0.queryValamiFind(ValamiServiceV1X0.java:52)
at hu.xxx.xxx.xxx.ValamiServiceV1X0.existsValami(ValamiServiceV1X0.java:64)
at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)
at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)
at java.lang.reflect.Method.invoke(Method.java:597)
at org.apache.openejb.core.interceptor.ReflectionInvocationContext$Invocation.invoke(ReflectionInvocationContext.java:158)
at org.apache.openejb.core.interceptor.ReflectionInvocationContext.proceed(ReflectionInvocationContext.java:141)
at org.apache.openejb.core.interceptor.InterceptorStack.invoke(InterceptorStack.java:122)
at org.apache.openejb.core.stateless.StatelessContainer._invoke(StatelessContainer.java:221)
at org.apache.openejb.core.stateless.StatelessContainer.invoke(StatelessContainer.java:174)
at org.apache.openejb.core.ivm.EjbObjectProxyHandler.businessMethod(EjbObjectProxyHandler.java:217)
at org.apache.openejb.core.ivm.EjbObjectProxyHandler._invoke(EjbObjectProxyHandler.java:77)
at org.apache.openejb.core.ivm.BaseEjbProxyHandler.invoke(BaseEjbProxyHandler.java:281)
... 30 more
Caused by: java.io.NotSerializableException: org.apache.openejb.persistence.JtaEntityManager
at java.io.ObjectOutputStream.writeObject0(ObjectOutputStream.java:1156)
at java.io.ObjectOutputStream.writeObject(ObjectOutputStream.java:326)
at org.apache.openejb.core.ivm.BaseEjbProxyHandler.copyObj(BaseEjbProxyHandler.java:501)
at org.apache.openejb.core.ivm.BaseEjbProxyHandler.copy(BaseEjbProxyHandler.java:301)
at org.apache.openejb.core.ivm.BaseEjbProxyHandler.invoke(BaseEjbProxyHandler.java:283)
... 45 more
</pre>

(Élesebb észrevehetik, hogy egy maven által futtato junit tesztből próbálok standalone összerántani egy EJB konténert OpenEJB-vel, hogy konténeren kívül futtathassam az integrációs teszteket. Egyelőre kevés sikerrel)
