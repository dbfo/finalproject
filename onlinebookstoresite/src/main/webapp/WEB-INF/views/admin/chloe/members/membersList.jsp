<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="memSearch container-fluid">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> 회원리스트
	</div>
	<table class="memSearchTable table">
		<tr>
			<th align="center" class="table-active">검색어</th>
			<td colspan="3"><select name="search">
					<option value="">이름</option>
					<option value="" selected="selected">아이디</option>
					<option value="">이메일</option>
					<option value="">휴대폰번호</option>
			</select> <input type="text" name="idKeyword"></td>
		</tr>

		<tr>
			<th align="center" class="table-active">주문일/결제완료일</th>
			<td colspan="3"><select>
					<option value="">주문일</option>
					<option value="">결제완료일</option>
			</select> <input type="date"></td>
		</tr>

		<tr>
			<th align="center" class="table-active">나이</th>
			<td><input type="text" name="bprice" size="3"> 세 ~ <input
				type="text" name="bprice" size="3"> 세</td>
			<th align="center" class="table-active">가입일/기념일</th>
			<td><select>
					<option value="">- 선택 -</option>
					<option value="">가입일</option>
					<option value="">생일</option>
			</select> <input type="text" size="25"></td>
		</tr>

		<tr>
			<td align="center" colspan="4"><input type="submit" value="검  색"></td>
		</tr>
	</table>
</div>

<!-- 리스트 -->
<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> 회원 목록
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th>이름</th>
						<th>아이디</th>
						<th>휴대전화</th>
						<th>이메일</th>
						<th>나이</th>
						<th>가입일</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>이름</th>
						<th>아이디</th>
						<th>휴대전화</th>
						<th>이메일</th>
						<th>나이</th>
						<th>가입일</th>
					</tr>
				</tfoot>
				<tbody>
					<c:forEach var="vo" items="${list }" >
						<tr>
							<td>${vo.mname}</td>
							<td>${vo.mid}</td>
							<td>${vo.phone}</td>
							<td>${vo.email}</td>
							<td>${vo.age}</td>
							<fmt:formatDate value="${vo.regdate}" pattern="yyyy/MM/dd" var="regdate" />
							<td>${regdate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script>
$
</script>