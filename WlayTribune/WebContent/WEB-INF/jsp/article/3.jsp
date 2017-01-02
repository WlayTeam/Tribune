<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html><body><div class="entry">
 <div class="copyright-area">
  原文出处：
  <a href="http://blog.csdn.net/dm_vincent/article/details/52615532" ref="nofollow" target="_blank">
   dm_vincent
  </a>
 </div>
 <p>
  前三篇文章花了一些笔墨介绍了事务的概念以及在EJB和spring Framework中分别是如何完成事务管理的。之所谓花了比较大的代价来介绍事务主要也是因为不管在什么类型的持久化应用中，都包含下面两个关键点：
 </p>
 <ol>
  <li>
   事务管理
  </li>
  <li>
   对象关系映射(ORM)
  </li>
 </ol>
 <p>
  而JPA主要定义的就是和对象关系映射(ORM)相关的内容。从本篇文章开始，会系统性地介绍JPA的方方面面。
 </p>
 <h2 id="核心概念及其关联关系">
  <a name="t0">
  </a>
  核心概念及其关联关系
 </h2>
 <p>
  首先，当然是介绍最核心最重要的
  <code>
   EntityManager
  </code>
  相关概念。
 </p>
 <p>
  在学习和使用JPA的时候，经常会碰到几类对象：
 </p>
 <ol>
  <li>
   <code>
    EntityManager
   </code>
   以及
   <code>
    PersistenceContext
   </code>
  </li>
  <li>
   <code>
    EntityManagerFactory
   </code>
   以及
   <code>
    PersistenceUnit
   </code>
  </li>
  <li>
   <code>
    Persistence
   </code>
  </li>
 </ol>
 <p>
  他们的名字也比较相似，他们之间的关联关系可以用下面的图进行表示：
 </p>
 <p>
  <img alt="这里写图片描述" src="http://img.blog.csdn.net/20160922001812586" title=""/>
 </p>
 <h3 id="entitymanager-persistencecontext">
  <a name="t1">
  </a>
  EntityManager &amp; PersistenceContext
 </h3>
 <p>
  首先来看看
  <code>
   EntityManager
  </code>
  接口中的几个典型方法的定义：
 </p>
 <pre class="brush: java; gutter: true">public interface EntityManager {
    public void persist(Object entity);
    public &lt;T&gt; T merge(T entity);
    public void remove(Object entity);
    public &lt;T&gt; T find(Class&lt;T&gt; entityClass, Object primaryKey);
    // ......
}</pre>
 <p>
  以上的四个方法分别实现了数据的增删改查(CRUD)操作。它的作用就像一座桥梁，将面向对象和数据库的世界连接起来。在没有调用EntityManager接口中的方法是，一个Java对象就是一个内存中的存在而已，而在调用后它就会被持久到数据库的行列结构中去。
 </p>
 <p>
  那么这些通过
  <code>
   EntityManager
  </code>
  被持久化到数据库中的对象，以及从数据库拉入到内存中的对象，也会同时被一个名为持久化上下文(Persistence Context)所管理，这些被管理的对象统称为受管对象(Managed Object)，每个受管对象都有唯一的ID。至于
  <code>
   EntityManager
  </code>
  和持久化上下文之间的数量关系，一般可以是多对一的，即多个
  <code>
   EntityManager
  </code>
  同时指向一个持久化上下文。这其实很好理解，就是
  <code>
   EntityManager
  </code>
  虽然有多个实例，但是它们背后的持久化上下文却只有一个，这样就保证了多个
  <code>
   EntityManager
  </code>
  所管理的受管对象拥有的ID是唯一的。
 </p>
 <p>
  既然
  <code>
   EntityManager
  </code>
  只是一个接口，那么是谁来负责实现它呢？就是实现了JPA的厂商，比如典型的EclipseLink，hibernate等。
 </p>
 <h3 id="entitymanagerfactory-persistenceunit">
  <a name="t2">
  </a>
  EntityManagerFactory &amp; PersistenceUnit
 </h3>
 <p>
  仍然还是先看看该接口提供的几个典型方法：
 </p>
 <pre class="brush: java; gutter: true">public interface EntityManagerFactory {
    public EntityManager createEntityManager();
    public CriteriaBuilder getCriteriaBuilder();
    public Metamodel getMetamodel();
    // ......
}</pre>
 <p>
  此接口中使用的最为频繁的就是第一个
  <code>
   createEntityManager()
  </code>
  ，它能够创建并返回得到一个
  <code>
   EntityManager
  </code>
  接口的实现。既然是一个用于创建
  <code>
   EntityManager
  </code>
  接口的工厂接口，想必就会有一个用于控制如何生产的配置场所。这个配置场所就是上图中提到的持久化单元(Persistence Unit)。典型的比如在
  <code>
   META-INF
  </code>
  文件夹中创建的
  <code>
   persistence.xml
  </code>
  文件，其中就可以定义一个或者多个持久化单元。
 </p>
 <p>
  那么
  <code>
   EntityManagerFactory
  </code>
  又是通过何种方法得到的呢？这得分两种环境来讨论。
 </p>
 <ol>
  <li>
   JavaEE
  </li>
  <li>
   JavaSE
  </li>
 </ol>
 <p>
  在JavaEE环境下，一般通过依赖注入的方式引入：
 </p>
 <pre class="brush: java; gutter: true">@PersistenceUnit(unitName="unitNameDefinedInPersistenceConfig")
private EntityManagerFactory emf;</pre>
 <p>
  而这里所使用的
  <code>
   PersistenceUnit
  </code>
  结合其
  <code>
   unitName
  </code>
  所代表的就是定义在
  <code>
   META-INF
  </code>
  下
  <code>
   persistence.xml
  </code>
  配置文件中的某些具体配置。这些配置可以是数据库连接参数，也可以是其它JPA配置项，或者具体JPA实现(提供商)的配置项。
 </p>
 <h3 id="persistence">
  <a name="t3">
  </a>
  Persistence
 </h3>
 <p>
  在JavaSE环境下，可以通过
  <code>
   Persistence
  </code>
  类得到具体的
  <code>
   EntityManagerFactory
  </code>
  实现：
 </p>
 <pre class="brush: java; gutter: true">EntityManagerFactory emf = Persistence.createEntityManagerFactory("unitNameDefinedInPersistenceConfig");</pre>
 <p>
  以上便是JPA中和
  <code>
   EntityManager
  </code>
  相关的几个核心概念。它们定义了普通Java对象(POJO)和数据库行记录之间的交互方式。至于普通Java对象(POJO)中的字段和数据库列记录之间的映射，我们将在后续的文章中逐一介绍。
 </p>
 <h3>
  本系列：
 </h3>
 <ul>
  <li>
   <a href="http://www.importnew.com/?p=22559">
    JavaEE – JPA（1）：事务的基础概念
   </a>
  </li>
  <li>
   <a href="http://www.importnew.com/?p=22564">
    JavaEE – JPA（2）：EJB中的事务管理
   </a>
  </li>
  <li>
   <a href="http://www.importnew.com/?p=22570">
    JavaEE – JPA（3）：Spring Framework中的事务管理
   </a>
  </li>
  <li>
   <a href="http://www.importnew.com/?p=22576">
    JavaEE – JPA（4）：EntityManager相关核心概念
   </a>
  </li>
 </ul>
 <!-- BEGIN #author-bio -->
 <!-- END #author-bio -->
</div>
</body></html>