<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!-- The Modal -->

    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">주문 리스트</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div class="row">
		<div class="col-md-12">
			<h5>
				주문한 리스트
			</h5>
			<table class="table">
				<thead>
					<tr>
						<th>책번호</th>
						<th>책이름</th>
						<th>수량</th>
						<th>판매가격</th>
						<th>총 가격</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${List}">
						<c:forEach items="${vo.CSAndPaymentBook}" var="book">
								<tr>
									<td>${book.bnum}</td>
									<td>${book.btitle}</td>
									<td>${book.bcount}</td>
									<td>${book.bprice}</td>
									<td></td>
								</tr>
						</c:forEach>
						<tr>
							<td colspan="5" align="right">${vo.ordermoney}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
<!-- 			주소 -->
			<h5>
				배송 정보
			</h5>
			<table class="table">
				<c:forEach var="vo" items = "${List }">
					<tr>
						<th>주문자 이름</th>
						<td>${vo.mname}</td>
					</tr>
					<tr>
						<th>수령인</th>
						<td>${vo.receiver}</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${vo.baddr}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${vo.bphone}</td>
					</tr>
				</c:forEach>
			</table>
			
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<h5>
				취소 리스트
			</h5>
			<table class="table">
				<thead>
					<tr>
						<th>책번호</th>
						<th>책이름</th>
						<th>수량</th>
						<th>판매가격</th>
						<th>총 가격</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="price" value="0"/>
					<c:forEach var="vo" items="${List}">
						<c:forEach items="${vo.CSAndPaymentBook}" var="book">
							<c:if test="${book.type == 1 }">
								<tr>
									<td>${book.bnum}</td>
									<td>${book.btitle}</td>
									<td>${book.count}</td>
									<td>${book.bprice}</td>
									<td></td>
								</tr>
								<c:set var="price" value="${price+book.bprice }"/>
							</c:if>
						</c:forEach>
					</c:forEach>
					<tr>
						<td colspan="5" align="right"><span style = "color : red"><c:out value="${price }" /></span></td>
					</tr>
				</tbody>
			</table>
			
			 
			<button type="button" class="btn btn-success btn-md"> 승인</button>
			<button type="button" class="btn btn-success btn-md">반려</button>
		</div>
	</div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>

    