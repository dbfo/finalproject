<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
							<th><input type="checkbox"></th>
							<th>주문번호</th>
							<th>주문일(결제일)</th>
							<th>주문자</th>
							<th>책 제목</th>
							<th>총 실제 결제 금액</th>
							<th>결제수단</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${list }">
							<tr>
								<td><input type="checkbox"  id = "chb"></td>
								<td>${vo.bpaynum}</td>
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
								<td>${vo.mname }</td>
								
								<td>
									<c:forEach items="${vo.paymentbook}" var="book">
										<p>${book.btitle}</p>
									</c:forEach>
								</td>
								
								<td>${vo.bfinalmoney}</td>
								<!-- 결제수단 -->
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
				<input class="btn btn-outline-success" id = "checkBtn" type = "button" value = "입금확인">
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function(){
		
		$('#checkBtn').click(function(){
			var tdArr = new Array();
			var checkbox = $("input[type=checkbox]:checked");
	
			checkbox.each(function(i){
				// checkbox.parent() : checkbox의 부모는 <td>이다.
				// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
				var tr = checkbox.parent().parent().eq(i);
				var td = tr.children();
			
				// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
				var no = td.eq(1).text();
				
				console.log("ggg" + no);
				
				if(no != "주문번호"){
					tdArr.push(no);					
				}
			})
			

			$.ajax({
				url : "${pageContext.request.contextPath}/ship/checkDeposit",
				dataType : "json",
				data : {"bpaynum":tdArr},
				success : function(data){
					console.log(data.code);
					if(data.code == "success"){
						alert("입금확인 되었습니다.")
						window.location.reload();
					}else{
						alert("입금확인에 실패하였습니다.")						
					}
				}			
			
			})
		})
	
	})
</script>