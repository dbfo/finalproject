<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid">
	<h2 class="mt-4">주문 리스트</h2>
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
							<th>주문일(결제일)</th>
							<th>주문번호</th>
							<th>주문자</th>
							<th>책 제목</th>
							<th>총 실제 결제 금액</th>
							<th>결제수단</th>
							<th>배송상태</th>
							<th>cs주문상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${list }">
							<tr>
								<td>
									<c:choose>
										<c:when test="${tfield == 'bpaydate' }">
											<fmt:formatDate value = "${vo.bpaydate}" pattern="yyyy-MM-dd"/>
										</c:when>								
										<c:otherwise>
											<fmt:formatDate value = "${vo.borderdate}" pattern="yyyy-MM-dd"/>									
										</c:otherwise>
									</c:choose>
								</td>
								<td>${vo.bpaynum}</td>
								<td>${vo.mname }</td>
								<td>
									<c:forEach items="${vo.paymentbook}" var="book">
										 <c:if test="${book.btype == 2 }">
										 	<p>[중고]</p>
										 </c:if>
										<p>${book.btitle}</p>									
									</c:forEach>
								</td>
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
<!-- 								배송상태 -->
								<c:choose>
									<c:when test="${vo.bstatus == 0 || vo.bstatus == 1 }">
										<td>배송전</td>									
									</c:when>									
									<c:when test="${vo.bstatus == 2 }">
										<td>배송중</td>									
									</c:when>
									<c:when test="${vo.bstatus == 3 || vo.bstatus == 4 }">
										<td>배송완료</td>									
									</c:when>
									<c:otherwise>
										<td></td>
									</c:otherwise>
								</c:choose>
<!-- 								cs type -->
								<td>
									<c:forEach items="${vo.paymentbook}" var="book">
										<c:choose>
											<c:when test="${book.type == 1}">
												<p>취소</p>									
											</c:when>									
											<c:when test="${book.type == 2 }">
												<p>반품</p>									
											</c:when>
											<c:when test="${book.type == 3 }">
												<p>교환</p>									
											</c:when>
											<c:otherwise>
												<p></p>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
