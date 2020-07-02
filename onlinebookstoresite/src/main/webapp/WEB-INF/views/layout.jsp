<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/bootstrap.css"/> 
 
<title>views/layout.jsp</title>
</head>
<body>
<div id="wrap">
	<div id="header">
		<tiles:insertAttribute name="testHeader"/>
	</div>
	<div id="content">
		<tiles:insertAttribute name="testContent"/>
	</div>
	<div id="footer">
		<tiles:insertAttribute name="testFooter"/>
	</div>
</div>
</body>
</html>