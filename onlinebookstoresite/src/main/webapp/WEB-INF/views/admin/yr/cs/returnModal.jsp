<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- The Modal -->

<div class="modal-content">

	<!-- Modal Header -->
	<div class="modal-header">
		<h4 class="modal-title">반품 처리 상세정보</h4>
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
								<td><fmt:formatDate value="${vo.borderdate }"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<h5>주문 상품</h5>
				<table class="table">
					<thead>
						<tr>
							<th>책번호</th>
							<th>책이름</th>
							<th>수량</th>
							<th>판매가격</th>
							<th>총 적립 포인트</th>
							<th>총 가격</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${List}">
							<c:set var="point" value="0"/>
							<c:forEach items="${vo.CSAndPaymentBook}" var="book">
								<c:set var="point" value="${point+book.point }"/>
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
								<td colspan="5" align="right">
									<c:out value="${point }"/>
								</td>
								<td colspan="1" align="right">${vo.ordermoney}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<h5>반품 상품</h5>
				<table class="table">
					<thead>
						<tr>
							<th>책번호</th>
							<th>책이름</th>
							<th>수량</th>
							<th>판매가격</th>
							<th>포인트 적립금</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="price" value="0" />
						<c:forEach var="vo" items="${List}">
							<c:set var = "returnPrice" value = "0"/>
							<c:forEach items="${vo.CSAndPaymentBook}" var="book">
								<c:if test="${book.type == 2 }">
									<tr>
										<c:set var="returnPrice" value = "${returnPrice + book.bprice }"/>
										<td class = "paymentbookNum" style="display: none">${book.paymentbook_num}</td>
										<td>${book.bnum}</td>
										<td>${book.btitle}</td>
										<td>${book.count}</td>
										<td>${book.bprice}</td>
										<td>${book.point }</td>
									</tr>
									<tr>
										<td colspan="5" align="right">
											<button type="button" class="btn btn-success btn-md"
												id="pickupBtn" onclick="pickupBtnClick(${book.paymentbook_num})"
												<c:if test = "${vo.CSAndPaymentBook[0].status == 2}">disabled</c:if>>
												수거 완료
											</button>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</c:forEach>
					</tbody>
				</table>

			
				<h5>수거 배송 정보</h5>
				<table class="table">
					<thead>
						<tr>
							<th>수령인</th>
							<th>전화번호</th>
							<th>주소</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${List}">
							<tr>
								<td>${vo.receiver }</td>
								<td>${vo.bphone }</td>
								<td>${vo.baddr }</td>
							</tr>					
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<h5>환불 방식</h5>
		<table class="table">
			<thead>
				<tr>
					<th>환불 예정액</th>
					<th>회수 포인트</th>
					<th>예치금 반환 예상액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<c:out value="${returnPrice}"/>
					</td>
					<td>
						<c:out value="${point}"/>					
					</td>
					<td>
						<c:out value="${returnPrice}"/>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="right" >
							<button type="button" class="btn btn-success btn-md"
								id="giveBtn" onclick = "clickGiveBtn(${List[0].bpaynum },${returnPrice},${point })">예치금 전달</button>
					</td>
				</tr>

			</tbody>
		</table>
	</div>

	<!-- Modal footer -->
	<div class="modal-footer">
		<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	</div>
</div>

<script type="text/javascript">
 
 	function pickupBtnClick(paymentbookNum){
 		console.log("bbbbb : "+paymentbookNum);
 		ajpickUpfunction(paymentbookNum);	
 	}
 	
 
	function clickGiveBtn(bpaynum, returnPrice, point){
		
		//pickupBtn이 여러개일 수도 있으니깐 배열로 해야함
		
		console.log("길이 : " + $("#pickupBtn").length);
		console.log("bpaynum : " + bpaynum);
		console.log("paymentbookNum : " + $(".paymentbookNum").text());
		
		var length = $("#pickupBtn").length;

		$("#pickupBtn").each(function(idx, item){
			
			if($(this).prop("disabled")){
				if(idx == length-1){
					alert("ggggg")
					ajGivefunction(bpaynum,returnPrice, point);
				}
			}else{
				alert("먼저 수거 확인 부터 해주세요~");
			}
		})
	}
	
	
	function ajpickUpfunction(paymentbookNum){
		$.ajax({
			url : "${pageContext.request.contextPath}/cs/returnPickup",
			dataType : "json",
			data : {paymentbookNum : paymentbookNum},
			success : function(data){
				if(data.code == "success"){
					alert("처리 성공 하셨습니다.");
					$("#pickupBtn").prop("disabled",true);
				}else{
					alert("처리 실패 하셨습니다.")					
				}
			}
		})		
	}
	
	function ajGivefunction(bpaynum,returnPrice, point){
		$.ajax({
			url : "${pageContext.request.contextPath}/cs/doReturn",
			dataType : "json",
			data : {bpaynum : bpaynum, paymentbookNum : $(".paymentbookNum").text(), returnPrice : returnPrice, point : point},
			success : function(data){
				if(data.code == "success"){
					alert("처리 성공 하셨습니다.");
					location.href = "${pageContext.request.contextPath}/cs/menu?PageName=2";
				}else{
					alert("처리 실패 하셨습니다.")					
				}
			}
		})	
	}
 		


</script>

