<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>views/mypagelayout.jsp</title>
<!-- jQuery library -->
<script src="${cp }/resources/hd/js/jquery-3.5.1.js"></script>
<!-- Latest compiled JavaScript -->
<script src="${cp }/resources/hd/bootstrap/js/bootstrap.min.js"></script>
<script src="${cp }/resources/hd/js/jquery.slicknav.min.js"></script>
<script src="${cp }/resources/hd/js/owl.carousel.min.js"></script>
<script src="${cp }/resources/hd/js/jquery.nicescroll.min.js"></script>
<script src="${cp }/resources/hd/js/jquery.zoom.min.js"></script>
<script src="${cp }/resources/hd/js/jquery-ui.min.js"></script>
<script src="${cp }/resources/hd/js/main.js"></script>
<!-- Favicon -->
<link href="${cp }/resources/hd/img/favicon.ico" rel="shortcut icon" />
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,300i,400,400i,700,700i"
	rel="stylesheet">
<!-- Stylesheets -->
<link rel="stylesheet"
	href="${cp }/resources/hd/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${cp }/resources/hd/css/font-awesome.min.css" />
<link rel="stylesheet" href="${cp }/resources/hd/css/flaticon.css" />
<link rel="stylesheet" href="${cp }/resources/hd/css/jquery-ui.min.css" />
<link rel="stylesheet" href="${cp }/resources/hd/css/owl.carousel.min.css" />
<link rel="stylesheet" href="${cp }/resources/hd/css/animate.css" />
<link rel="stylesheet" href="${cp }/resources/hd/css_main/login.css" />
<link rel="stylesheet" href="${cp }/resources/hd/css/style.css" />
</head>
<body>
	<div id="wrap">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div class="container">
			<div id="content_header">
				<tiles:insertAttribute name="content_header" />
			</div>
			<div id="content_body_top">
				<tiles:insertAttribute name="content_body_top"/>
			</div>
			<div id="menu">
				<tiles:insertAttribute name="menu" />
			</div>
			
			<div id="content_body">
				<tiles:insertAttribute name="content_body" />
			</div>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>