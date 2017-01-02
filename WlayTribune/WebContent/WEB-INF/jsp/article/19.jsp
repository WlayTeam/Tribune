<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html><body><div class="entry">
 <div class="copyright-area">
  原文出处：
  <a href="http://www.cnblogs.com/xrq730/p/5454381.html" ref="nofollow" target="_blank">
   五月的仓颉
  </a>
 </div>
 <p>
  <strong>
   前言
  </strong>
 </p>
 <p>
  前一篇文章《
  <a href="http://www.importnew.com/?p=22807">
   MyBatis（5）：MyBatis集成Spring事务管理（上）
  </a>
  》复习了MyBatis的基本使用以及使用Spring管理MyBatis的事务的做法，本文的目的是在这个的基础上稍微做一点点的进阶：多数据的事务处理。文章内容主要包含两方面：
 </p>
 <p>
  1、单表多数据的事务处理
 </p>
 <p>
  2、多库/多表多数据的事务处理
 </p>
 <p>
  这两种都是企业级开发中常见的需求，有一定的类似，在处理的方法与技巧上又各有不同，在进入文章前，先做一些准备工作，因为后面会用到多表的插入事务管理，前面的文章建立了一个Student相关表及类，这里再建立一个Teacher相关的表及类。第一步是建立一张Teacher表：
 </p>
 <div>
  <pre class="brush: sql; gutter: true">create table teacher
(
    teacher_id    int            auto_increment,
    teacher_name  varchar(20)    not null,
    primary key(teacher_id)
)</pre>
 </div>
 <p>
  建立teacher_mapper.xml：
 </p>
 <div>
  <pre class="brush: xml; gutter: true">&lt;?xml version="1.0" encoding="UTF-8" ?&gt;
&lt;!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
"http://mybatis.org/dtd/mybatis-3-mapper.dtd" &gt;

