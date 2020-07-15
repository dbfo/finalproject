<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookDetail</title>
</head>
<body>
<br>
<br>
	<div  class="container" id="detailallwrap">
		<div id="detailupper">
			<div id="detailinfo">
				<img id="detailbook_img"
				src="${cp }/resources/JIMIN/images/광규2.png" id="thumbnail">
				
				<div id="detailbookNameTitle">
				<strong style="font-size: x-large;">SAVE ME : GRAPHIC LYRICS VOL.2(양장)</strong>
				</div>
				<br>
				<br>
				<div id="detailwriter">
						<span style="font-size: 15px; color: #7d7d7d;">저 자 : </span><strong>[작가이름]</strong>
						ㅣ				
						<span style="font-size: 15px; color: #7d7d7d;">출판사 : </span><strong>[출판사]</strong>
						ㅣ					
						<span style="font-size: 15px; color: #7d7d7d;">등록일 : </span><strong>2020.06.30</strong>
				</div>
				<br>
				<br>
				<div id="detailprice">
						<span style="font-size:17px;color: #7d7d7d; float:left; margin-left: 1px;">판매가</span>
						<span style="font-size: 22px;font-weight: bold ; color: red;float: left;margin-left: 100px;" >
						24,900 원</span>
						<br>
						<br>
						<span style="font-size:17px;color: #7d7d7d; float:left; margin-left: 1px;">적립금</span>
						<span style="font-size: 20px;float: left;margin-left: 100px;" >2490p</span>
						<br>
						<br>
						<span style="font-size:17px;color: #7d7d7d; float:left; margin-left: 1px;">배송비</span>
						<span style="font-size: 20px;float: left;margin-left: 100px;" >2,500원</span>
				</div>
				<br>

				<div id="detailcontent">
				<br>
				<br>
					<strong style="font-size:17px;color: #2E2E2E; float:left; margin-left: 1px;">
					" 최상위 부자 김승호 회장이 직접 밝히는 돈에 통찰과 철학 맨손에서 종잣돈을 만들고 돈을 불리는 75가지 방법 "
					</strong>
				</div>
			</div>
			<div id="detailbtn">
				<button class="btn btn-success btn-lg btn-block"><a href="#">구매하기</a></button>
				<br>
				<br>
				<button class="btn btn-success btn-lg btn-block"><a href="#">장바구니</a></button>
			</div>
		</div>
		
		<div id="detaillower">
		
				<nav>
				  <div class="nav nav-tabs" id="nav-tab" role="tablist">
				    <a class="nav-item nav-link active" id="nav-detail-tab" data-toggle="tab" href="#nav-detail" role="tab" aria-controls="nav-detail" aria-selected="true" style="color: black;border: 1px solid #7d7d7d;"><strong>상세정보</strong></a>
				    <a class="nav-item nav-link" id="nav-qna-tab" data-toggle="tab" href="#nav-qna" role="tab" aria-controls="nav-qna" aria-selected="false" style="color: black;border: 1px solid #7d7d7d;"><strong>QnA</strong></a>
				    <a class="nav-item nav-link" id="nav-review-tab" data-toggle="tab" href="#nav-review" role="tab" aria-controls="nav-review" aria-selected="false" style="color: black;border: 1px solid #7d7d7d;"><strong>리뷰</strong></a>
				  </div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
				  <div class="tab-pane fade show active" id="nav-detail" role="tabpanel" aria-labelledby="nav-detail-tab">
				  	상세정보입니다~~~
				  	상세정보입니다~~~
				  	상세정보입니다~~~
				  	상세정보입니다~~~
				  	상세정보입니다~~~
				  </div>
				  <div class="tab-pane fade" id="nav-qna" role="tabpanel" aria-labelledby="nav-qna-tab">
				  	QnA게시판입니다~~~
				  	QnA게시판입니다~~~
				  	QnA게시판입니다~~~
				  	QnA게시판입니다~~~
				  	QnA게시판입니다~~~
				  </div>
				  <div class="tab-pane fade" id="nav-review" role="tabpanel" aria-labelledby="nav-review-tab">
				  	리뷰게시판입니다~~~
				  	리뷰게시판입니다~~~
				  	리뷰게시판입니다~~~
				  	리뷰게시판입니다~~~
				  	리뷰게시판입니다~~~
				  </div>
				</div>
				
	</div>
</div>
<br>
<br>
</body>
</html>