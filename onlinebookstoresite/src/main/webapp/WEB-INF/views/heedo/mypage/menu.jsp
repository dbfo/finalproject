<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="infomation" style="background-image: url('${cp}/resources/jh/jhimages/마이페이지내정보상단.png')">
	<span style="position: absolute;font-size: 17px;margin-left: 55px;margin-top: 7px;max-width: 100px;">
		<span style="color: #f51167;"><%=session.getAttribute("mid") %></span>님 <br>환영합니다.
	</span>
	<span style="position: absolute;font-size: 17px;margin-left: 10px;margin-top: 70px;">
		내 포인트 : <%=session.getAttribute("point") %>원
	</span>
	<span style="position: absolute;font-size: 17px;margin-left: 10px;margin-top: 105px;">
		내 등급 : <%=session.getAttribute("grade") %>
	</span>
</div>

<table class="table table-striped" id="menubar">
	<tr>
		<th scope="col">주문내역</th>
	</tr>
	<tr>
		<td>
			<a class="menuAtag" href="${cp }/mypage/orderhistory">- 주문내역</a><br>
			<a class="menuAtag" href="${cp }/mypage/returnpage">- 반품/교환 신청,완료 내역</a><br>
			<a class="menuAtag" href="${cp }/mypage/cancelhistorypage">- 취소 주문내역</a><br>
		</td>
	</tr>
	<tr>
		<th>나의정보</th>
	</tr>
	<tr>
		<td>
			<a class="menuAtag" href="#">- 회원정보</a><br>
			<a class="menuAtag" href="#">- 회원탈퇴</a>
		</td>
	</tr>
	<tr>
		<th>나의계좌</th>
	</tr>
	<tr>
		<td>
			<a class="menuAtag" href="${cp }/members/pointList">- 포인트내역</a><br>
			<a class="menuAtag" href="${cp }/mypage/depositpage">- 예치금내역/신청</a><br>
			<a class="menuAtag" href="javascript:accountpage()">- 계좌내역</a>
		</td>
	</tr>
	<tr>
		<th>중고관리</th>
	</tr>
	<tr>
		<td><a class="menuAtag" href="${cp }/seller">-중고판매자매니저</a></td>
	</tr>
	<tr>
		<th>고객센터</th>
	</tr>
	<tr>
		<td><a class="menuAtag" href="${cp }/mypage/qnapage">-문의내역/문의하기</a></td>
	</tr>
</table>
<div id="err_modal" class="modal fade" role="dialog"> 
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background-color: #ff66a3">
       <h4 class="modal-title" style="color:white">에러</h4>
        <button type="button" class="close" data-dismiss="modal">x</button>
      </div>
      <div class="modal-body" id="err_modal_body">
        	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
      </div>
    </div>

  </div>
</div>
<div id="alertmodal" class="modal fade" role="dialog"> 
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background-color: #ccccff">
       <h4 class="modal-title">알림</h4>
        <button type="button" class="close" data-dismiss="modal">x</button>
      </div>
      <div class="modal-body">
        	등록된 계좌가 없습니다. 계좌를 등록해주세요.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
      </div>
    </div>

  </div>
</div>
<script>
	var accountpage=function(){
		console.log('111')
		$.ajax({
			url:"/finalproject/mypage/confirmaccount",
			dataType:"json",
			type:"post",
			success:function(data){
				if(data.result=="loginerr"){
					$("#err_modal_body").text('로그인 에러 발생!');
					$("#err_modal").modal('show');
					return
				}else if(data.result=="accounterr"){ //계좌없을떄 
					$("#alertmodal").modal('show');
					return;
				}else if(data.result=="confirm"){
					window.location.href="${cp}/mypage/accountpage"
				}else{
					$("#err_modal_body").text('에러 발생!');
					$("#err_modal").modal('show');

				}
			}
		})
		
	}

</script>
