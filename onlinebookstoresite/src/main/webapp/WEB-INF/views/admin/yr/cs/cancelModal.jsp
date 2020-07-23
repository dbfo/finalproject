<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!-- The Modal -->

    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">취소 처리 상세정보</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div class="row">
		<div class="col-md-12">
			
			<table class="table">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>주문 일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${List}">
						<tr>
							<td id="bpaynum">${vo.bpaynum }</td>							
							<td> <fmt:formatDate value="${vo.borderdate }" pattern="yyyy-MM-dd"/> </td>							
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			
			<h5>
				주문 상품
			</h5>
			<table class="table">
				<thead>
					<tr>
						<th>책번호</th>
						<th>책이름</th>
						<th>수량</th>
						<th>판매가격</th>
						<th>배송비</th>
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
									<td></td>
								</tr>
						</c:forEach>
						<tr>
							<td colspan="5" align="right">배송금액 </td>
							<td colspan="1" align="right">${vo.ordermoney}</td>
						</tr>
					</c:forEach>
				</tbody>
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
						<th>배송비</th>
						<th>취소 가격</th>
						<th>총 취소 예상 가격</th>
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
									<td></td>
									<td></td>
								</tr>
								<c:set var="price" value="${price+book.bprice }"/>
							</c:if>
						</c:forEach>
									
<%-- 						<c:forEach items="${vo.CSAndPaymentBook}" var="book"> --%>
<%-- 							<c:if test="${book.type != 1 }"> --%>
<%-- 								<div id = "newOrderBnum">${book.bnum}</div> --%>
<%-- 							</c:if> --%>
<%-- 							<c:if test="${book.type == 1 }"> --%>
<%-- 								<c:if test="${book.bcount-book.count > 0 }">  --%>
<%-- 									<c:out value="${book.bcount-book.count }"></c:out> --%>
<%-- 									${book.bnum  } --%>
<%-- 								</c:if> --%>
<%-- 							</c:if> --%>
<%-- 						</c:forEach> --%>
						
					</c:forEach>
					<tr>
						<td colspan="5" align="right">배송비</td>
						<td colspan="1" align="right" id = "cancelPrice"><c:out value="${price }" /></span></td>
						<td colspan="1" align="right"><span style = "color : red"><c:out value="${price }" /></span></td>
					</tr>
				</tbody>
			</table>
			
			<div class="row">
			<div class="col-md-12">
			<h5>
				취소 리스트
			</h5>
			<table class="table table-bordered">
					<tr>
						<th>회수 포인트</th>
						<c:forEach var="vo" items="${List}">
							<c:forEach items="${vo.CSAndPaymentBook}" var="book">
								<c:set var="point" value="0"/>
								<c:if test="${book.type == 1 }">
									<c:set var = "point" value = "${point+book.point }"/>
										<td>${point}</td>
								</c:if>
							</c:forEach>
						</c:forEach>
					</tr>
			</table>
			
			 
			<button type="button" class="btn btn-success btn-md" id = "applyBtn">승인</button>
<!-- 			<button type="button" class="btn btn-success btn-md">반려</button> -->

		</div>
	</div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
   
<script type="text/javascript">
	
	$("#applyBtn").click(function () {
		
		alert( $('#bpaynum').text());
		
		$.ajax({
			url : "${pageContext.request.contextPath}/cs/cancelapproval",
			dataType : "json",
			data : {bpaynum : $('#bpaynum').text(), cancelPrice : $('#cancelPrice').text()},
			success : function(data){
				if(data.code == "success"){
					alert("처리 성공 하셨습니다.");
					location.href = "${pageContext.request.contextPath}/cs/menu?PageName=1";
				}else{
					alert("처리 실패 하셨습니다.")					
				}
			}
		})		
	})

</script>
    
    