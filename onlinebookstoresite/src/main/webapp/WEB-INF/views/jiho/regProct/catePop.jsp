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
	select{
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
<script type="text/javascript" 
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<span>카테고리를 선택해주세요.</span><br><br>
<div id="catebox">
	<div id="bigbox">
		<span>[ 대분류 ]</span>
		<select name="bcataname" size="11" onchange="getsubcate(this.value)">
			<c:forEach var="vo" items="${list}">
					<option value="${vo.bcatenum}">${vo.bcataname}</option>
			</c:forEach>
		</select>
	</div>
	<div id="smallbox">
		<span>[ 소분류 ]</span><br>
		<select name="scatename">
			<option>---선택---</option>
		</select>
	</div>
</div>
<button>추가하기</button>
<script type="text/javascript">
	function getsubcate(bcate) {
		console.log("큰카테:"+bcate);
		$.ajax({
			url:"${pageContext.request.contextPath}/seller/getSmallcate?bcatenum="+bcate,
			dataType:"json",
			success:function(data){
				
			}
		});
	}
</script>