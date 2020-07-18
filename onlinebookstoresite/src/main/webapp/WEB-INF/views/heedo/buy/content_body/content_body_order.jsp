<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container" style="border:1px solid black">
<!--/////////// 주문상품 리스트 테이블 시작 ///////////////-->
<h4><span style='color:#f51167'>상품</span>확인</h4>
<table class="table" id="productTable">
	<thead class="thead-dark">
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
			<tr data-bnum="${vo.bnum }" data-bcount="${vo.bcount }" data-cartnum="${vo.cartNum }">
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
					<img src="${cp }/resources/hd/image/addricon_land.gif">
					<span id="landAddr" class="addrs">
					</span><span class="addr4 addrs"></span><br>
					<img src="${cp }/resources/hd/image/addricon_road.gif">
					<span id="roadAddr" class="addrs">
					</span><span class="addr4 addrs"></span>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="6">1-2일내 도착예정....
		</tr>
	</tfoot>
</table>
<!--/////////// 주문 상품리스트 테이블 끝 ///////////////-->
<!--/////////// 결제금액,포인트 테이블 시작 ///////////////-->
	<table class="table">
			<tr>
				<th class="table-secondary">총 상품금액</th>
				<th class="table-secondary">배송비</th>
				<th class="table-secondary">사용포인트</th>
				<td rowspan="2" class="table-danger">
					<strong>최종 결제금액</strong><br>
					<span class="final_payment_price"></span>원
				</td>
			</tr>	
			<tr class="table-secondary">
				<td>${totalprice }원</td>
				<td><span id="ship_charge"></span>원</td>
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
<!--/////////// 결제금액,포인트 테이블 끝 ///////////////-->
</div>
	<br>
<!--/////////// 배송정보 테이블 시작 ///////////////--> 
<div class="container" style="border:1px solid black;">
	<h4><span style='color:#f51167'>배송</span>정보</h4>
	<table class="table table-bordered">
		<tr>
			<td class="table-info tableloc" style="width:10%"><strong>배송지</strong></td>
			<td style="width:50%">
				<c:if test="${not empty sessionScope.mid }">
					<div class="form-check-inline">
						<label class="form-check-label">
							<input type="radio" class="form-check-input" name="ship_option" checked="checked" value="0">회원정보와 동일
						</label>
					</div>
				</c:if>
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="radio" class="form-check-input" name="ship_option" value="1">새로입력
					</label>
				</div>
			</td>
			<td class="table-info tableloc" style="width:40%"><strong>주문고객</strong></td>
		</tr>
		<tr>
			<td  class="table-info tableloc"><strong>이름</strong></td>
			<td><input type="text" id="name" value="" class="textbox1"></td>
			<td rowspan="3" class="tableloc">
				<table class="tableloc">
					<tr>
						<td>이름</td><td><input type="text"  readonly="readonly" id="ordername"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td>
							<input type="text" class="contact_number" id="orderphone1" readonly="readonly">
						- <input type="text" class="contact_number" id="orderphone2" readonly="readonly">
						- <input type="text" class="contact_number" id="orderphone3" readonly="readonly">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="table-info tableloc"><strong>배송주소</strong></td>
			<td>
				<input type="text" id="addr1" class="textbox1">
				<button type="button" class="btn btn-dark disabled" id="searchAddrBtn"  onclick="searchShipAddr()">주소 검색</button><br>
				<div class="addrLoc">지번 주소</div><input type="text" id="addr3" class="road_land_textbox" readonly="readonly"><br>
				<div class="addrLoc">도로명 주소</div><input type="text" id="addr2" class="road_land_textbox" readonly="readonly"><br>
				<input type="text" id="addr4" placeholder="상세주소" readonly="readonly">&nbsp<input type="text" id="addr5" placeholder="참고주소" readonly="readonly">
			</td>
			
		</tr>
		<tr>
			<td class="table-info tableloc"><strong>전화번호</strong></td>
			<td>
				<input type="text" class="contact_number" id="phone1">
				- <input type="text" class="contact_number" id="phone2">
				- <input type="text" class="contact_number" id="phone3">
			</td>
			
		</tr>
	</table>
</div>
<!--/////////// 배송정보 테이블 끝 ///////////////--> 	
<!--/////////// 결제정보 테이블 시작 ///////////////--> 	
<br>
<div class="container" style="border:1px solid black;">
		<h4><span style='color:#f51167'>결제</span>정보</h4>
		<table class="table table-borderd">
			<tr>
				<td rowspan="2">결제수단</td>
				<td rowspan="2">
					<div class="form-check-inline">
						<label class="form-check-label">
							<input type="radio" class="form-check-input" name="payment_option" checked="checked" value="0">신용카드
						</label>
					</div>
					<div class="form-check-inline">
						<label class="form-check-label">
							<input type="radio" class="form-check-input" name="payment_option" value="1">가상계좌 무통장입금
						</label>
					</div>
				</td>
				<td>
					최종결제금액
				</td>
			</tr>
			<tr>
				<td>
					<span class="final_payment_price" id="final_price"></span>원
				</td>
			</tr>
		</table>
		

		<button type="button" class="btn btn-dark" id="paymentBtn">결제하기</button>
