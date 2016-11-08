<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="image/head.ico" />
<title>WlayTeam Tribune</title>
<script type="text/javascript" src="./js/jquery.js"></script>
<script src="./js/bootstrap/bootstrap.min.js"></script>
<style type="text/css">
@IMPORT url("./css/bootstrap/bootstrap.min.css");
@IMPORT url("./css/index.css");
</style>
</head>
<div id="tp-weather-widget"></div>
<script>(function(T,h,i,n,k,P,a,g,e){g=function(){P=h.createElement(i);a=h.getElementsByTagName(i)[0];P.src=k;P.charset="utf-8";P.async=1;a.parentNode.insertBefore(P,a)};T["ThinkPageWeatherWidgetObject"]=n;T[n]||(T[n]=function(){(T[n].q=T[n].q||[]).push(arguments)});T[n].l=+new Date();if(T.attachEvent){T.attachEvent("onload",g)}else{T.addEventListener("load",g,false)}}(window,document,"script","tpwidget","//widget.thinkpage.cn/widget/chameleon.js"))</script>
<script>tpwidget("init", {
    "flavor": "bubble",
    "location": "WTW3SJ5ZBJUY",
    "geolocation": "enabled",
    "position": "top-right",
    "margin": "0px 0px",
    "language": "en",
    "unit": "c",
    "theme": "black",
    "uid": "UD7A00585E",
    "hash": "445f809d426a797f237b28ce39fe8877"
});
tpwidget("show");</script>
<body>
<body>
	<!-- 	<div class="main_style">
		 <div class="image-style">
			<div class="inner_image">
				<a href="http://www.bing.com/"> <img src="image/logo1.png"
					alt="WlayTeam" width="137px" height="85px">

				</a>
			</div> -->
	<!--  </div>-->
	<!--<div align="center" class="title-style">-->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">WlayTeam</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="${pageContext.request.contextPath }/allArticle">Article</a></li>
					<li><a href="#News">News</a></li>
					<li><a href="#Web">web</a></li>
					<li><a href="#Books">Books</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Code <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Java</a></li>
							<li><a href="#">Python</a></li>
							<li><a href="#">Java Script</a></li>
							<li class="divider"></li>
							<li class="dropdown-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<!-- 			<div class="inner_title"> -->
	<!-- 				<ul class="list"> -->
	<!-- 					<li><a href="#">首页</a></li> -->
	<%-- 					<li><a href="${pageContext.request.contextPath }/allArticle">所有文章</a></li> --%>
	<!-- 					<li><a href="#">资讯</a></li> -->
	<!-- 					<li><a href="#">web</a></li> -->
	<!-- 					<li><a href="#">架构</a></li> -->
	<!-- 					<li><a href="#">基础技术</a></li> -->
	<!-- 					<li><a href="#">书籍</a></li> -->
	<!-- 					<li><a href="#">教程</a></li> -->
	<!-- 					<li><a href="http://group.jobbole.com/category/tech/java/" -->
	<!-- 						target="_blank">java小组</a></li> -->
	<!-- 					<li><a href="http://hao.jobbole.com/?catid=32" target="_blank">工具资源</a></li> -->
	<!-- 				</ul> -->
	<!-- 			</div> -->
	<!--</div>-->
	<div style="height: 80px;"></div>
	<div class="container">
		<!-- 右边的栏位 预留 -->


		<div class="row">
			<div class="col-md-8 main-content">
				<article id=98 class="post">

					<div class="post-head">
						<h1 class="post-title">
							<a href="/moving-to-node-js-v4-lts/">Node.js v4 LTS 成为 Ghost
								推荐版本</a>
						</h1>
						<div class="post-meta">
							<span class="author">作者：<a href="/author/wangsai/">XX</a></span>
							&bull;
							<time class="post-date" datetime="2016年7月26日星期二上午9点54分"
								title="2016年7月26日星期二上午9点54分">2016年7月26日</time>
						</div>
					</div>
					<div class="post-content">
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
					</div>
					<div class="post-permalink" style="float: right">
						<a href="/moving-to-node-js-v4-lts/" class="btn btn-primary">阅读全文</a>
					</div>

					<footer class="post-footer clearfix">
						<div class="pull-left tag-list">
							<i class="fa fa-folder-open-o"></i>

						</div>
						<div class="pull-right share"></div>
					</footer>
				</article>


				<article id=94 class="post">
					<div class="post-head">
						<h1 class="post-title">
							<a href="/ghost-0-7-4-released/">Ghost 0.7.4 正式发布</a>
						</h1>
						<div class="post-meta">
							<span class="author">作者：<a href="/author/wangsai/">XX</a></span>
							&bull;
							<time class="post-date" datetime="2015年12月29日星期二凌晨12点01分"
								title="2015年12月29日星期二凌晨12点01分">2015年12月29日</time>
						</div>
					</div>
					<div class="featured-media">
						<a href="/ghost-0-7-4-released/"><img
							src="http://static.ghostchina.com/image/a/21/de1b2911072f5a4eff82abdb62632.png"
							alt="Ghost 0.7.4 正式发布"></a>
					</div>
					<div class="post-content">
						<p>紧随 Ghost 官方脚步，Ghost 0.7.4 中文正式版发布了！这一版本包含了自 Ghost 0.7.3
							版本发布以来所修正的 bug，主要是针对开放 API 功能的改进。 0.7.1、0.7.2、0.7.3 这些版本哪去了？ 从
							Ghost 0.7.0 版本发布以来，Gh</p>
					</div>
					<div class="post-permalink">
						<a href="/ghost-0-7-4-released/" class="btn btn-primary" style="float: right">阅读全文</a>
					</div>


				</article>


			</div>
			<div class="col-md-4 sidebar">
				<c:import url="right-display.jsp" />
			</div>

		</div>

		<!-- 		<div class="inner_content"> -->
		<!-- 			<div style="height: 90px;"></div> -->
		<!-- 			<div class="suggestedreading"> -->
		<!-- 				<div class="content-title-style"> -->
		<!-- 					<h5>推荐阅读</h5> -->
		<!-- 					<hr align="left" /> -->
		<!-- 				</div> -->

		<!-- 				<div class="suggestedreading_inner"></div> -->
		<!-- 			</div> -->

		<!-- 			<div class="new_article"> -->
		<!-- 				<div class="content-middle-style"> -->
		<!-- 					<h5>最新文章</h5> -->
		<!-- 					<hr align="left" /> -->
		<!-- 				</div> -->
		<!-- 				<div class="content-midele-left"></div> -->
		<!-- 			</div> -->


		<!-- 			<div class="java"> -->
		<!-- 				<div class="content-middle-style"> -->
		<!-- 					<h5>java干货</h5> -->
		<!-- 					<hr align="left" /> -->
		<!-- 				</div> -->
		<!-- 				<div class="content-midele-right"></div> -->
		<!-- 			</div> -->

		<!-- 			<div class="industry_dynamics"> -->
		<!-- 				<div class="content-bottom-style"> -->
		<!-- 					<h5>业界动态</h5> -->
		<!-- 					<hr align="left" /> -->
		<!-- 				</div> -->
		<!-- 				<div class="contet-bottom"></div> -->
		<!-- 			</div> -->

		<!-- 			<div class="base_tic"> -->
		<!-- 				<div class="content-mostbottom-style"> -->
		<!-- 					<h5>基础技术</h5> -->
		<!-- 					<hr align="left" /> -->
		<!-- 				</div> -->
		<!-- 				<div class="contet-mostbottom"></div> -->
		<!-- 			</div> -->



		<!-- 		</div> -->


	</div>



</body>
</html>