&lt;mapper namespace="TeacherMapper"&gt;
    &lt;resultMap type="Teacher" id="TeacherMap"&gt;
        &lt;id column="teacher_id" property="teacherId" jdbcType="INTEGER" /&gt;
        &lt;result column="teacher_name" property="teacherName" jdbcType="VARCHAR" /&gt;
    &lt;/resultMap&gt;

    &lt;select id="selectAllTeachers" resultMap="TeacherMap"&gt;
        select teacher_id, teacher_name from teacher;
    &lt;/select&gt;

    &lt;insert id="insertTeacher" useGeneratedKeys="true" keyProperty="teacher_id" parameterType="Teacher"&gt;
        insert into teacher(teacher_id, teacher_name) values(null, #{teacherName, jdbcType=VARCHAR});
    &lt;/insert&gt;
&lt;/mapper&gt;</pre>
 </div>
 <p>
  建立Teacher.java：
 </p>
 <div>
  <pre class="brush: java; gutter: true">public class Teacher
{
    private int        teacherId;
    private String    teacherName;

    public int getTeacherId()
    {
        return teacherId;
    }

    public void setTeacherId(int teacherId)
    {
        this.teacherId = teacherId;
    }

    public String getTeacherName()
    {
        return teacherName;
    }

    public void setTeacherName(String teacherName)
    {
        this.teacherName = teacherName;
    }

    public String toString()
    {
        return "Teacher{teacherId:" + teacherId + "], [teacherName:" + teacherName + "}";
    }
}</pre>
 </div>
 <p>
  还是再次提醒一下，推荐重写toString()方法，打印关键属性。不要忘了在config.xml里面给Teacher.java声明一个别名：
 </p>
 <div>
  <pre class="brush: xml; gutter: true">&lt;?xml version="1.0" encoding="UTF-8" ?&gt;
&lt;!DOCTYPE configuration PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
"http://mybatis.org/dtd/mybatis-3-config.dtd"&gt;

&lt;configuration&gt;
    &lt;typeAliases&gt;
        &lt;typeAlias alias="Student" type="org.xrq.domain.Student" /&gt;
        &lt;typeAlias alias="Teacher" type="org.xrq.domain.Teacher" /&gt;
    &lt;/typeAliases&gt;
&lt;/configuration&gt;</pre>
 </div>
 <p>
  接着是TeacherDao.java接口：
 </p>
 <div>
  <pre class="brush: java; gutter: true">public interface TeacherDao
{
    public List&lt;Teacher&gt; selectAllTeachers();
    public int insertTeacher(Teacher teacher);
}</pre>
 </div>
 <p>
  其实现类TeacherDaoImpl.java：
 </p>
 <div>
  <pre class="brush: java; gutter: true">@Repository
public class TeacherDaoImpl extends SqlSessionDaoSupport implements TeacherDao
{
    private static final String NAMESPACE = "TeacherMapper.";

    @Resource
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory)
    {
        super.setSqlSessionFactory(sqlSessionFactory);
    }

    public List&lt;Teacher&gt; selectAllTeachers()
    {
        return getSqlSession().selectList(NAMESPACE + "selectAllTeachers");
    }

    public int insertTeacher(Teacher teacher)
    {
        return getSqlSession().insert(NAMESPACE + "insertTeacher", teacher);
    }
}</pre>
 </div>
 <p>
  OK，这样准备工作就全部做完了，有需要的朋友可以实际去把TeacherDao中的方法正确性先验证一下，下面进入文章的内容。
 </p>
 <p>
  <strong>
   单表事务管理
  </strong>
 </p>
 <p>
  有一个很常见的需求，在同一张表里面，我想批量插入100条数据，但是由于这100条数据之间存在一定的相关性，只要其中任何一条事务的插入失败，之前插入成功的数据就全部回滚，这应当如何实现？这里有两种解决方案：
 </p>
 <p>
  1、使用MyBatis的批量插入功能
 </p>
 <p>
  2、使用Spring管理事务，任何一条数据插入失败
 </p>
 <p>
  由于我们限定的前提是单表，因此比较推荐的是
  <strong>
   第一种做法
  </strong>
  。
 </p>
 <p>
  第二种做法尽管也可以实现我们的目标，但是每插入一条数据就要发起一次数据库连接，即使使用了数据库连接池，但在性能上依然有一定程度的损失。而使用MyBatis的批量插入功能，只需要发起一次数据库的连接，这100次的插入操作在MyBatis看来是一个整体，其中任何一个插入的失败都将导致整体插入操作的失败，即：
  <strong>
   要么全部成功，要么全部失败
  </strong>
  。
 </p>
 <p>
  下面来看一下实现，首先在student_mapper.xml中新增一个批量新增的方法&lt;insert&gt;：
 </p>
 <div>
  <pre class="brush: xml; gutter: true">&lt;?xml version="1.0" encoding="UTF-8" ?&gt;
&lt;!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
"http://mybatis.org/dtd/mybatis-3-mapper.dtd" &gt;

