<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="memSearch container-fluid">
	<form action="${pageContext.request.contextPath }/membersList"
		method="post">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i> 회원리스트
		</div>
		<table class="memSearchTable table">
			<tr>
				<th align="center" class="table-active">검색어</th>
				<td><select name="infoField">
						<option value="mname"
							<c:if test="${infoField == 'mname' }">selected</c:if>>이름</option>
						<option value="mid"
							<c:if test="${infoField == 'mid' }">selected</c:if>>아이디</option>
						<option value="email"
							<c:if test="${infoField == 'email' }">selected</c:if>>이메일</option>
						<option value="phone"
							<c:if test="${infoField == 'phone' }">selected</c:if>>휴대폰번호</option>
				</select> <input type="text" name="infoKeyword" value="${infoKeyword }"
					size="30"></td>
					
				<th align="center" class="table-active">생일</th>
				<td>
					<input type="text" id="birthMonth" size="3"> 월
					<input type="text" id="birthDay" size="3"> 일생
				</td>
			</tr>

			<tr>
				<th align="center" class="table-active">나이</th>
				<td>
					<input type="text" id="ageKeyword1" name="ageKeyword1" size="3"> 세 ~ 
					<input type="text" id="ageKeyword2" name="ageKeyword2" size="3" disabled="disabled"> 세
				</td>

				<th align="center" class="table-active">가입일/기념일</th>
				<td>
					<select name="dateField">
							<option value="">- 선택 -</option>
							<option value="regdate"
								<c:if test="${dateField == 'regdate' }">selected</c:if>>가입일</option>
							<option value="birth"
								<c:if test="${dateField == 'birth' }">selected</c:if>>생일</option>
					</select>
					<input type="date" size="25" name="dateKeyword" id="dateKeyword" value="${dateKeyword }">
				</td> 
			</tr>

			<tr>
				<td align="center" colspan="4">
					<input type="submit" value="검  색">
				</td>
			</tr>
		</table>
	</form>
</div>

<!-- 리스트 -->
<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> 회원 목록
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th>이름</th>
						<th>아이디</th>
						<th>휴대전화</th>
						<th>이메일</th>
						<th>만 나이</th>
						<th>가입일</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>이름</th>
						<th>아이디</th>
						<th>휴대전화</th>
						<th>이메일</th>
						<th>만 나이</th>
						<th>가입일</th>
					</tr>
				</tfoot>
				<tbody>
					<c:forEach var="vo" items="${list }">
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
	$("#ageKeyword1").change(function() {
		$("#ageKeyword2").prop('disabled', false);
	});

	$("#ageKeyword2").change(function() {
		var ageKeyword1 = parseInt($("#ageKeyword1").val());
		var ageKeyword2 = parseInt($("#ageKeyword2").val());
		if (ageKeyword1 > ageKeyword2) {
			$("#ageKeyword2").val('');
			alert("숫자를 다시 정확히 입력해주세요");
		}
	});
</script>