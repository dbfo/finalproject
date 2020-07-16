<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class = "container-fluid">
	<!-- 상단 탭메뉴 -->
	<div class="salesTopMenu">
	
		<input id="tab1" type="radio" name="tabs"  <c:if test="${checked == 'tab1'}"> checked </c:if>><label for="tab1">전체</label>
		<input id="tab2" type="radio" name="tabs" <c:if test="${checked == 'tab2'}"> checked </c:if>><label for="tab2">입금 전 취소</label>
			
		<!-- 취소 -->
		<section id="content1" >
			<jsp:include page="allCancelListTable.jsp" />			
		</section>
		<!-- 입금 전 취소-->
		<section id="content2">
			<jsp:include page="cstables.jsp" />			
		</section>
	</div>
</div>

<script type="text/javascript">
	
	$(function(){
		$('#tab1').click(function(){
			location.href = "${pageContext.request.contextPath}/cs/menu?PageName=1";
		})
		$('#tab2').click(function(){
			location.href = "${pageContext.request.contextPath}/cs/menu?PageName=0";
		})
	})
</script>