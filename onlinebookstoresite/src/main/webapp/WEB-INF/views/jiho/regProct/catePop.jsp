<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<style>
	#catebox{
		width: 410px;
		height: 400px;
		border: 1px solid red;
		margin: auto;
	}
	#bigbox{
		width: 200px;
		height: 300px;
		border: 1px solid black;
		float: left;
	}
	#bigbox select{
		margin: 15px;
		width: 150px;
	}
	#bigbox span{
		margin: auto;
	}
	#smallbox{
		width: 200px;
		height: 300px;
		border: 1px solid red;
		float: left;
	}
</style>
<span>카테고리를 선택해주세요.</span><br><br>
<div id="catebox">
	<div id="bigbox">
		<span>[ 대분류 ]</span>
		<select name="bcataname" size="11">
			<c:forEach var="vo" items="${list}">
					<option value="${vo.bcatenum}">${vo.bcataname}</option>
			</c:forEach>
		</select>
	</div>
	<div id="smallbox">
		<span>[ 소분류 ]</span>
	</div>
</div>
<input type="button" value="추가하기" class="btn btn-outline-secondary">
