<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<title>중고판매관리</title>
</head>
<body>
<div id="wrap">
	<div id="header">
		<tiles:insertAttribute name="sellerHeader"/>
	</div>
	<div id="content">
		<tiles:insertAttribute name="sellerContent"/>
	</div>
	<div id="footer">
		<tiles:insertAttribute name="sellerFooter"/>
	</div>
</div>
</body>
</html>