<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html><body><div class="entry">
 <div class="copyright-area">
  本文由
  <a href="http://www.importnew.com">
   ImportNew
  </a>
  -
  <a href="http://www.importnew.com/author/dust_jead">
   dust_jead
  </a>
  翻译自
  <a class="external" href="http://www.javacodegeeks.com/2014/02/law-of-demeter.html" rel="nofollow" target="_blank">
   javacodegeeks
  </a>
  。欢迎加入
  <a class="external" href="http://group.jobbole.com/category/feedback/trans-team/" rel="nofollow" target="_blank">
   翻译小组
  </a>
  。转载请见文末要求。
 </div>
 <blockquote>
  <p>
   降低耦合度，提高封装……
  </p>
 </blockquote>
 <h1>
  前言
 </h1>
 <p>
  这篇文章中，我想谈一谈
  <em>
   得墨忒耳定律
  </em>
  （Law of Demeter，缩写LoD）。我觉得这个主题对于写出一手简洁、精心设计和易于维护的代码，是极其重要的。
 </p>
 <p>
  根据我的经验，看到这条规则被打破，往往意味着我可以嗅到一股糟糕的设计在其中。而依据此定律去编写/
  <span class="wp_keywordlink">
   <a class="external" href="http://www.amazon.cn/gp/product/B003BY6PLK/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&amp;tag=importnew-23&amp;linkCode=as2&amp;camp=536&amp;creative=3200&amp;creativeASIN=B003BY6PLK" rel="nofollow" target="_blank" title="重构">
    重构
   </a>
  </span>
  ，会使代码改善，清晰易懂且更易于维护。
 </p>
 <h1>
  得墨忒耳定律是什么?
 </h1>
 <p>
  我们从下面这几条基本规则开始:
 </p>
 <blockquote>
  <p>
   得墨忒耳定律－－对象 O 的 M 方法，可以访问/调用如下的：
  </p>
  <ol>
   <li>
    对象 O 本身
   </li>
   <li>
    M 方法的传入参数
   </li>
   <li>
    M 方法中创建或实例化的任意对象
   </li>
   <li>
    对象 O 直接的组件对象
   </li>
   <li>
    在M范围内，可被O访问的全局变量
   </li>
  </ol>
 </blockquote>
 <p>
  （译者注: 上述5条是根据英文版
  <a class="external" href="http://en.wikipedia.org/wiki/Law_of_Demeter#In_object-oriented_programming" rel="nofollow" target="_blank">
   维基百科
  </a>
  ，修正后的更为更准确的说法。与原博文所述略有区别。）
 </p>
 <p>
  这些都是很简单的规则。
 </p>
 <p>
  换言之：每个单元（对象或方法）应当对其他单元只拥有有限的了解。
 </p>
 <h1>
  一些比喻
 </h1>
 <p>
  最常见的比喻是：不要和陌生人说话
 </p>
 <p>
  看看这个：假设我在便利店购物。付款时，我是应该将钱包交给收银员，让她打开并取出钱？还是我直接将钱递给她？
 </p>
 <p>
  再做一个比喻：人可以命令一条狗行走（walk），但是不应该直接指挥狗的腿行走，应该由狗去指挥控制它的腿如何行走。
 </p>
 <h1>
  为什么要遵循这个规则？
 </h1>
 <ul>
  <li>
   我们可以更改一个类，而无需因连锁反应再去改许多其他的（类）。
  </li>
  <li>
   我们可以改变调用的方法，而无需改变其他任何东西。
  </li>
  <li>
   遵从LOD，让测试更容易被构建。我们不必为了模拟而写很多的’when’和各种return。
  </li>
  <li>
   提高了封装和抽象（下文将举例说明）。
  </li>
  <li>
   基本上，我们隐藏了“xx是如何工作的”。
  </li>
  <li>
   让代码更少的耦合。主叫方法只耦合一个对象，而并非所有的内部依赖。
  </li>
  <li>
   它通常会更好地模拟现实世界。想想钱包与付款的那个比喻。
  </li>
 </ul>
 <h1>
  数数那些“.”?
 </h1>
 <p>
  虽然在代码中充斥着许多“.”意味着Lod定律被违反了，但有时“合并这些点”并没有任何意义。比如我们把下面这样代码，
 </p>
 <pre class="brush: shell; gutter: true; first-line: 1; highlight: []; html-script: false">
getEmployee().getChildren().getBirthdays()
</pre>
 <p>
  重构成这样子:
 </p>
 <pre class="brush: shell; gutter: true; first-line: 1; highlight: []; html-script: false">