&lt;mapper namespace="StudentMapper"&gt;
    &lt;resultMap type="Student" id="StudentMap"&gt;
        &lt;id column="student_id" property="studentId" jdbcType="INTEGER" /&gt;
        &lt;result column="student_name" property="studentName" jdbcType="VARCHAR" /&gt;
    &lt;/resultMap&gt;

    ...

    &lt;insert id="batchInsert" useGeneratedKeys="true" parameterType="java.util.List"&gt;
        &lt;selectKey resultType="int" keyProperty="studentId" order="AFTER"&gt;  
            SELECT  
            LAST_INSERT_ID()  
        &lt;/selectKey&gt;
        insert into student(student_id, student_name) values
        &lt;foreach collection="list" item="item" index="index" separator=","&gt;
            (#{item.studentId, jdbcType=INTEGER}, #{item.studentName, jdbcType=VARCHAR})
        &lt;/foreach&gt;
    &lt;/insert&gt;
&lt;/mapper&gt;</pre>
 </div>
 <p>
  这里主要是利用MyBatis提供的foreach，对传入的List做了一次遍历，并取得其中的属性进行插入。
 </p>
 <p>
  然后在StudentDao.java中新增一个批量新增的方法batchInsert：
 </p>
 <div>
  <pre class="brush: java; gutter: true">public interface StudentDao
{
    public List&lt;Student&gt; selectAllStudents();
    public int insertStudent(Student student);
    public int batchInsertStudents(List&lt;Student&gt; studentList);
}</pre>
 </div>
 <p>
  StudentDaoImpl.java实现它：
 </p>
 <div>
  <pre class="brush: java; gutter: true">@Repository
public class StudentDaoImpl extends SqlSessionDaoSupport implements StudentDao
{
    private static final String NAMESPACE = "StudentMapper.";

    @Resource
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory)
    {
        super.setSqlSessionFactory(sqlSessionFactory);
    }

    ...

    public int batchInsertStudents(List&lt;Student&gt; studentList)
    {
        return getSqlSession().insert(NAMESPACE + "batchInsert", studentList);
    }
}</pre>
 </div>
 <p>
  接着验证一下，首先drop一下student这张表并重新建一下，然后写一段测试程序：
 </p>
 <div>
  <pre class="brush: java; gutter: true">public class StudentTest
{
    @SuppressWarnings("resource")
    public static void main(String[] args)
    {
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring.xml");
        StudentDao studentDao = (StudentDao)ac.getBean("studentDaoImpl");
        List&lt;Student&gt; studentList = null;

        Student student0 = new Student();
        student0.setStudentName("Smith");
        Student student1 = new Student();
        student1.setStudentName("ArmStrong");
        studentList = new ArrayList&lt;&gt;();
        studentList.add(student0);
        studentList.add(student1);
        studentDao.batchInsertStudents(studentList);

        System.out.println("-----Display students------");
        studentList = studentDao.selectAllStudents();
        for (int i = 0, length = studentList.size(); i &lt; length; i++)
            System.out.println(studentList.get(i));
    }
}</pre>
 </div>
 <p>
  运行结果为：
 </p>
 <div>
  <pre class="brush: text; gutter: true">-----Display students------
Student{[studentId:1], [studentName:Smith]}
Student{[studentId:2], [studentName:ArmStrong]}</pre>
 </div>
 <p>
  看到批量插入成功。
 </p>
 <p>
  从另外一个角度来看，假如我们这么建立这个studentList：
 </p>
 <div>
  <pre class="brush: java; gutter: true">Student student0 = new Student();
student0.setStudentName("Smith");
Student student1 = new Student();
student1.setStudentName(null);
studentList = new ArrayList&lt;&gt;();
studentList.add(student0);
studentList.add(student1);
studentDao.batchInsertStudents(studentList);</pre>
 </div>
 <p>
  故意制造第一条插入OK，第二条插入报错的场景，此时再运行一下程序，程序会抛出异常，即使第一条数据是OK的，依然不会插入。
 </p>
 <p>
  最后，这里是批量插入，批量修改、批量删除也是一样的做法，可以自己试验一下。
 </p>
 <p>
  <strong>
   多库/多表事务管理
  </strong>
 </p>
 <p>
  上面的场景是对于单表的事务管理做法的推荐：实际上这并没有用到事务管理，而是使用MyBatis批量操作数据的做法，目的是为了减少和数据库的交互次数。
 </p>
 <p>
  现在有另外一种场景，我要对单库/多库的两张表（Student表、Teacher表）同时插入一条数据，要么全部成功，要么全部失败，该如何处理？此时明显就不可以使用MyBatis批量操作的方法了，要实现这个功能，可以使用Spring的事务管理。
 </p>
 <p>
  前面文章有讲，Dao层中的方法更多的是一种对数据库的增删改查的原子性操作，而Service层中的方法相当于对这些原子性的操作做一个组合，这里要同时操作TeacherDao、StudentDao中的insert方法，因此建立一个SchoolService接口：
 </p>
 <div>
  <pre class="brush: java; gutter: true">public interface SchoolService
{
    public void insertTeacherAndStudent(Teacher teacher, Student student);
}</pre>
 </div>
 <p>
  写一下这个接口的实现类：
 </p>
 <div>
  <pre class="brush: java; gutter: true">@Service
