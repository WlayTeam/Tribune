<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
}

.main {
	width: 300px;
	height: 900px;
	border: 1px solid red;
}

.search-swapper {
	position: relative;
	border: 1px solid blue;
	background: #f8f8f8;
	padding: 5px;
}

#search-input {
	border: 1px solid #e8e8e8;
	border-right: none;
	display: block;
	width: 280px;
	height: 28px;
	line-height: 28px;
	padding-right: 29px;
	padding: 0 4px;
}

#search-submit {
	border: 1px solid #e8e8e8;
	border-left: none;
	display: block;
	border: none;
	position: absolute;
	width: 27px;
	height: 27px;
	right: 6px;
	top: 6px;
	background-color: #0099cc;
	background-image: url(image/search.png);
	display: block;
}

#search-submit:hover {
	cursor: pointer;
	background-color: #c32020;
}
</style>
</head>
<body>
	<div class="main">
		<div class="search-swapper">
			<input type="text" id="search-input" placeholder="search" /> <input
				type="submit" value="" id="search-submit" />
		</div>
	</div>

</body>
</html>