<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Page Content -->
<div class="container" id="main">

	<div class="row">
		<!-- /.col-lg-3 -->

		<div class="col-xl-12">
			<div id="topcate">
<!-- 					<div id="bcate"> -->
<!--                  <form action="list" style="width: 550px; padding: 0px; margin: 0px; margin-left: 43px;"> -->
					<form method="post" action="sbooklist" id="catesearch" name="catesearch2" onsubmit="return nullable()">
					<br>
					<select id="bcate2" name="bcate2" >
						<option>[---대 분류---]</option>
					<c:forEach var="vo" items="${list2 }">	
						<option value="${vo.bcatenum }">${vo.bcataname }</option>
					</c:forEach>
					</select>
					>
					<select id="scate2" name="scate2">
						<option>[---소 분류---]</option>
					</select>

<!-- 				</div> -->
				<div id="search">
					
						<input id="searchv" type="text" name="keyword" value="${keyword }" placeholder="예) 책 제목">
<!-- 						<button>검색</button> -->
				<input id="#searchclick" type="submit" value="검색~">
				</div>
					</form>
					
			</div>
			<br>
			<br>
		</div>
	</div>
	<c:if test="">
	
	</c:if>
	<!--////////////// 책 목록출력시 /////////////////-->
	<c:forEach  var="vo" items="${sbooklist1 }">
	
	<div id="listwrap">
	<div id="image">
				<a href="#"> <img
				src="${cp }/resources/JIMIN/images/광규2.png" id="thumbnail">
				</a>
	</div>
		<div id="detail">
						<div class="title">
							<a  style="font-size:20px; color:green;" href="#"> 
								<strong>
									${vo.btitle }
								</strong>
							</a>
						</div>
						<div class="pub_info">
							<span class="author">${vo.bwriter }</span> | <span class="publication">${vo.bpublisher }</span>
							
							|<fmt:formatDate value="${vo.bpublishdate }" pattern="yyyy-MM-dd" var="regdate"/>
								<span>${regdate }</span>
<%-- 							<span class="publication"> ${vo.bpublishdate } </span> --%>
						</div>

						<div class="price">
							<strong>${vo.bprice }</strong>
							<span>|</span> <strong class="mileage">${vo.bpoint }</strong>
							<span>[10%]</span> <span>적립</span>
						</div>

						<div class="review_score">
							<!-- 평점 -->
							<span class="score"> <strong> [평점자리] </strong>
							</span> <img
								src="http://image.kyobobook.co.kr/ink/images/common/ico_commt_01.gif"
								> <span class="review">리뷰
									<strong>
									[리뷰수]
									</strong>
							</span>
						</div>
		</div>
		<div id="buycartbtn">
			<button class="btn btn-success"><a href="#">구매하기</a></button>
			<br>
			<br>
			<button class="btn btn-success"><a href="#">장바구니</a></button>
		</div>
	</div>
	</c:forEach>

	<div>
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }">
				<button style="border-style: none;border-style: ridge; width: 30px; border-radius: 5px / 5px;">
			 	<a href="sbooklist?pageNum=${i }&scate2=${scatenum}&keyword=${keyword}&bcate2=${bcatenum}">
<%-- 			 	<span style="color:red">${i }</span> --%>
			 	<strong style="color:red">${i }</strong>
			 	</a>
			 	</button>
		 	</c:when>
		 	<c:otherwise>
		 		<button style="border-style: none;width: 30px;border-radius: 5px / 5px;">
			 	<a href="sbooklist?pageNum=${i }&scate2=${scatenum}&keyword=${keyword}&bcate2=${bcatenum}">
<%-- 			 	<span style="color: black">${i }</span> --%>
			 	<strong style="color:black">${i }</strong>
			 	</a>
			 	</button>
		 	</c:otherwise>
	 	</c:choose>
	 	
		</c:forEach>
	</div>
</div>

<script>

	$("#bcate2").change(function(){
		var bval=$(this).val();
		$.ajax({
			
			url:"${cp}/sclist" ,
			data:{bcatenum:bval},
			success:function(data){
				$("#scate2").empty();
// 				$("#scate2").append("<option>---소 분류---</option>")
				$(data).each(function(i,mem){
					$("#scate2").append("<option value='"+ mem.scatenum +"'>"+mem.scataname+"</option>")
				});
				
			}
		});


	});
	
	function nullable(){
		 var sv = document.getElementById("searchv");
		 var bc = document.getElementById("bcate2");
		 if(bc.value == "[---대 분류---]") {
			   alert("조건을 모두 채워주세요ㅋㅋ");
			   return false; //submit 중지
			  }
		 else{
			 return true;
		 }
	}

	
</script>