getEmployeeChildrenBirthdays()
</pre>
 <p>
  这样真的好么，我不确定。
 </p>
 <h1>
  太多包装类
 </h1>
 <p>
  这是不遵从LOD的另一个结果。在这种情况下，我坚信这类的设计需要被重新处理。
 </p>
 <p>
  所以，在编码、清理或重构的过程中，我们要遵循某些常识性的规律。
 </p>
 <h1>
  一个范例
 </h1>
 <p>
  假设有一个Item类，它包含多个属性。每个属性都有一个名称和值。（这是一个多值属性）
 </p>
 <p>
  那最简单的实现就是使用Map。
 </p>
 <pre class="brush: java; gutter: true; first-line: 1; highlight: []; html-script: false">
public class Item {
  private final Map&lt;String, Set&lt;String&gt;&gt; attributes;

  public Item(Map&lt;String, Set&lt;String&gt;&gt; attributes) {
    this.attributes = attributes;
  }
  
  public Map&lt;String, Set&lt;String&gt;&gt; getAttributes() {
    return attributes;
  }
}
</pre>
 <p>
  现在，有一个ItemsSaver类，将使用到Item和其属性：
 </p>
 <pre class="brush: java; gutter: true; first-line: 1; highlight: []; html-script: false">
public class ItemSaver {
  private String valueToSave;
  public ItemSaver(String valueToSave) {
    this.valueToSave = valueToSave;
  }

  public void doSomething(String attributeName, Item item) {
    Set&lt;String&gt; attributeValues = item.getAttributes().get(attributeName);
    for (String value : attributeValues) {
      if (value.equals(valueToSave)) {
        doSomethingElse();
      }
    }
  }

  private void doSomethingElse() {
  }
}
</pre>
 <p>
  我想获取某一个具体属性的时候：
 </p>
 <pre class="brush: java; gutter: true; first-line: 1; highlight: []; html-script: false">
Set&lt;String&gt; attributeValues = item.getAttributes().get(attributeName);
String singleValue = attributeValues.iterator().next();

// String singleValue = item.getAttributes().get(attributeName).iterator().next();
</pre>
 <p>
  很明显，我们遇到一个问题。每当使用Item类的属性时，我们知道了它如何工作，它的内部实现。同时，这也让测试代码难以维护。
 </p>
 <p>
  看一下这个测试用例(测试框架 Mockito)：你可以想象到这是多么难以变更和维护。
 </p>
 <pre class="brush: java; gutter: true; first-line: 1; highlight: []; html-script: false">
Item item = mock(Item.class);
Map&lt;String, Set&lt;String&gt;&gt; attributes = mock(Map.class);
Set&lt;String&gt; values = mock(Set.class);
Iterator&lt;String&gt; iterator = mock(Iterator.class);
when(iterator.next()).thenReturn("the single value");
when(values.iterator()).thenReturn(iterator);
when(attributes.containsKey("the-key")).thenReturn(true);
when(attributes.get("the-key")).thenReturn(values);
when(item.getAttributes()).thenReturn(attributes);
</pre>
 <p>
  可以用真正的Item替代模拟的，但这仍需要创建大量的测试前数据。
 </p>
 <p>
  让我们来回顾一下：
 </p>
 <ul>
  <li>
   我们暴漏了内部实现－－Item类怎样保存它的属性
  </li>
  <li>
   为了使用属性，我们需要从item对象中拿到属性和它的内部实现相关对象（如测试代码中的Set集合values）。
  </li>
  <li>
   如果想改变属性的实现，我们需要更改所有使用Item和其属性的类。这很可能波及多个类。
  </li>
  <li>
   构建的测试繁琐、易错，且需要很多维护。
  </li>
 </ul>
 <h1>
  改进
 </h1>
 <p>
  第一个改进是，把对属性的各种操作，委托给Item类本身。
 </p>
 <pre class="brush: java; gutter: true; first-line: 1; highlight: []; html-script: false">
public class Item {
  private final Map&lt;String, Set&lt;String&gt;&gt; attributes;
  public Item(Map&lt;String, Set&lt;String&gt;&gt; attributes) {
    this.attributes = attributes;
  }

  public boolean attributeExists(String attributeName) {
    return attributes.containsKey(attributeName);
  }

  public Set&lt;String&gt; values(String attributeName) {
    return attributes.get(attributeName);
  }

  public String getSingleValue(String attributeName) {
    return values(attributeName).iterator().next();
  }
}
</pre>
 <p>
  这样，测试便容易多了：
 </p>
 <pre class="brush: java; gutter: true; first-line: 1; highlight: []; html-script: false">
