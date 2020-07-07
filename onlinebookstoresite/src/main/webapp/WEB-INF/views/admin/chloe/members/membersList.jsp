<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="memSearch container-fluid">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> 회원리스트
	</div>
	<table class="memSearchTable table">
		<tr>
			<th align="center" class="table-active">검색어</th>
			<td colspan="3">
				<select name="search">
					<option value="">이름</option>
					<option value="" selected="selected">아이디</option>
					<option value="">이메일</option>
					<option value="">휴대폰번호</option>
				</select> <input type="text" name="idKeyword">
			</td>
		</tr>

		<tr>
			<th align="center" class="table-active">주문일/결제완료일</th>
			<td colspan="3">
				<select>
					<option value="">주문일</option>
					<option value="">결제완료일</option>
				</select>
				<input type="text" size="25">
			</td>
		</tr>

		<tr>
			<th align="center" class="table-active">나이</th>
			<td><input type="text" name="bprice" size="3"> 세 ~ <input type="text" name="bprice" size="3"> 세</td>
			<th align="center" class="table-active">가입일/기념일</th>
			<td>
				<select>
					<option value="">- 선택 -</option>
					<option value="">가입일</option>
					<option value="">생일</option>
				</select>
				<input type="text" size="25">
			</td>
		</tr>

		<tr>
			<td align="center" colspan="4"><input type="submit" value="검  색"></td>
		</tr>
	</table>
</div>
