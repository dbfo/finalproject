<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>views/layout.jsp</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="${cp }/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="${cp }/resources/js/jquery.slicknav.min.js"></script>
<script src="${cp }/resources/js/owl.carousel.min.js"></script>
<script src="${cp }/resources/js/jquery.nicescroll.min.js"></script>
<script src="${cp }/resources/js/jquery.zoom.min.js"></script>
<script src="${cp }/resources/js/jquery-ui.min.js"></script>
<script src="${cp }/resources/js/main.js"></script>
<!-- Favicon -->
<link href="${cp }/resources/img/favicon.ico" rel="shortcut icon"/>
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,300i,400,400i,700,700i" rel="stylesheet">
<!-- Stylesheets -->
<link rel="stylesheet" href="${cp }/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${cp }/resources/css/font-awesome.min.css"/>
<link rel="stylesheet" href="${cp }/resources/css/flaticon.css"/>
<link rel="stylesheet" href="${cp }/resources/css/jquery-ui.min.css"/>
<link rel="stylesheet" href="${cp }/resources/css/owl.carousel.min.css"/>
<link rel="stylesheet" href="${cp }/resources/css/animate.css"/>
<link rel="stylesheet" href="${cp }/resources/css/style.css"/>
<link rel="stylesheet" href="${cp }/resources/css_main/main.css"/>
</head>
<body>
<div id="wrap">
	<div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	<div id="content">
		<tiles:insertAttribute name="content"/>
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</div>
<script>
	
</script>
</body>
</html>