<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<style>
#salesManagement {
	width: 1300px;
	height: 1600px;
	border: 1px solid red;
	margin: auto;
}
/*판매관리 상단메뉴css*/
/*
body {
	color: #555;
	background: #eeeeee;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
*/
p {
	margin: 0 0 20px;
	line-height: 1.5;
}

.salesTopMenu {
	width: 1300px;
	height:1550px;
	border:1px solid black;
	/*max-width: 800px;*/
	padding: 50px;
	margin: 0 auto;
	background: #ffffff;
}

.salesTopMenu section {
	display: none;
	padding: 20px 0 0;
	border-top: 1px solid #ddd;
}

/*라디오버튼 숨김*/
.salesTopMenu input[name='tabs'] {
	display: none;
}

.salesTopMenu label {
	display: inline-block;
	margin: 0 0 -1px;
	padding: 15px 25px;
	font-weight: 600;
	text-align: center;
	color: #bbb;
	border: 1px solid transparent;
}

.salesTopMenu label:hover {
	color: #2e9cdf;
	cursor: pointer;
}

/*input 클릭시, label 스타일*/
.salesTopMenu input:checked+label {
	color: #555;
	border: 1px solid #ddd;
	border-top: 2px solid #2e9cdf;
	border-bottom: 1px solid #ffffff;
}

#tab1:checked ~ #content1, 
#tab2:checked ~ #content2, 
#tab3:checked ~	#content3, 
#tab4:checked ~ #content4 {
	display: block;
}
</style>
<script type="text/javascript" src="${cp }/resources/jh/js/jquery-3.2.1.min.js"></script>
<div id="salesManagement">
	<h2>판매관리</h2>
	<!-- 상단 탭메뉴 -->
	<div class="salesTopMenu">
	
		<input id="tab1" type="radio" name="tabs" <c:if test="${tabType==1 }">checked</c:if>><label for="tab1">입금대기중</label> <!--디폴트 메뉴-->
		<input id="tab2" type="radio" name="tabs" <c:if test="${tabType==2 }">checked</c:if>><label for="tab2">입금완료/배송요청</label>
		<input id="tab3" type="radio" name="tabs" <c:if test="${tabType==3 }">checked</c:if>><label for="tab3">배송중/구매확정전</label>
		<input id="tab4" type="radio" name="tabs" <c:if test="${tabType==4 }">checked</c:if>> <label for="tab4">구매확정/정산대기</label>
		
		<!-- 입금대기중 -->
		<section id="content1">
			<jsp:include page="sellerMenu1.jsp"/>
		</section>
		<!-- 입금완료/배송요청 -->
		<section id="content2">
			<jsp:include page="sellerMenu2.jsp"/>
		</section>
		<!-- 배송중/구매확정전 -->
		<section id="content3">
			<jsp:include page="sellerMenu3.jsp"/>
		</section>
		<!-- 구매확정/정산대기 -->
		<section id="content4">
			<p>tab menu4의 내용</p>
		</section>
	</div>
</div>
<script>
	$(function(){
		$("#tab1").click(function(){
			location.href ="${cp}/seller/salesManagement";
		});
		$("#tab2").click(function(){
			location.href ="${cp}/seller/salesManagement2";
		});
		$("#tab3").click(function(){
			location.href ="${cp}/seller/salesManagement3";
		});
	});
</script>