public class SchoolServiceImpl implements SchoolService
{
    @Resource
    private StudentDao studentDao;

    @Resource
    private TeacherDao teacherDao;

    @Transactional
    public void insertTeacherAndStudent(Teacher teacher, Student student)
    {
        studentDao.insertStudent(student);
        teacherDao.insertTeacher(teacher);
    }
}</pre>
 </div>
 <p>
  这里用到了两个注解，解释一下。
 </p>
 <p>
  （1）@Service注解
 </p>
 <p>
  严格地说这里使用@Service注解不是特别好，因为Service作为服务层，更多的是应该对同一个Dao中的多个方法进行组合，如果要用到多个Dao中的方法，建议应该是放到Controller层中，引入两个Service，这里为了简单，就简单在一个Service中注入了StudentDao和TeacherDao两个了。
 </p>
 <p>
  （2）@Transactional注解
 </p>
 <p>
  这个注解用于开启事务管理，注意@Transactional注解的使用前提是该方法所在的类是一个Spring Bean，因此（1）中的@Service注解是必须的。换句话说，
  <strong>
   假如你给方法加了@Transactional注解却没有给类加@Service、@Repository、@Controller、@Component四个注解其中之一将类声明为一个Spring的Bean，那么对方法的事务管理，是不会起作用的
  </strong>
  。关于@Transactional注解，会在下面进一步解读。
 </p>
 <p>
  接着写一个测试类测试一下：
 </p>
 <div>
  <pre class="brush: java; gutter: true">public class SchoolTest
{
    @SuppressWarnings("resource")
    public static void main(String[] args)
    {
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring.xml");
        SchoolService schoolService = 
                (SchoolService)ac.getBean("schoolServiceImpl");

        Student student = new Student();
        student.setStudentName("Billy");
        Teacher teacher = new Teacher();
        teacher.setTeacherName("Luna");

        schoolService.insertTeacherAndStudent(teacher, student);
    }
}</pre>
 </div>
 <p>
  可以看一下数据库，Student表和Teacher表会同时多一条记录。接着继续从另外一个角度讲，我这么建立Student和Teacher：
 </p>
 <div>
  <pre class="brush: java; gutter: true">Student student = new Student();
student.setStudentName("White");
Teacher teacher = new Teacher();
teacher.setTeacherName(null);</pre>
 </div>
 <p>
  故意制造Teacher报错的场景，此时尽管Student没有问题，但是由于Teacher插入报错，因此Student的插入进行回滚，查看Student表，是不会有student_name为”White”这条记录的。
 </p>
 <p>
  <strong>
   @Transactional注解
  </strong>
 </p>
 <p>
  @Transactional这个注解绝对是Java程序员的一个福音，如果没有@Transactional注解，我们使用配置文件的做法进行声明式事务管理，我网上随便找一段配置文件：
 </p>
 <div>
  <pre class="brush: xml; gutter: true">&lt;!-- 事物切面配置 --&gt;
&lt;tx:advice id="advice" transaction-manager="transactionManager"&gt;
    &lt;tx:attributes&gt;
        &lt;tx:method name="update*" propagation="REQUIRED" read-only="false" rollback-for="java.lang.Exception"/&gt;
        &lt;tx:method name="insert" propagation="REQUIRED" read-only="false"/&gt;
    &lt;/tx:attributes&gt;
&lt;/tx:advice&gt;

