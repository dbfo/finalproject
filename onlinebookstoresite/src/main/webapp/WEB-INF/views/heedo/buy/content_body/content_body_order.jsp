<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>상품확인</h2>
<table class="table">
	<thead class="thead-dark" style="table-layout: fixed">
		<tr>
			<th colspan="2">상품명</th>
			<th>판매가</th>
			<th>포인트</th>
			<th>수랑</th>
			<th>합계</th>
			<th>배송일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${list }" >
			<tr data-bnum="${vo.bnum }" data-bcount="${vo.bcount }">
				<td class="imgTd"><img src="${vo.imgpath }" class="orderlistimg"></td>
				<td>${vo.btitle }</td>
				<td>${vo.bprice }원</td><td>${vo.bpoint }</td>
				<td>${vo.bcount }</td>
				<td><strong>${vo.totalvalue }원</strong></td>
				<td>1~2일내 배송</td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td rowspan="2">
				<h5>배송일</h5>
			</td>
			<td colspan="6" >
				<div id="divloc" style="display:inline-block;"><strong>배송지:</strong></div>
				<div id="shipaddr" style="display:inline-block;">
					<span id="landAddr">
					<img src="${cp }/resources/hd/image/addricon_land.gif">
					</span><br>
					<span id="roadAddr">
					<img src="${cp }/resources/hd/image/addricon_road.gif">
					</span>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="6">1-2일내 도착예정....
		</tr>
	</tfoot>
	</table>
	
	<table class="table">
			<tr class="table-secondary">
				<th>총 상품금액</th><th>배송비</th><th>사용포인트</th>
				<td rowspan="2" class="table-danger">
					<strong>최종 결제금액</strong><br>
					<span id="final_payment_price"></span>원
				</td>
			</tr>	
			<tr class="table-secondary">
				<td>${totalprice }원</td><td><span id="ship_charge"></span>원</td>
				<td>
					<span id="use_point"></span>원
					<button type="button" class="btn btn-dark btn-sm disabled" id="point_cancel">취소</button>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="padding:0px;">
					사용가능한 포인트 : <strong><span id="usable_point"></span></strong> 포인트  
					<button type="button"  id="usePbtn" class="btn btn-dark btn-sm" 
							data-toggle="modal" data-target="#modal_point">사용</button>
				</td>
			</tr>
	</table>
	<br><br>
	<h4>배송정보</h4>
	<table class="table">
		<tr>
			<td>배송지</td>
			<td></td>
			<td><strong>주문고객</strong></td>
		</tr>
		<tr>
			<td>이름</td><td><input type="text" id="name" value=""></td><td rowspan="3">ㅎㅇㅎ</td>
		</tr>
		<tr>
			<td>배송주소</td><td></td>
		</tr>
		<tr>
			<td>전화번호</td><td>111-1111-1111</td>
		</tr>
	</table>
<!-- ////////// 포인트사용 모달 //////////////////////// -->
<div class="modal fade" id="modal_point">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">포인트 사용</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        	현재 사용가능한 포인트 <br><input type="text"  id="modal_usablepoint" readonly="readonly"><br>
        	사용할 포인트<br><input type="text" id="modal_usepoint">
        	<button type="button" class="btn btn-dark btn-sm" id="modal_usepointBtn">사용</button><br>
        	남은포인트<br><input type="text" id="modal_remainpoint" readonly="readonly">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      	<button type="button" class="btn btn-dark disabled" id="modal_confirm">확인</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>
<!-- /////////////////////////////////////////////////// -->
<script type="text/javascript">
	$(document).ready(function(){
		shipAddr();
		usablepoint();
		shipCharge();
		finalprice();
	});
	//회원정보의 배송지주소 받아옴.
	var shipAddr=function(){
		$.ajax({
			url:"/finalproject/order/getAddr",
			dataType: "json",
			success:function(data){
				var addr1=data.addr1;
				var addr2=data.addr2;
				var addr3=data.addr3;
				var addr4=data.addr4;
				var addr5=data.addr5;
				var zipcode="("+addr1+")";
				var landaddr=zipcode+" "+addr3+" "+addr4;
				var roadaddr=zipcode+" "+addr2+" "+addr4+" "+addr5;
				$("#landAddr").append(landaddr);
				$("#roadAddr").append(roadaddr);
				$("#use_point").text("0");
			}
		})
	
	}
	//첫실행시 배송비 정함 (상품금액 5만원이상시 배송비 무료 아니면 2500원!)
	var shipCharge=function(){
		var totalprice=${totalprice};
		console.log(totalprice);
		var ship_charge=0;
		if(Number(totalprice)>=50000){
			ship_charge=0;
		}else{
			ship_charge=2500;
		}
		$("#ship_charge").text(ship_charge);                
	}
	//사용가능한 포인트조회.
	var usablepoint=function(){
		$.ajax({
			url:"/finalproject/order/usablepoint",
			dataType:"json",
			type:"post",
			success:function(data){
				var point=data.point;
				$("#usable_point").text(point);
				$("#usePbtn").attr("data-point",point );
			}
		})
	}
	//최종결제금액 계산 함수.
	var finalprice=function(){
		var totalprice=${totalprice};
		var shipcharge=$("#ship_charge").text();
		var usepoint=$("#use_point").text();
		var finalprice=Number(totalprice)+Number(shipcharge)-Number(usepoint);
		$("#final_payment_price").text(finalprice);
	}
	
	// 하단 포인트 사용 버튼 눌렀을때 
	$("#usePbtn").click(function(){
		var point=$("#usable_point").text();
		$("#modal_usablepoint").val(point);
	});
	//사용할 포인트 취소버튼 눌렀을때
	$("#point_cancel").click(function(){
		$("#use_point").text("0");
		$("#usePbtn").removeClass("disabled");
		$(this).addClass("disabled");
		usablepoint();
	})
	
	//모달창에서 포인트 사용버튼눌렀을때
	$("#modal_usepointBtn").click(function(){
		var usablepoint=$("#modal_usablepoint").val();
		var usepoint=Number($("#modal_usepoint").val());
		if(usepoint==""||!(usepoint>0&&usepoint<=usablepoint)){
			console.log("rrrreeettt")
			return;
		}
		var remainpoint=Number(usablepoint)-usepoint;
		console.log(usepoint);
		$("#modal_confirm").removeClass("disabled");
		$("#modal_remainpoint").val(remainpoint);
	});
	//모달창 확인버튼눌렀을때.
	$("#modal_confirm").click(function(){
		var remainpoint=$("#modal_remainpoint").val();
		var usepoint=$("#modal_usepoint").val();
		$("#usable_point").text(remainpoint);
		$("#use_point").text(usepoint);
		$("#point_cancel").removeClass("disabled");
		$("#usePbtn").addClass("disabled");
		$("#modal_point").modal('hide');
		finalprice(); //포인트 사용변경되므로 최종결제금액 재계산
	});
	
	//모달창 닫힐때 초기화작업.
	$('#modal_point').on('hidden.bs.modal', function (e) {
	 	$("#modal_usepoint").val("");
	 	$("#modal_remainpoint").val("");
	 	$("#modal_confirm").addClass("disabled");
	});
</script>