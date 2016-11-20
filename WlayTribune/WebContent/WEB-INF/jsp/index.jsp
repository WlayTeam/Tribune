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
<script type="text/javascript" src="./js/bootstrap/bootstrap.js"></script>
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
			T.addEventListener("load", g, false)
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
	<div class="dropdown">
		<button class="btn btn-default dropdown-toggle" type="button"
			id="dropdownMenu1" data-toggle="dropdown">
			Dropdown <span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="#">Action</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="#">Another action</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="#">Something else here</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="#">Separated link</a></li>
		</ul>
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
						<li class="active"><a
							href="${pageContext.request.contextPath }/toIndex" class="nava">Home</a></li>
						<li><a href="${pageContext.request.contextPath }/showArticle" class="nava">Article</a></li>
						<li><a href="#News" class="nava">News</a></li>
						<li><a href="#Web" class="nava">web</a></li>
						<li><a href="#Books" class="nava">Books</a></li>
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
			<div class="row">
				<div class="col-md-8 main-content">

					<c:forEach items="${arrticleList }" var="art">


						<article id=98 class="post">

							<div class="post-head">
								<h1 class="post-title">
									<a
										href="${pageContext.request.contextPath }/showArticle?tid=${art.tid}">${art.title}</a>
								</h1>
								<div class="post-meta">
									<span class="author">作者：<a href="#">XX</a></span> &bull;
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
								<a
									href="${pageContext.request.contextPath }/showArticle?tid=${art.tid}"
									class="btn btn-primary">阅读全文</a>
							</div>

							<footer class="post-footer clearfix">
								<div class="pull-left tag-list">
									<i class="fa fa-folder-open-o"></i>

								</div>
								<div class="pull-right share"></div>
							</footer>
						</article>

					</c:forEach>

					<nav style="text-align: center;">
						<ul class="pagination">
							<li class="disabled"><a href="#">&laquo;</a></li>
							<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
							<li class=""><a href="#">2 <span class="sr-only">(current)</span></a></li>
							<li class=""><a href="#">3 <span class="sr-only">(current)</span></a></li>
							<li class=""><a href="#">4 <span class="sr-only">(current)</span></a></li>
							<li class=""><a href="#">5<span class="sr-only">(current)</span></a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-md-4 sidebar">
					<c:import url="right-display.jsp" />
				</div>

			</div>



		</div>

		<c:import url="footer.jsp" />
</body>
</html>