Item item = mock(Item.class);
when(item.getSingleValue("the-key")).thenReturn("the single value");
</pre>
 <p>
  我们几乎将属性相关操作的实现都隐藏了。
 </p>
 <p>
  使用到Item的类，并不知道其内部实现。除了以下两个情形：
 </p>
 <ol>
  <li>
   Item本身仍知道属性被怎样构建。
  </li>
  <li>
   创建Item的类，也知道属性怎样被实现。
  </li>
 </ol>
 <p>
  以上两点意味着，如果我们改变属性的实现（比如变更为不使用map），至少两个其他的类将需要改变。这是
  <strong>
   高耦合
  </strong>
  的一个好例子。
 </p>
 <h1>
  进一步改进
 </h1>
 <p>
  上面的解决方案有时候（通常？）足够。作为务实的程序员，我们需要知道何时停止。然而，来看如何进一步改进第一种方案。
 </p>
 <p>
  创建一个Attributes类：
 </p>
 <pre class="brush: java; gutter: true; first-line: 1; highlight: []; html-script: false">
public class Attributes {
  private final Map&lt;String, Set&lt;String&gt;&gt; attributes;

  public Attributes() {
    this.attributes = new HashMap&lt;&gt;();
  }

  public boolean attributeExists(String attributeName) {
    return attributes.containsKey(attributeName);
  }

  public Set&lt;String&gt; values(String attributeName) {
    return attributes.get(attributeName);
  }
  
  public String getSingleValue(String attributeName) {
    return values(attributeName).iterator().next();
  }

  public Attributes addAttribute(String attributeName, Collection&lt;String&gt; values) {
    this.attributes.put(attributeName, new HashSet&lt;&gt;(values));
    return this;
  }
}
</pre>
 <p>
  然后Item类这样去用它：
 </p>
 <pre class="brush: java; gutter: true; first-line: 1; highlight: []; html-script: false">
public class Item {
  private final Attributes attributes;

  public Item(Attributes attributes) {
    this.attributes = attributes;
  }
  
  public boolean attributeExists(String attributeName) {
    return attributes.attributeExists(attributeName);
  }
  
  public Set&lt;String&gt; values(String attributeName) {
    return attributes.values(attributeName);
  }

  public String getSingleValue(String attributeName) {
    return attributes.getSingleValue(attributeName);
  }
}
</pre>
 <p>
  （注意到了么？Item内属性项的实现被改变，但测试代码无需变更。这是由前面委托的更改导致的。）
 </p>
 <p>
  在第二种解决方案中，我们改进了属性的封装。现在，连Item类自己都不知道它(属性)是如何工作的。
 </p>
 <p>
  现在，我们可以变更属性的实现，而不必修改任何一个其他类。而且可以将属性变为如下任一类实现方式：
 </p>
 <ul>
  <li>
   用Set集合保存一组Value
  </li>
  <li>
   用List列表保存一组Value
  </li>
  <li>
   用你能想到的某种完全不同的数据结构
  </li>
  <li>
   只要所有测试都通过，就一切OK。
  </li>
 </ul>
 <h1>
  我们获得了什么？
 </h1>
 <ul>
  <li>
   代码更容易维护。
  </li>
  <li>
   测试用例更简单且易于维护。
  </li>
  <li>
   代码更加灵活。我们可以随意更改属性项的实现(map, set, list或其他)
  </li>
  <li>
   属性项的修改，不会影响其他代码。甚至不会影响直接使用它(的代码)。
  </li>
  <li>
   模块化和代码重用。可以在其他代码中重用Attributes类。
  </li>
 </ul>
 原文链接：
 <a class="external" href="http://www.javacodegeeks.com/2014/02/law-of-demeter.html" rel="nofollow" target="_blank">
  javacodegeeks
 </a>
 翻译：
 <a href="http://www.importnew.com">
  ImportNew.com
 </a>
 -
 <a href="http://www.importnew.com/author/dust_jead">
  dust_jead
 </a>
 <br/>
 译文链接：
 <a href="http://www.importnew.com/10501.html">
  http://www.importnew.com/10501.html
 </a>
 <br/>
 [
 <span style="color:#ff0000">
  <b>
   转载请保留原文出处、译者和译文链接。
  </b>
 </span>
 ]
 <br/>
 <br/>
 <!-- BEGIN #author-bio -->
 <div id="author-bio">
  <h3 class="widget-title">
   关于作者：
   <a href="http://www.importnew.com/author/dust_jead">
    dust_jead
   </a>
  </h3>
  <div class="alignleft">
   <a href="http://www.importnew.com/author/dust_jead">
    <img alt="dust_jead" class="photo" height="80" src="http://www.importnew.com/wp-content/uploads/userphoto/99.thumbnail.jpeg" width="80"/>
   </a>
  </div>
  <p>
   Java Developer，关注web开发。新浪微博：
   <a class="external" href="http://weibo.com/u/1951093517" rel="nofollow" target="_blank">
    @dust_jead
   </a>
  </p>
  <p>
   <a href="http://www.importnew.com/author/dust_jead" style="text-decoration: none;">
    查看dust_jead的更多文章 &gt;&gt;
   </a>
  </p>
  <div class="clear">
  </div>
 </div>
 <!-- END #author-bio -->
</div>
</body></html>