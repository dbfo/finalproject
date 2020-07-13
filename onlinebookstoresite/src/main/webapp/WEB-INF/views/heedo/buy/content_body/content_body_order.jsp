<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>상품확인</h2>
<table class="table">
	<thead class="thead-dark" style="table-layout: fixed">
		<tr>
			<th colspan="2" align="center">상품명</th>
			<th>판매가</th>
			<th>포인트</th>
			<th>수랑</th>
			<th>합계</th>
			<th>배송일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${list }" >
			<tr data-bnum="${vo.bnum }" data-bcount="${vo.bcount }">
				<td class="imgTd"><img src="${vo.imgpath }" class="orderlistimg"></td>
				<td>${vo.btitle }</td>
				<td>${vo.bprice }원</td><td>${vo.bpoint }</td>
				<td>${vo.bcount }</td>
				<td>${vo.totalvalue }</td>
				<td>1~2일내 배송</td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td rowspan="2">
				<strong>배송일</strong>
			</td>
			<td colspan="6" id=""><strong>배송지:<span id="shipping"></span></strong></td>
		</tr>
		<tr>
			<td colspan="6">1-2일내 도착예정....
		</tr>
	</tfoot>
	<br>
	<table class="table">
		<thead>
			<tr class="table-secondary">
				<th>적립전포인트</th><th>적립될포인트</th><th>적립후 포인트</th><th class="text-danger">결제할금액</th>
			</tr>
		</thead>
		<tbody>
			<tr class="table-secondary">
				<td>00000</td><td>${vo.totalpoint }</td><td>00000</td><td>${vo.totalvalue }원</td>
			</tr>
		</tbody>
	</table>
</table>
<script type="text/javascript">
	
</script>