</div>
<!--/////////// 결제정보 테이블 끝 ///////////////--> 	
<!-- ////////// 포인트사용 모달  시작//////////////////////// -->
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

<!-- ////////// 포인트사용 모달 끝//////////////////////// -->

<!-- 주소 API 사용 스크립트 시작-->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 주소 API 사용 스크립트 끝-->

<!-- 아임포트 결제 API 사용 스크립트 시작 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 아임포트 결제 API 사용 스크립트 끝 -->

<script type="text/javascript">
	$(document).ready(function(){
		shipAddr();
		usablepoint();
		shipCharge();
		finalprice();
	});

	//상세주소 입력시.
	$("#addr4").on('keyup',function(){
		var addr4=$("#addr4").val();
		$(".addr4").text(addr4);
	});
	
	//배송지 radio 버튼 선택 이벤트.
	$("input[name='ship_option']").click(function(){
		var value=$(this).val();
		if(value==0){
			$("#searchAddrBtn").addClass("disabled");
			$("#addr4").attr("readonly",true);
			shipAddr();
		}else if(value==1){
			$("#searchAddrBtn").removeClass("disabled");
			$("#addr4").attr("readonly",false);
			$("#addr4, #addr1, #addr2, #addr3, #addr5, #name,#phone1,#phone2,#phone3").val("");
			$("#landAddr").text("()");
			$("#roadAddr").text("()");
		}
		
	});
	//회원정보의 배송지주소 받아옴.
	var shipAddr=function(){
		$.ajax({
			url:"/finalproject/order/getAddr",
			dataType: "json",
			success:function(data){
				var addr1=data.addr1; //우편번호
				var addr2=data.addr2; //도로명주소 
				var addr3=data.addr3; //지번주소
				var addr4=data.addr4; //상세주소
				var addr5=data.addr5; //참고주소
				var zipcode="("+addr1+")";
				var landaddr=zipcode+" "+addr3+" "+addr5+" "+addr4;
				var roadaddr=zipcode+" "+addr2+" "+addr5+" "+addr4;
				var mname=data.mname;
				var phone1=data.phone1;
				var phone2=data.phone2;
				var phone3=data.phone3;
				$("#landAddr").text(landaddr);
				$("#roadAddr").text(roadaddr);
				$("#name").val(mname);
				$("#ordername").val(mname);
				$("#addr1").val(addr1);
				$("#addr2").val(addr2);
				$("#addr3").val(addr3);
				$("#addr4").val(addr4);
				$("#addr5").val(addr5);
				$("#phone1, #orderphone1").val(phone1);
				$("#phone2, #orderphone2").val(phone2);
				$("#phone3, #orderphone3").val(phone3);
				$("#use_point").text("0");
			}
		})
	}
	//첫실행시 배송비 정함 (상품금액 5만원이상시 배송비 무료 아니면 2500원!)
	var shipCharge=function(){
		var totalprice=${totalprice};
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
		$(".final_payment_price").text(finalprice);
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
			return;
		}
		var remainpoint=Number(usablepoint)-usepoint;

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
	///////////// 주소 API 시작 ///////////////////////////////////////////////////////
	function searchShipAddr() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
				var postnum=data.zonecode;
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $("#addr1").val(postnum);
                $("#addr2").val(roadAddr);
                $("#addr3").val(data.jibunAddress);
                
                var toproadAddr="("+postnum+")"+" "+roadAddr;
                var topjibunAddr="("+postnum+")"+" "+data.jibunAddress
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                   $("#addr5").val(extraRoadAddr);
                    toproadAddr+=" "+extraRoadAddr+" ";
                    topjibunAddr+=" "+extraRoadAddr+" ";
                } else {
                    
                }
				$("#landAddr").text(topjibunAddr);
				$("#roadAddr").text(toproadAddr);
                //var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    //guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                   // guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                   // guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                  //  guideTextBox.style.display = 'block';
                } else {
                    //guideTextBox.innerHTML = '';
                   // guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
	///////////// 주소 API 끝 ///////////////////////////////////////////////////////
	
	///////////// 결제 API 시작 //////////////////////////////////////////////////////
	var IMP = window.IMP; // 생략가능
	IMP.init('imp22319375'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	$("#paymentBtn").click(function(){
		var tablelength=$("#productTable >tbody tr").length; //첫번째행 제외.
		var td=$("#productTable >tbody >tr").children(); //상품테이블 첫번째행의 td들..
		var title=td.eq(1).text();
		var ordername=title;
		if(tablelength>1){ //상품테이블에 상품갯수가 하나가아닐때.
			ordername=title+" 외 "+(tablelength-1)+"개 상품 포함"
		}
		var paymentOption=$("input[name='payment_option']:checked").val();
		console.log('paymentOption : '+paymentOption)
		if(paymentOption==0){ // 신용카드 선택
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : ordername,
			    amount : $("#final_price").text(),
			    buyer_email : '',
			    buyer_name : '',
			    buyer_tel : '',
			    buyer_addr : '',
			    buyer_postcode : '',
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		}
		
		/*else if(paymentOption==1){ //가상계좌선택
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'vbank',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : $("#final_price").text(),
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456',
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		}*/
	})
	
	///////////// 결제 API 끝 ////////////////////////////////////////////////////////

</script>