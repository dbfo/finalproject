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
						<option>[--- 대 분류 ---]</option>
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
	<!-- 전체목록출력시 -->
	
	<c:forEach  var="vo" items="${list }" >
	<div id="listwrap">
	<div id="image">

				<a href="bdetail?bnum=${vo.bnum }"> <img
				src="${cp }/resources/imgUpload/${vo.imgsavefilename}" id="thumbnail">
				</a>

	</div>
		<div id="detail">
						<div class="title">
							<a  style="font-size:20px; color:green;" href="bdetail?bnum=${vo.bnum }"> 
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
							<strong>${vo.bprice } 원</strong>
							<span>|</span> <strong class="mileage">${vo.bpoint } p</strong>
							<span>적립</span>
						</div>

						<div class="review_score">
							<!-- 평점 -->
							<img
								src="http://image.kyobobook.co.kr/ink/images/common/ico_commt_01.gif"
								> 
							<strong>조회수&nbsp</strong><span>${vo.bhit }</span>
						</div>
		</div>
		<div id="buycartbtn">
			<button class="btn btn-success"><a href="${cp }/order/directorder?bnum=${vo.bnum}&bcount=1">구매하기</a></button>
			<br>
			<br>
			<button class="btn btn-success" name="cartBtn" onclick="goCart(${vo.bnum})">장바구니</button>
<%-- 			<input type="hidden" name="bnum" value="${vo.bnum}"> --%>
	
		</div>
		</div>
	</c:forEach>

	<div>
<%-- 		<c:if test="${pu.startPageNum != 1 }"> --%>
<%-- 			<a href="/spring10/board/list1?pageNum=${pu.startPageNum - 1 }&field=${pu.rowBlockCount}">&lt;</a> --%>
<%-- 		</c:if> --%>
		
		
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }">
				<button style="border-style: none;border-style: ridge; width: 30px; border-radius: 5px / 5px;">
			 	<a href="list1?pageNum=${i }&field=${field}&keyword=${keyword}">
<%-- 			 	<span style="color:red">${i }</span> --%>
			 	<strong style="color:red">${i }</strong>
			 	</a>
			 	</button>
		 	</c:when>
		 	<c:otherwise>
		 		<button style="border-style: none;width: 30px;border-radius: 5px / 5px;">
			 	<a href="list1?pageNum=${i }&field=${field}&keyword=${keyword}">
<%-- 			 	<span style="color: black">${i }</span> --%>
			 	<strong style="color:black">${i }</strong>
			 	</a>
			 	</button>
		 	</c:otherwise>
	 	</c:choose>
		</c:forEach>
		
<%-- 		<c:if test="${(pu.endPageNum/10) != 0}"> --%>
<%-- 			<a href="/spring10/board/list1?pageNum=${pu.endPageNum+1 }&rowBlockCount=${pu.totalPageCount}">&gt;</a> --%>
<%-- 		</c:if> --%>
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
	
	function goCart(bnum){
		console.log(bnum);
		$.post("${cp }/cart/insert?bnum="+bnum+"&bcount=1", function(data){
			console.log("callback");
			if(data=="success"){
				alert("장바구니에 담았음");
			}else{
				alert("로그인을 해주세요.");
				location.href = "${cp }/login";
			}
		});
	}
	/* 
	$("button[name='cartBtn']").click(function(){
		var bnum=$("input[name='bnum']").val();
		console.log(bnum);
		$.post("${cp }/cart/insert?bnum="+bnum+"&bcount=1", function(data){
			console.log("callback");
			if(data=="success"){
				alert("장바구니에 담았음");
			}else{
				alert("로그인을 해주세요.");
				location.href = "${cp }/login";
			}
		});
	}); */

	function nullable(){
		 var bc3= "[--- 대 분류 ---]" ;
		 var bc2= $("#bcate2 option:selected").val();
		 if(bc2 == bc3) {
			   alert("카테고리 분류를 모두 선택 해 주세요ㅎ");
			   return false; //submit 중지
			  }
		 else{
			 return true;
		 }
	}
	
</script>
