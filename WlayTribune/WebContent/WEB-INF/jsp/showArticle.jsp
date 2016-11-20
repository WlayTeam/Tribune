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
<script type="text/javascript" src="./js/jquery-2.1.4.min.js"></script>
<script src="./js/bootstrap/bootstrap.min.js"></script>
<style type="text/css">
@IMPORT url("./css/bootstrap/bootstrap.min.css");

@IMPORT url("./css/index.css");
</style>
</head>
<div id="tp-weather-widget"></div>
<script>
	(function(T, h, i, n, k, P, a, g, e) {
		g = function() {
			P = h.createElement(i);
			a = h.getElementsByTagName(i)[0];
			P.src = k;
			P.charset = "utf-8";
			P.async = 1;
			a.parentNode.insertBefore(P, a)
		};
		T["ThinkPageWeatherWidgetObject"] = n;
		T[n] || (T[n] = function() {
			(T[n].q = T[n].q || []).push(arguments)
		});
		T[n].l = +new Date();
		if (T.attachEvent) {
			T.attachEvent("onload", g)
		} else {
			T.addEventListener("load", g, false)s
		}
	}(window, document, "script", "tpwidget",
			"//widget.thinkpage.cn/widget/chameleon.js"))
</script>
<script>
	tpwidget("init", {
		"flavor" : "bubble",
		"location" : "WTW3SJ5ZBJUY",
		"geolocation" : "enabled",
		"position" : "top-right",
		"margin" : "0px 0px",
		"language" : "en",
		"unit" : "c",
		"theme" : "black",
		"uid" : "UD7A00585E",
		"hash" : "445f809d426a797f237b28ce39fe8877"
	});
	tpwidget("show");
</script>
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
					<li class="active"><a href="${pageContext.request.contextPath }/toIndex">Home</a></li>
					<li><a href="#">Article</a></li>
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
		</div>
	</nav>


	<div style="height: 80px;"></div>



	<div class="container">
		<!-- 右边的栏位 预留 -->


		<div class="row">
			<div class="col-md-8 main-content">
				<article class="post">
					<div class="post-head">
						<div class="post-title">
							<h1>
								<a href="">深入解析OutOfMemoryError</a>
							</h1>
						</div>
					</div>

					<div class="post-meta">
						<span class="author">作者：<a href="#">XX</a></span> &bull;
						<time class="post-date" datetime="2016年7月26日星期二上午9点54分"
							title="2016年7月26日星期二上午9点54分">2016年7月26日</time>
					</div>
					<div class="post-content">
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>


					</div>
				</article>
			</div>
			<div class="col-md-4 sidebar">
				<c:import url="right-display.jsp" />
			</div>

		</div>



	</div>

	<c:import url="footer.jsp" />
</body>
</html>