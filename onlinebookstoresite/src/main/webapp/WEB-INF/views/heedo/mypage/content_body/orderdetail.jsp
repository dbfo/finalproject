<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<div id="content_history_detail">
	<div>
		<i class="fab fa-first-order-alt"></i><h4 style="display:inline"><span class="colorFont">주문</span>내역</h4>
	</div>
	<br>
	<div id="content_initial">		
		<div class="content_core" id="listDiv">
			<h5><span class="colorFont">주문 상품</span> 정보</h5>
			<table class="table table-borderd" id="listTable">
				<thead >
					<th>상품명</th>
					<th>주문수량</th>
					<th>가격</th>
					<th>포인트</th>
					<th>선택</th>
				</thead>
				<tbody>
					<c:forEach var="bvo" items="${blist }">
						<tr>
							<td>${bvo.btitle }</td>
							<td>${bvo.bcount }</td>
							<td>${bvo.bprice }원</td>
							<td>${bvo.point }</td>
							<td><input type="checkbox"></td>
						</tr>
					</c:forEach>
					
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">합계</td>
						<td>${totalprice }원</td>
						<td>${totalpoint }</td>
						<td></td>
					</tr>
					<c:choose>
					<tr>
					<c:when test="${ ivo.bstatus==0 || ivo.bstatus==1}">
							<td class="btnTd" colspan="5" style="text-align: right;" height="20">
								<button type="button" class="btn btn-dark" id="btnCancel">주문취소</button>
							</td>			
					</c:when>
					<c:when test="${ivo.bstatus==2 ||ivo.bstatus==3}">				
							<td class="btnTd" colspan="5" style="text-align: right;">
								<button type="button" class="btn btn-dark" id="btnReturn">반품신청</button>
							</td>				
					</c:when>
					</tr>
					</c:choose>
					<tr>
						<td colspan="3"></td>
						<td>
							<table class="table table-borderd">
								<tr>
									<td>
										상품 총 금액 : ${totalprice }원<br>
										배송비     : ${ivo.delfee }원<br>
										
									</td>
									<td></td>
									<td>
										적립예정포인트 : ${totalpoint }
									</td>
								</tr>
								<tr>
									<td colspan="3">주문 총 금액 : ${tatalprice+ivo.delfee }원</td>
									
								</tr>
							</table>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
		
		<div class="content_core" id="orderinfoDiv">
			<h5><span class="colorFont">주문</span> 정보</h5>
			<table class="table table-borderd">
				<tr>
					<td>포인트적립일</td>
					<td colspan="3">결제완료 후 지급</td>
				</tr>
				<tr>
					<td>주문번호</td><td>${ivo.bpaynum }</td><td>주문일자</td><td>${ivo.borderdate }</td>
				</tr>
				<tr>
					<td>주문자</td><td>${ivo.mname }</td><td>수령인</td><td>${ivo.receiver }</td>
				</tr>
				<tr>
					<td>전화번호</td><td colspan="3">${ivo.bphone }</td>
				</tr>
				<tr>
					<td>배송주소</td>
					<td colspan="3">
						<img src="${cp }/resources/hd/image/addricon_land.gif">
						<span class="addr">${jibunaddr }</span><br>
						<img src="${cp }/resources/hd/image/addricon_road.gif">
						<span class="addr">${roadaddr }</span>
					</td>
				</tr>
			</table>
		</div>
		
		<div class="content_core" id="payinfoDiv">
			<h5><span class="colorFont">결제</span> 정보</h5>
			<table class="table table-orderd">
				<tr>
					<td>총주문금액</td><td colspan="3">${totalprice+ivo.delfee }원</td>
				</tr>
				<tr>
					<td>사용포인트</td><td>${ivo.usedpoint }</td>
					<td>포인트적립예정액</td><td>${totalpoint }</td>
				</tr>
				<tr>
					<td>결제(할)금액</td><td>${totalprice+ivo.delfee-ivo.usedpoint }원</td>
				</tr>
				<c:choose>
				<c:when test="${ivo.methodpayment==0 }">
					<tr>
						<td>결제</td><td colspan="3">카드결제완료</td>
					</tr> 
				</c:when>
				<c:when test="${ivo.methodpayment==1 }">
					<tr>
						<td>예금주</td><td>${vbvo.vbank_holder }</td><td rowspan="2">입금계좌</td><td rowspan="2">${vbvo.vbank_num }</td>
					</tr>
					<tr>
						<td>입금기한일</td><td>2020/00/00</td>
					</tr>
				</c:when>
				</c:choose>
			</table>
		</div>
		<div id="buttondiv">
			<button type="button" class="btn btn-dark">목록으로</button>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		changeHeight();
	});
	var changeHeight=function(){
		var tr=0;
		$("#listTable > tbody tr").each(function(){
			tr+=1;
		});
		var allHeight=parseInt($("#content_all").css("height"));
		var detailHeight=parseInt($("#content_history_detail").css("height"));
		console.log('all1:'+allHeight);
		console.log('del1:'+detailHeight);
		allHeight+=50*(tr-1);
		detailHeight+=50*(tr-1);
		console.log('all2:'+allHeight);
		console.log('del2:'+detailHeight);
		$("#content_all").css("height",allHeight);
		$("#detailHeight").css("height",detailHeight)
		
	}
	
</script>
<style>
	#content_all{
		height:1280px;
	}
	#content_history_detail{
		height:1200px;
		width:920px;
		border:2px solid black;
	}
	.colorFont{
		color:#e83e8c;
	}
	#content_history_detail{
		padding:5px;
	}
	.content_core{
		padding:10px;
		 border-radius: 8px;
		 box-shadow: 0px 0px 4px grey;
	}
	#listDiv{
		border:1px solid black;
		
	}

	#btnCancel,#btnReturn{
		padding:2px;
		font-size:12px;
		width:80px;
		height:20px;
	}
	#orderinfoDiv{
		border:1px solid blue;
		margin-top: 25px;
	}
	#payinfoDiv{
		border:1px solid red;
		margin-top: 25px;
	}
	#buttondiv{
		margin-top:30px;
		border:1px solid hotpink;
		text-align: center;
	}

</style>