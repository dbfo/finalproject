<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<div id="content_memberinfo">

	<div>
		<i class="fab fa-first-order-alt"></i><h4 style="display:inline"><span class="colorFont">회원</span>정보</h4>
	</div>
	<div>
		<table class="table">
			<tr>
				<td class="tableloc">이름</td>
				<td style="width:40%">${mname }</td>
				<td class="tableloc">가입일</td>
				<td style="width:40%">${regdate }</td>
			</tr>
			<tr>
				<td class="tableloc">아이디</td><td>${requestScope.mid }</td><td class="tableloc">비밀번호</td>
				<td>
					<input type="password" id="mypwd" readonly="readonly">
					<button type="button" class="btn btn-dark changeBtn" data-toggle="modal" data-target="#pwdmodal">변경</button>
				</td>
			</tr>
			<tr>
				<td class="tableloc">전화번호</td>
				<td>
					<span id="phone"></span>
					<button type="button" class="btn btn-dark changeBtn" data-toggle="modal" data-target="#phonemodal">변경</button>
				</td>
				<td class="tableloc">
					이메일
				</td>
				<td>
					<span id="email"></span>
					<button type="button" class="btn btn-dark changeBtn" data-toggle="modal" data-target="#emailmodal">변경</button>
				</td>
			</tr>
			<tr>
				<td class="tableloc">
					주소
				</td>
				<td colspan="3">
					<input type="text" id="addr1" class="textbox1" readonly="readonly">
					<button type="button" class="btn btn-dark" id="searchAddrBtn" data-toggle="modal" data-target="#addrmodal">주소 변경</button><br>
					<div class="addrLoc">지번 주소</div><input type="text" id="addr3" class="road_land_textbox" readonly="readonly"><br>
					<div class="addrLoc">도로명 주소</div><input type="text" id="addr2" class="road_land_textbox" readonly="readonly"><br>
					<input type="text" id="addr4" placeholder="상세주소" readonly="readonly">
					&nbsp<input type="text" id="addr5" placeholder="참고주소" readonly="readonly">
				</td>
			</tr>
		</table>
	</div>
	<div id="btndiv">
		<button type="button" class="btn btn-dark">마이페이지 메인으로</button>
	</div>
</div>
<div id="phonemodal" class="modal fade" role="dialog"> 
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background-color: #212529">
       <h4 class="modal-title" id="loginmodal_h4">회원정보</h4>
        <button type="button" class="close" data-dismiss="modal">x</button>
      </div>
      <div class="modal-body modalbody" id="phonemodal_body">
        	<div class="phonemodal_div">
        		<span class="modalloc"><strong>전화번호</strong></span>
        		<input type="text" id="modalphone" class="loginmodal_input" readonly="readonly"><br>
        	</div>
        	<div class="phonemodal_div">
        		<span class="modalloc"><strong>변경할전화번호</strong></span>
        		<input type="text" id="modalphone1" class="modalphone">
        		<input type="text" id="modalphone2" class="modalphone">
        		<input type="text" id="modalphone3" class="modalphone">
        	</div>
      </div>
      <div class="modal-footer">
      	  	<button type="button" class="btn btn-dark" id="phoneconfirmBtn">변경</button>
        <button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
      </div>
    </div>

  </div>
</div>

<div id="emailmodal" class="modal fade" role="dialog"> 
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background-color: #212529">
       <h4 class="modal-title" id="loginmodal_h4">회원정보</h4>
        <button type="button" class="close" data-dismiss="modal">x</button>
      </div>
      <div class="modal-body modalbody" id="emailmodal_body">
        	<div class="phonemodal_div">
        		<span class="modalloc"><strong>이메일</strong></span>
        		<input type="text" id="modalemail" class="emailmodal_input" readonly="readonly"><br>
        	</div>
        	<div class="phonemodal_div">
        		<span class="modalloc"><strong>변경할이메일</strong></span>
        		<input type="email" id="inputemail" class="emailmodal_input"><br>
        	</div>
      </div>
      <div class="modal-footer">
      	  	<button type="button" class="btn btn-dark" id="emailconfirmBtn">변경</button>
        <button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
      </div>
    </div>

  </div>
