<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2 class="mt-4">list</h2>
<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> 검색결과[0]
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th><input type="checkbox"></th>
						<th>주문일(결제일)</th>
						<th>주문번호</th>
						<th>주문자</th>
						<th>운송장정보</th>
						<th>책 제목</th>
						<th>수량</th>
						<th>판매가</th>
						<th>총 실제 결제 금액</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list }">
						<tr>
							<td><input type="checkbox"></td>
							<td>${vo.borderdate}</td>
							<td>${vo.bpaynum}</td>
							<td>조인해서....이름가져와야하넹</td>
							<td>조인해서...책 제목도 가져와야하넹</td>
							<td>${vo.bfinalmoney}</td>
							<!-- 								결제수단 -->
							<c:choose>
								<c:when test="${vo.methodpayment == 0 }">
									<td>카드</td>
								</c:when>
								<c:when test="${vo.methodpayment == 1 }">
									<td>무통장</td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
    