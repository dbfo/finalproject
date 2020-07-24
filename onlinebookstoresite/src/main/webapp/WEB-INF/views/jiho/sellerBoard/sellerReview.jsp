<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<style>
/*리뷰관련 css*/
#sellerReviewMain{
	width: 1300px;
	height: 800px;
	margin:auto;
	border: 1px solid black;
}
/*리뷰 헤더css*/
#reviewHeader{
	width: 1100px;
	height: 200px;
	margin:auto;
	margin-top:30px;
	border: 1px solid red;
    padding-top: 65px;
	background-image: url("${cp}/resources/jh/jhimages/판매자리뷰베너.png");
}
#jumsu{
	font-size: 40px;
	color: #FE2E64;
	margin-left: 825px;
	font-weight: bold;
}
/*리뷰테이블 css*/
#reviewTable{
	width: 1100px;
	height: 500px;
	border: 1px solid green;
	margin: auto;
	margin-top: 20px;
}
#reviewTable a{
	color: black;
}
#reviewTable table{
	text-align: center;
}
</style>
<div id="sellerReviewMain">
	<div id="reviewHeader">
		<span id="jumsu">5점</span>
	</div>
	<div id="reviewTable">
		<a href="">▼ 평점높은순</a>&nbsp<a href="">▼ 평점낮은순</a>
		<table class="table table-bordered">
			<thead class="thead-dark">
				<tr>
					<th style="width: 70px">NO</th>
					<th style="">상품명</th>
					<th style="width: 180px">작성자</th>
					<th style="width: 200px;">평점</th>
					<th width="150px">작성일자</th>
				</tr>
			</thead>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td>번호</td>				
					<td style="text-align: left;">${vo.obname }</td>				
					<td>${vo.mid}</td>				
					<td>
						<c:if test="${vo.sscore==1 }">★</c:if>
						<c:if test="${vo.sscore==2 }">★★</c:if>
						<c:if test="${vo.sscore==3 }">★★★</c:if>
						<c:if test="${vo.sscore==4 }">★★★★</c:if>
						<c:if test="${vo.sscore==5 }">★★★★★</c:if>
					</td>				
					<td><fmt:formatDate value="${vo.sreviewregdate }" pattern="yyyy-MM-dd"/></td>				
				</tr>
			</c:forEach>
		</table>
	</div>
	
</div>