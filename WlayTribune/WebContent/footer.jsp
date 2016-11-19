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

a {
	
}
<!-- reset test-->
.main-footer {
	background: #202020;
	padding: 35px 0 0;
	color: #959595;
}

.title {
	color: #fff;
	border-bottom: 1px solid #303030;
	padding-bottom: 7px;
	margin-top: 0;
	margin-bottom: 21px;
	position: relative;
	font-size: 1.5em;
}

.container {
	background:
}

.title:after {
	content: "";
	width: 90px;
	height: 1px;
	background: #f4645f;
	position: absolute;
	left: 0;
	bottom: -1px;
}

.page-header p {
	padding-left: 8px;
}

.recent-single-post {
	margin-bottom: 14px;
	border-bottom: 1px dashed #303030;
}

.tag-cloud a {
	cursor:pointer	; 
	text-decoration : none;
	border: 1px solid #303030;
	color: #959595;
	display: inline-block;
	line-height: 1.5em;
	margin: 0 7px 7px 0;
	padding: 2px 13px;
	text-decoration: none;
}

.tag-cloud a:hover {
	background: #f4645f;
	color: #fff;
}
.copyright{
border-top:1px solid #303030;
	font-size:13px;
	padding-top:28px;
	padding-bottom:28px;
	text-align:center;
	color:#555;
	background:#111; 
}
</style>
</head>
<body>
	<div class="main-footer">
		<div class="container" style="">
			<div class="row">
				<div class="col-sm-4">
					<h4 class="title">合作伙伴</h4>
					<div class="content recent-post">
						<div class="recent-single-post"><p style="padding-left:25px;">腾讯</p></div>
						<div class="recent-single-post"><p style="padding-left:25px;">Google</p></div>
						<div class="recent-single-post"><p style="padding-left:25px;">阿里巴巴</p></div>
					</div>
				</div>
				<div class="col-sm-4">
					<h4 class="title">我们用到的技术</h4>
					<div class="tag-cloud">
						<a>java</a> <a>html</a> <a>css</a> <a>jsp</a>
						<a>jquery</a>  <a>node.js</a> <a>bootstrap</a></br>
						<a>mysql</a> <a>PHP</a> <a>GitHub</a> <a>jsp</a>
					</div>
				</div>
				<div class="col-sm-4">
					<h4 class="title">联系我们</h4> 
					<div class="content recent-post">
						<p style="padding-left:25px;">StackTc&nbsp;&nbsp;&nbsp;353071437@qq.com</p>
						<p style="padding-left:25px;">LxAshin&nbsp;&nbsp;&nbsp;1965654332@qq.com</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="copyright">
		<div class="container"> 
			<div class="row">
				<div class="col-sm-12">
					<span style="padding-right:10px;">Copyright © Laravel 中文网</span>|
					<span style="padding-right:10px;">京公网安备11010802014853</span>|
					<span style="padding-right:10px;">京公网安备11010802014853</span>|
				</div>
			</div>
		</div>
	</div>
</body>
</html>