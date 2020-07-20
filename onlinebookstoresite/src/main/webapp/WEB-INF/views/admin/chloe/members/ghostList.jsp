<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<link href="${pageContext.request.contextPath }/resources/yjcss/css/made.css" rel="stylesheet" />

<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> 탈퇴회원검색
	</div>
	<form action="${pageContext.request.contextPath }/ghostList"
		method="post">
		<table class="ghostSearchTable table">
			<tr>
				<th class="table-active">검색어</th>
				<td>
					<select name="infoField">
						<option value="mname"
							<c:if test="${infoField == 'mname' }">selected</c:if>>이름</option>
						<option value="mid"
							<c:if test="${infoField == 'mid' }">selected</c:if>>아이디</option>
						<option value="email"
							<c:if test="${infoField == 'email' }">selected</c:if>>이메일</option>
						<option value="phone"
							<c:if test="${infoField == 'phone' }">selected</c:if>>휴대폰번호</option>
					</select> 
					<input type="text" name="infoKeyword" value="${infoKeyword }" size="35">
				</td>
			</tr>

			<tr>
				<th class="table-active">나이</th>
				<td>
					<input type="text" name="ageKeyword1" value="${ageKeyword1 }" size="3"> 세 ~
					<input type="text" name="ageKeyword2" value="${ageKeyword2 }" size="3" disabled="disabled"> 세
				</td>
			</tr>
			
			<tr>
			<th class="table-active">가입일</th>
				<td>
					<input type="date" name="dateKeyword1" value="${dateKeyword1 }"> ~ 
					<input type="date" name="dateKeyword2" value="${dateKeyword2 }">
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
		<i class="fas fa-table mr-1"></i> 탈퇴 회원 목록 <span style="font-size: 13px;">검색결과
			: ${pu.totalRowCnt }명</span>
	</div>
	<table class="ghostListTable table">
		<thead>
			<tr class="table-active">
				<th>이름</th>
				<th>아이디</th>
				<th>휴대전화</th>
				<th>이메일</th>
				<th>생년월일</th>
				<th>만 나이</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tfoot>
			<tr class="table-active">
				<th>이름</th>
				<th>아이디</th>
				<th>휴대전화</th>
				<th>이메일</th>
				<th>생년월일</th>
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
					<fmt:formatDate value="${vo.birth}" pattern="yy/MM/dd"
						var="birth" />
					<td>${birth}</td>
					<td>${vo.age}</td>
					<fmt:formatDate value="${vo.regdate}" pattern="yy/MM/dd"
						var="regdate" />
					<td>${regdate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- 페이징 -->
	<div id="listPaging">
		<c:choose>
			<c:when test="${pu.startPageNum > 3 }">
				<a
					href="${pageContext.request.contextPath }/ghostList?pageNum=${pu.startPageNum - 1}">
					<span style="color: black;">[이전]</span>
				</a>
			</c:when>
			<c:otherwise>
				[이전]
			</c:otherwise>
		</c:choose>

		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i == pu.pageNum }">
					<a
						href="${pageContext.request.contextPath }/ghostList?pageNum=${i}">
						<!-- &infoField=${infoField}&infoKeyword=${infoKeyword}&priceKeyword1=${priceKeyword1}&priceKeyword2=${priceKeyword2}&countKeyword1=${countKeyword1}&countKeyword2=${countKeyword2}&dateKeyword1=${dateKeyword1}&dateKeyword2=${dateKeyword2} -->
						<span style="color: blue;">${i }</span>
					</a>
				</c:when>
				<c:otherwise>
					<a
						href="${pageContext.request.contextPath }/ghostList?pageNum=${i}">
						<span style="color: gray">${i }</span>
					</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${pu.totalPageCnt > pu.endPageNum }">
				<a
					href="${pageContext.request.contextPath }/ghostList?pageNum=${pu.endPageNum + 1}">
					<span style="color: black;">[다음]</span>
				</a>
			</c:when>
			<c:otherwise>
				[다음]
			</c:otherwise>
		</c:choose>
	</div>
	<!-- ////////////////// -->
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
	
	$("form").submit(function() {
		var ageKeyword1 = $("input[name='ageKeyword1']");
		var ageKeyword2 = $("input[name='ageKeyword2']");

		if (isNaN(ageKeyword1.val())) {
			alert("가격을 숫자로만 입력해 주세요");
			ageKeyword1.focus();
			return false;
		}
		if (isNaN(ageKeyword2.val())) {
			alert("가격을 숫자로만 입력해 주세요");
			ageKeyword2.focus();
			return false;
		}
		return true;
	});
</script>