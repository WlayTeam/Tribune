<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html><body><div class="entry">
 <div class="copyright-area">
  本文由
  <a href="http://www.importnew.com">
   ImportNew
  </a>
  -
  <a href="http://www.importnew.com/author/markgz">
   MarkGZ
  </a>
  翻译自
  <a class="external" href="http://javabeanz.wordpress.com/2007/06/29/iterator-vs-enumeration/" rel="nofollow" target="_blank">
   javabeanz
  </a>
  。欢迎加入
  <a class="external" href="http://group.jobbole.com/category/feedback/trans-team/" rel="nofollow" target="_blank">
   翻译小组
  </a>
  。转载请见文末要求。
 </div>
 <p>
  正如大家所知，迭代和枚举主要用于遍历集合对象。枚举可以应用于Vector和Hashtable，迭代主要用于集合对象。
 </p>
 <p>
  迭代与枚举的差异：
  <br/>
  * 枚举比迭代快两倍而且消耗更少的内存。
  <br/>
  * 枚举更适合基本需求，而迭代是相对更安全，
  <br/>
  * 因为在遍历集合的时候，迭代器会阻止其他线程修改集合对象。
  <br/>
  * 如果有其他线程要修改集合对象，会立即抛出ConcurrentModificationException。
  <br/>
  * 我们称其为快速失败迭代器,因为它快速，明了的抛出了异常。
 </p>
 <p>
  下面是代码示例；
 </p>
 <pre class="brush: java; gutter: true; first-line: 1; highlight: []; html-script: false">
Vector &lt;String&gt; aVector = new Vector&lt;String&gt;(); 
aVector.add("I"); 
aVector.add("am"); 
aVector.add("really"); 
aVector.add("good");
Enumeration &lt;String&gt; anEnum = aVector.elements(); 
Iterator &lt;String&gt; anItr  = aVector.iterator();
// Traversal using Iterator 
while(anItr.hasNext()) 
{ 
   if (&lt;someCondition&gt;) 
      // This statement will throw ConcurrentModificationException. 
      // Means, Iterator won't allow object modification while it is 
      // getting traversed. Even in the same thread. 
      aVector.remove(index); 
   
   System.out.println(anItr.next()); 
}
// Traversal using Enumeration 
while(anEnum.hasMoreElements()) 
{ 
   if (&lt;someCondition&gt;) 
      aVector.remove(index); 
   
   System.out.println(anEnum.nextElement()); 
}
</pre>
 <p>
  但是迭代器提供了一种安全的方式,可以迭代过程中删除从底层集合中的元素。
  <br/>
  看下迭代器的实现。Collection的其他实现类支撑了这里的remove()方法。
 </p>
 <pre class="brush: java; gutter: true; first-line: 1; highlight: []; html-script: false">
public interface Iterator 
{ 
   boolean hasNext(); 
   Object next(); 
   void remove(); // Optional 
}
</pre>
 <p>
  上面的程序可以重写为：
 </p>
 <pre class="brush: java; gutter: true; first-line: 1; highlight: []; html-script: false">
while(anItr.hasNext()) 
{ 
   System.out.println(anItr.next());

   if (&lt;someCondition&gt;) 
      anItr.remove();
   // Note: 
   // Before using anItr.remove(), the Iterator should 
   // point to any of its elements. The remove() removes the 
   // element which the Iterator corrently pointing to.
   // Otherwise it will throw IllegalStateException  

}
</pre>
 <p>
  需要注意的是：Iterator.remove()是唯一一种可以在迭代过程中安全修改集合的方式。
  <br/>
  在枚举中，没有安全的方式可以在遍历集合的时候删除元素。
 </p>
 原文链接：
 <a class="external" href="http://javabeanz.wordpress.com/2007/06/29/iterator-vs-enumeration/" rel="nofollow" target="_blank">
  javabeanz
 </a>
 翻译：
 <a href="http://www.importnew.com">
  ImportNew.com
 </a>
 -
 <a href="http://www.importnew.com/author/markgz">
  MarkGZ
 </a>
 <br/>
 译文链接：
 <a href="http://www.importnew.com/10492.html">
  http://www.importnew.com/10492.html
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
   <a href="http://www.importnew.com/author/markgz">
    MarkGZ
   </a>
  </h3>
  <div class="alignleft">
   <a href="http://www.importnew.com/author/markgz">
   </a>
  </div>
  <p>
   （新浪微博：
   <strong>
    <a class="external" href="http://weibo.com/u/1909784152" rel="nofollow" target="_blank">
     @VS_SELF
    </a>
   </strong>
   ）
  </p>
  <p>
   <a href="http://www.importnew.com/author/markgz" style="text-decoration: none;">
    查看MarkGZ的更多文章 &gt;&gt;
   </a>
  </p>
  <div class="clear">
  </div>
 </div>
 <!-- END #author-bio -->
</div>
</body></html>