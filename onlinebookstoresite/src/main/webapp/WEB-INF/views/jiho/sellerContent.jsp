<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="sellerContentMain">
	<!-- 판매현황카드 -->
	<div id="salesStatus" class="sellerCard">
		<div class="card bg-light">
		<p>판매현황(최근1개월) <a href="#">더보기</a></p>
		<br>
			<table class="table">
				<tr>
					<th><a href="${cp}/seller/prodLook"><span style="color: black;">등록상품</span></a></th>
					<td><a href="${cp }/seller/prodLook">${getOldbookCount }개</a></td>
				</tr>
				<tr>
					<th><a href=""><span style="color: black;">입금대기중</span></a></th>
					<td><a href="">${getOldbookSalestatusCount1}개</a></td>
				</tr>
				<tr>
					<th><a href=""><span style="color: black;">입금완료/배송요청</span></a></th>
					<td><a href="">${getOldbookSalestatusCount2}개</a></td>
				</tr>
				<tr>
					<th><a href=""><span style="color: black;">배송중/구매확정전</span></a></th>
					<td><a href="">${getOldbookSalestatusCount3}개</a></td>
				</tr>
				<tr>
					<th><a href=""><span style="color: black;">구매확정</span></a></th>
					<td><a href="">${getOldbookSalestatusCount4}개</a></td>
				</tr>
			</table>
		</div>
	</div>
	<div id="salesBoard" class="sellerCard">
		<div class="card bg-light">
		<p>게시글현황(최근1개월) <a href="#">더보기</a></p>
		<br>
			<table class="table">
				<tr>
					<th>묻고답하기(Qna)</th>
					<td><a href="">0개</a></td>
				</tr>
				<tr>
					<th>판매평가/리뷰</th>
					<td><a href="">0개</a></td>
				</tr>
			</table>
		</div>
	</div>
	<div id="sales" class="sellerCard">
		<div class="card bg-light">
		<p>정산조회(최근1개월) <a href="#">더보기</a></p>
		<br>
			<table class="table">
				<tr>
					<th>구매확정/정산대기</th>
					<td><a href="">${getObcompleteCount1}개</a></td>
				</tr>
				<tr>
					<th>정산완료</th>
					<td><a href="">${getObcompleteCount2}개</a></td>
				</tr>
			</table>
		</div>
	</div>
	<div id="salesReturn" class="sellerCard">
		<div class="card bg-light">
		<p>반품접수내역(최근1개월) <a href="#">더보기</a></p>
		<br>
			<table class="table">
				<tr>
					<th>반품처리중</th>
					<td><a href="">0개</a></td>
				</tr>
				<tr>
					<th>반품처리완료</th>
					<td><a href="">0개</a></td>
				</tr>
			</table>
		</div>
	</div>
</div>
