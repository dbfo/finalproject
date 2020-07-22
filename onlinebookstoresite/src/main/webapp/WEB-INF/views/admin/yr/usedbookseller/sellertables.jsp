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
							<th><input type ="checkbox"></th>
							<th>주문일(결제일)</th>
							<th>주문번호</th>
							<th>판매자[판매자 번호]</th>
							<th>책 제목</th>
							<th>구매자[구매자 번호]</th>
							<th>판매 금액</th>
							<th>정산 금액</th>
							<th>처리상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${list }">
							<tr>
								<td >
									<input type = "checkbox"<c:if test = "${vo.bocomstatus == 1}">disabled</c:if>>
								</td>
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
								<td>
									<p>${vo.sellername }</p>
									<u>${vo.seller}</u>
								</td>
								<td>
									<c:forEach items="${vo.obname}" var="book">
										<p> > ${book}</p>
									</c:forEach>
								</td>
								<td>
									<p>${vo.buyername }</p>
									<u>${vo.buyer}</u>
								</td>								
								<td>${vo.fprice}</td>
								<td>${vo.settlement}</td>
								
<!-- 								처리상태 -->
								<c:choose>
									<c:when test="${vo.bocomstatus == 0}">
										<td>처리 요청</td>									
									</c:when>									
									<c:when test="${vo.bocomstatus == 1 }">
										<td>처리 완료</td>									
									</c:when>
								</c:choose>
							</tr>
						</c:forEach>
							<tr>
								<td colspan="9">
									<input id="depositTosellerBtn" type = "button" class = "btn btn-success" value = "요청 처리">
								</td>
							</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	
	$("#depositTosellerBtn").click(function(){
		
		var sellernumArr = new Array();
 		var bpaynumArr = new Array();
 		var priceArr = new Array();
		var checkbox = $("input[type=checkbox]:checked");
		
		checkbox.each(function(i){
			// checkbox.parent() : checkbox의 부모는 <td>이다.
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
		
			var pnum = td.eq(2).text();
			var price = td.eq(6).text();
//  			var sellernum = td.eq(3).text();
  			var std = td.eq(3);
  			var sellernum = std.children().eq(1).text();
 			
  			if(pnum != '주문번호'){
				bpaynumArr.push(pnum);
				sellernumArr.push(sellernum);
				priceArr.push(price);  				
  			}
		
		});
		
// 		console.log( bpaynumArr + "=====" + sellernumArr + " ====== " + priceArr );
		
		ajDepositToSeller(bpaynumArr,sellernumArr, priceArr);
	})
	
	function ajDepositToSeller(bpaynumArr,sellernumArr, priceArr){
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/depositToSeller",
			dataType : "json",
			data : {bpaynum:bpaynumArr, sellernum:sellernumArr, price:priceArr},
			success : function(data){
				//var data=JSON.parse(dataa)
				if(data.code == "success"){
					alert("예치금이 전송 되었습니다.")
					window.location.reload();
				}else{
					alert("예치금 전송에 실패하였습니다.")	
					window.location.reload();
				}
			}		
		})
	}
	
</script>
