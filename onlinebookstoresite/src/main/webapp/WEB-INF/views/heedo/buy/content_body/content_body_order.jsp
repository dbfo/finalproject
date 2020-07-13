<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table">
	<thead class="thead-dark">
		<tr>
			<th colspan="2">상품명</th>
			<th>판매가</th>
			<th>포인트</th>
			<th>수랑</th>
			<th>합계</th>
			<th>배송일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${list }" >
			<tr>
				<td><img src="${vo.imgpath }" class="orderlistimg"></td>
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
			배송일
			</td>
			<td colspan="6">배송지:.......</td>
		</tr>
		<tr>
			<td colspan="6">1-2일내 도착예정....
		</tr>
	</tfoot>
</table>
<script type="text/javascript">
	
</script>