</div>

<div id="pwdmodal" class="modal fade" role="dialog"> 
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background-color: #212529">
       <h4 class="modal-title" id="loginmodal_h4">회원정보</h4>
        <button type="button" class="close" data-dismiss="modal">x</button>
      </div>
      <div class="modal-body modalbody" id="pwdmodal_body">
        	<div class="phonemodal_div">
        		<span class="modalloc"><strong>비밀번호</strong></span>
        		<input type="password" id="modalpwd" class="pwdmodal_input" readonly="readonly"><br>
        	</div>
        	<div class="phonemodal_div">
        		<span class="modalloc"><strong>변경할비밀번호</strong></span>
        		<input type="password" id="inputpwd" class="pwdmodal_input"><br>
        	</div>
      </div>
      <div class="modal-footer">
      	  	<button type="button" class="btn btn-dark" id="pwdconfirmBtn">변경</button>
        <button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
      </div>
    </div>

  </div>
</div>

<div id="addrmodal" class="modal fade" role="dialog"> 
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background-color: #212529">
       <h4 class="modal-title" id="loginmodal_h4">회원정보</h4>
        <button type="button" class="close" data-dismiss="modal">x</button>
      </div>
      <div class="modal-body modalbody" id="addrmodal_body">
        	주소변경을 하시겠습니까? 
      </div>
      <div class="modal-footer">
      	  	<button type="button" class="btn btn-dark" id="addrconfirmBtn">확인</button>
        <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
      </div>
    </div>

  </div>
</div>

<div id="alertinfomodal" class="modal fade" role="dialog"> 
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background-color: #ccccff">
       <h4 class="modal-title">알림</h4>
        <button type="button" class="close" data-dismiss="modal">x</button>
      </div>
      <div class="modal-body" id="alertinfomodal_body">
        	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
      </div>
    </div>

  </div>
</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function(){
		
	});
	
	var memberinfo=function(){
		$.ajax({
			url:"/finalproject/member/getinfo",
			dataType:"json",
			type:"post",
			success:function(){
				
			}
		})
	}
	
	$("#addrconfirmBtn").click(function(){
		$("#addrmodal").modal('hide')
		searchShipAddr();
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
                $("#alertinfomodal_body").text("주소 변경완료.")
                $("#alertinfomodal").modal('show');
                
            }
        }).open();
    }
	///////////// 주소 API 끝 ///////////////////////////////////////////////////////
	
	
	
</script>

<style>
	.colorFont{
		color:#e83e8c;
	}

	#content_memberinfo{
		padding:10px;
		height:740px;
		width:920px;
		border:1px solid #dee2e6;
	}
	.addrLoc{
		font-size:13px;
		width:87px;
		height:20px;
		display:inline-block;
	}
	#addr4, #addr5{
		font-size:13px;
		height:20px;
	}
	.textbox1{
		font-size:13px;
		height:20px;
		width:100px;
	}
	.road_land_textbox{
		font-size:13px;
		height:20px;
		width:248.5px;
	}
	#mypwd{
		border:none;
	}
	#searchAddrBtn{
		padding:1.5px 1.5px;
		font-size:13px;
		width:80px;
		height:20px;
	}
	.tableloc{
		background-color: #e6f7ff;
		text-align: center;
		font-weight: bold;
		width:10%;
	}
	.changeBtn{
		padding:1.5px 1.5px;
		font-size:13px;
		width:50px;
		height:30px;
	}
	#btndiv{
		text-align: center;
	}
	.modalbody{
		text-align: center;
	}
	.modalphone{
		width: 55px;
	}
</style>