&lt;aop:config&gt;
    &lt;aop:pointcut id="testService" expression="execution (* com.baobao.service.MyBatisService.*(..))"/&gt;
    &lt;aop:advisor advice-ref="advice" pointcut-ref="testService"/&gt;
&lt;/aop:config&gt;</pre>
 </div>
 <p>
  这种声明式的做法不得不说非常不好控制以及进行调试，尤其在要进行事务管理的内容不断增多之后，尤其体现出它的不方便。
 </p>
 <p>
  使用@Transactional注解就不一样了，它可以精细到具体的类甚至具体的方法上（区别是
  <strong>
   同一个类，对方法的事务管理配置会覆盖对类的事务管理配置
  </strong>
  ），另外，声明式事务中的一些属性，在@Transaction注解中都可以进行配置，下面总结一下常用的一些属性。
 </p>
 <p>
  <strong>
   （1） @Transactional(propagation = Propagation.REQUIRED)
  </strong>
 </p>
 <p>
  最重要的先说，propagation属性表示的是事务的传播特性，一共有以下几种：
 </p>
 <table border="0">
  <tbody>
   <tr>
    <td>
     <strong>
      事务传播特性
     </strong>
    </td>
    <td>
     <strong>
      作      用
     </strong>
    </td>
   </tr>
   <tr>
    <td>
     Propagation.REQUIRED
    </td>
    <td>
     方法运行时如果已经处在一个事务中，那么就加入到这个事务中，否则自己新建一个事务，REQUIRED是默认的事务传播特性
    </td>
   </tr>
   <tr>
    <td>
     Propagation.NOT_SUPPORTED
    </td>
    <td>
     如果方法没有关联到一个事务，容器不会为它开启一个事务，如果方法在一个事务中被调用，该事务会被挂起直到方法调用结束再继续执行
    </td>
   </tr>
   <tr>
    <td>
     Propagation.REQUIRES_NEW
    </td>
    <td>
     不管是否存在事务，该方法总会为自己发起一个新的事务，如果方法已经运行在一个事务中，则原有事务挂起，新的事务被创建
    </td>
   </tr>
   <tr>
    <td>
     Propagation.MANDATORY
    </td>
    <td>
     该方法只能在一个已经存在的事务中执行，业务方法不能发起自己的事务，如果在没有事务的环境下被调用，容器抛出异常
    </td>
   </tr>
   <tr>
    <td>
     Propagation.SUPPORTS
    </td>
    <td>
     该方法在某个事务范围内被调用，则方法成为该事务的一部分，如果方法在该事务范围内被调用，该方法就在没有事务的环境下执行
    </td>
   </tr>
   <tr>
    <td>
     Propagation.NEVER
    </td>
    <td>
     该方法绝对不能在事务范围内执行，如果在就抛出异常，只有该方法没有关联到任何事务，才正常执行
    </td>
   </tr>
   <tr>
    <td>
     Propagation.NESTED
    </td>
    <td>
     如果一个活动的事务存在，则运行在一个嵌套的事务中。如果没有活动事务，则按REQUIRED属性执行，它只对DataSourceTransactionManager事务管理器有效
    </td>
   </tr>
  </tbody>
 </table>
 <p>
  因此我们可以来简单分析一下上面的insertTeacherAndStudent方法：
 </p>
 <ol>
  <li>
   由于没有指定propagation属性，因此事务传播特性为默认的REQUIRED
  </li>
  <li>
   StudentDao的insertStudent方法先运行，此时没有事务，因此新建一个事务
  </li>
  <li>
   TeacherDao的insertTeacher方法接着运行，此时由于StudentDao的insertStudent方法已经开启了一个事务，insertTeacher方法加入到这个事务中
  </li>
  <li>
   StudentDao的insertStudent方法和TeacherDao的insertTeacher方法组成了一个事务，两个方法要么同时执行成功，要么同时执行失败
  </li>
 </ol>
 <p>
  <strong>
   （2）@Transactional(isolation = Isolation.DEFAULT)
  </strong>
 </p>
 <p>
  事务隔离级别，这个不细说了，可以参看
  <a class="external" href="http://www.cnblogs.com/xrq730/p/5087378.html" rel="nofollow" target="_blank">
   事务
  </a>
  <a class="external" href="http://www.cnblogs.com/xrq730/p/5087378.html" rel="nofollow" target="_blank">
   及事务隔离级别
  </a>
  一文。
 </p>
 <p>
  <strong>
   （3）@Transactional(readOnly = true)
  </strong>
 </p>
 <p>
  该事务是否为一个只读事务，配置这个属性可以提高方法执行效率。
 </p>
 <p>
  <strong>
   （4）@Transactional(rollbackFor = {ArrayIndexOutOfBoundsException.class, NullPointerException.class})
  </strong>
 </p>
 <p>
  遇到方法抛出ArrayIndexOutOfBoundsException、NullPointerException两种异常会回滚数据，
  <strong>
   仅支持RuntimeException的子类
  </strong>
  。
 </p>
 <p>
  <strong>
   （5）@Transactional(noRollbackFor = {ArrayIndexOutOfBoundsException.class, NullPointerException.class})
  </strong>
 </p>
 <p>
  这个和上面的相反，遇到ArrayIndexOutOfBoundsException、NullPointerException两种异常不会回滚数据，同样也是仅支持RuntimeException的子类。对（4）、（5）不是很理解的朋友，我给一个例子：
 </p>
 <div>
  <pre class="brush: java; gutter: true">@Transactional(rollbackForClassName = {"NullPointerException"})
