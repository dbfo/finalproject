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
			<a class="menuAtag" href="${cp }/mypage/accountpage">- 계좌내역</a>
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
