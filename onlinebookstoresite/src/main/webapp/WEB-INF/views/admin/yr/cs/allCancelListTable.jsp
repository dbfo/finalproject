<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div class="container-fluid">
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
<!-- 						전체 취소 -->
						<th>주문일(신청일)</th>
						<th>주문번호</th>
						<th>주문자</th>
						<th>책 제목</th>
						<th>수량</th>
						<th>결제예정금액</th>
						<th>결제 수단</th>
						<th>처리상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list}">
						<tr>
							<td>
								<fmt:formatDate value = "${vo.borderdate}" pattern="yyyy-MM-dd"/>
							</td>
							<td id = "bpaynumId">${vo.bpaynum}</td>
							<td>${vo.mname }</td>
							<td>
								<c:forEach items="${vo.CSAndPaymentBook}" var="book">
									<p>${book.btitle}</p>
								</c:forEach>
							</td>
							<td>
								<c:forEach items="${vo.CSAndPaymentBook}" var="book">
									<p>${book.count}</p>
								</c:forEach>
							</td>
							<td>${vo.ordermoney }</td>
							<c:choose>
								<c:when test="${vo.methodpayment == 0}">
									<td>카드</td>
								</c:when>
								<c:otherwise>
									<td>무통장 입금</td>
								</c:otherwise>
							</c:choose>
							<td>
								<c:choose>
									<c:when test="${vo.bstatus == 5 || vo.bstatus == 6 }">
										<input class= "btn btn-secondary" type="button" value = "처리 완료" disabled="disabled"> 									
									</c:when>
									<c:otherwise>
										<input class= "btn btn-success" id = "openModal" type="button"  
										value = "신청 처리" onclick = "openModal1(${vo.bpaynum})">
									</c:otherwise>								
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</div>
<script type="text/javascript">
	function openModal1(bpaynumId){
		cancelModalPopup(bpaynumId);		
	}
	
	function cancelModalPopup(bpaynum){
	    // 팝업 호출 url
	    var url = "${pageContext.request.contextPath}/cs/cancelModal?bpaynum="+bpaynum;
	    
	    // 팝업 호출
	    $("#myModal > .modal-dialog").load(url, function() { 
	        $("#myModal").modal("show"); 
	    });
	}
</script>

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog modal-lg">
  </div>
</div>
    