public void insertTeacherAndStudent(Teacher teacher, Student student)
{
    studentDao.insertStudent(student);
    teacherDao.insertTeacher(teacher);
    String s = null;
    s.length();
}</pre>
 </div>
 <p>
  构造Student、Teacher的数据运行一下，然后查看下库里面有没有对应的记录就好了，然后再把rollbackForClassName改为noRollbackForClassName，对比观察一下。
 </p>
 <p>
  <strong>
   （6）@Transactional(rollbackForClassName = {“NullPointerException”})、@Transactional(noRollbackForClassName = {“NullPointerException”})
  </strong>
 </p>
 <p>
  这两个放在一起说了，和上面的（4）、（5）差不多，无非是（4）、（5）是通过.class来指定要回滚和不要回滚的异常，这里是通过字符串形式的名字来制定要回滚和不要回滚的异常。
 </p>
 <p>
  <strong>
   （7）@Transactional(timeout = 30)
  </strong>
 </p>
 <p>
  事务超时时间，单位为秒。
 </p>
 <p>
  <strong>
   （8）@Transactional(value = “tran_1″)
  </strong>
 </p>
 <p>
  value这个属性主要就是给某个事务一个名字而已，这样在别的地方就可以使用这个事务的配置。
 </p>
 <h3>
  本系列：
 </h3>
 <ul>
  <li>
   <a href="http://www.importnew.com/?p=22783">
    MyBatis（1）：MyBatis入门
   </a>
  </li>
  <li>
   <a href="http://www.importnew.com/?p=22789">
    MyBatis（2）：config.xml文件
   </a>
  </li>
  <li>
   <a href="http://www.importnew.com/?p=22795">
    MyBatis（3）：SQL映射
   </a>
  </li>
  <li>
   <a href="http://www.importnew.com/?p=22801">
    MyBatis（4）：动态SQL
   </a>
  </li>
  <li>
   <a href="http://www.importnew.com/?p=22807">
    MyBatis（5）：MyBatis集成Spring事务管理（上）
   </a>
  </li>
  <li>
   <a href="http://www.importnew.com/?p=22816">
    MyBatis（6）：MyBatis集成Spring事务管理（下）
   </a>
  </li>
 </ul>
 <!-- BEGIN #author-bio -->
 <!-- END #author-bio -->
</div>
</body></html>