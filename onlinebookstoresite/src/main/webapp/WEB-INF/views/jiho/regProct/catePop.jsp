<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<span>카테고리 선택해주세요.</span><br>
<c:forEach var="vo" items="${list}">
	<input type="radio" name="bcatename"><label>${vo.bcatename}</label><br>
</c:forEach>
