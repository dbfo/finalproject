<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="container-fluid ">
	<h2 class="mt-4">list</h2>
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>주문번호</th>
							<th>주문일(결제일)</th>
							<th>주문자</th>
							<c:if test="${path == 2}">
								<th><input type="checkbox"></th>
							</c:if>
							<th>책 제목</th>
							<th>수량</th>
							<th>판매가</th>
							<th>총 실제 결제 금액</th>

						</tr>
					</thead>
					<tbody>

						<c:forEach var="vo" items="${list }">
							<tr>
								<td class="bpaynum" rowspan="2">${vo.bpaynum}</td>
								<td rowspan="2">
								<c:choose>
									<c:when test="${tfield == 'bpaydate' }">
										<fmt:formatDate value = "${vo.bpaydate}" pattern="yyyy-MM-dd"/>
									</c:when>
									<c:otherwise>
										<fmt:formatDate value = "${vo.borderdate}" pattern="yyyy-MM-dd"/>									
									</c:otherwise>
								</c:choose>						
								</td>
								<td rowspan="2">${vo.mname }</td>
								<c:if test="${path == 2}">
									<td  rowspan="2"><input type="checkbox"></td>
								</c:if>
								
								<td rowspan="1"><c:forEach items="${vo.paymentbook}"
										var="book">
										<p>${book.btitle}</p>
									</c:forEach></td>
								<td rowspan="1"><c:forEach items="${vo.paymentbook}"
										var="book">
										<p>${book.bcount}</p>
									</c:forEach></td>
								<td rowspan="1"><c:forEach items="${vo.paymentbook}"
										var="book">
										<p>${book.bprice}</p>
									</c:forEach></td>

								<td rowspan="2">${vo.bfinalmoney}</td>
							</tr>
							<tr>
								<td colspan="4">수령인 : ${vo.receiver}<br> 전화번호 :
									${vo.bphone }<br> 주소 : ${vo.baddr}<br>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
<!-- 				배송중일때 -->
				<c:if test="${path == 2}">
					<input class = "btn btn-outline-success" type="button" id = "shipCancelBtn" value = "배송준비중 처리">
					<input class = "btn btn-success" type="button" id= "shipCompleteBtn" value = "배송완료 처리">
				</c:if>
			</div>
		</div>
	</div>
</div>


