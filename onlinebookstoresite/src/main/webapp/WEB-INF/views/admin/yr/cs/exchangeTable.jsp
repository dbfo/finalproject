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
<!-- 						교환 -->
						<th>주문일(신청일)</th>
						<th>주문번호</th>
						<th>주문자</th>
						<th>책 제목</th>
						<th>수량</th>
						<th>결제예정금액</th>
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
							<td>
								<c:forEach items="${vo.CSAndPaymentBook}" var="book">
									<c:if test="${book.status == 1 }"> <input class= "btn btn-success" id = "openModal2" type="button"  
									value = "신청 처리"  onclick = "openModal(${vo.bpaynum})"></c:if>
									<c:if test="${book.status == 2 }"> <input class= "btn btn-success" id = "openModal2" type="button"  
									value = "처리 중"  onclick = "openModal(${vo.bpaynum})"></c:if>
									<c:if test="${book.status == 3 }"><input class= "btn btn-secondary" type="button" 
									value = "처리 완료" disabled="disabled"></c:if>
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

<script type="text/javascript">
	
	function openModal(bpaynumId){
		console.log("gggg");
		exchangeModalPopup(bpaynumId);		
	}
	
    function exchangeModalPopup(bpaynum){
        // 팝업 호출 url
        var url = "${pageContext.request.contextPath}/cs/exchangeModal?bpaynum="+bpaynum;
        
        // 팝업 호출
        $("#exchangeModal > .modal-dialog").load(url, function() { 
            $("#exchangeModal").modal("show"); 
        });
    }
</script>

<!-- The Modal -->
<div class="modal" id="exchangeModal">
  <div class="modal-dialog modal-lg">  
  </div>
</div>
    