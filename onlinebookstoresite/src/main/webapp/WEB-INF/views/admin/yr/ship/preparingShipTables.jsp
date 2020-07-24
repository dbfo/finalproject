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
							<th><input type="checkbox"></th>
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
								<td rowspan="2"><input type="checkbox" id = "chb" <c:if test = "${vo.paymentbook[0].btype == 2 }">disabled</c:if>></td>
								<td rowspan="1"><select id="courier" name="courier">
										<option value=''>--택배사 선택--</option>
										<option value='cj'>CJ대한통운</option>
										<option value='post'>우체국</option>
										<option value='self'>자체배송</option>
								</select> <br> <input type="text" name="transportNumber"
									id="transportNumber" placeholder="숫자만입력하세요.."> <input
									class="btn btn-success btn-sm" type="button" value="저장"
									name="saveBtn"></td>

								<td rowspan="1"><c:forEach items="${vo.paymentbook}" var="book">
										<c:if test="${book.btype == 2 }">[중고]</c:if>
										<p>${book.btitle}</p>
									</c:forEach></td>
								<td rowspan="1"><c:forEach items="${vo.paymentbook}" var="book">
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
									${vo.bphone }<br> <p class = "addr"> 주소 : ${vo.baddr} </p><br>
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
	
	
	$(function(){
		$('.addr').each(function(idx,item){
			var addr = $(this).text();
			addr =  addr.replace(/\|/g, ' ');
			$(this).text(addr);			
		})
	})
	
	
// 	 입력 확인
	$('input[name=saveBtn]').on('click',function(){
		var index = $('input[name=saveBtn]').index(this);
		
		var tnum = $('input[name=transportNumber]').eq(index).val();
		var courier = $('#courier').eq(index).val();
		var chb = $('#chb').eq(index).prop('checked');
		var bpaynum = $('.bpaynum').eq(index).text();
		
		if(tnum == '' || tnum == null  ){
			alert('송장번호를 입력해주세요..')
			return;
		}
				
		if(!($.isNumeric(tnum))){
			alert('숫자만 입력해주세요..')			
			return;
		}
		
		if(courier == '' || courier == null){
			alert('택배사를 선택해주세요..')			
			return;
		}
		
		if(!chb){
			alert('체크해주세요~')						
			return;
		}
		//택배준비중 -> 택배 중으로 상태 업데이트
		$.ajax({
			url :'${pageContext.request.contextPath}/ship/changeToShipping',
			dataType : "json",
			data : {"bpaynum" : bpaynum},
			success : function(data){
				console.log(data.code);
				if(data.code == "success"){
					alert("배송중으로 상태가 변경되었습니다.")
					window.location.reload();
				}else{
					alert("실패하였습니다.")						
				}
			}			
		})

	})
	
	
	 
	
</script>
