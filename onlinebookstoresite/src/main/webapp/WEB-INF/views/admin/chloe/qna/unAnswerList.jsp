<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<link
	href="${pageContext.request.contextPath }/resources/yjcss/css/madeByChloe.css"
	rel="stylesheet" />

<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> Q&A관리
	</div>

	<!-- 탭 -->
	<div class="container">
		<ul class="nav nav-pills nav-justified">
			<li class="nav-item"><a class="nav-link active qnaSelector"
				href="${pageContext.request.contextPath}/unAnswerList">미답변&nbsp;[${pu.totalRowCnt }건]</a>
			</li>
			<li class="nav-item"><a class="nav-link qnaSelector"
				href="${pageContext.request.contextPath}/answerList">답변완료</a></li>
		</ul>
	</div>

	<!-- 리스트 테이블 -->
	<table class="table">
		<colgroup>
			<col width="5%">
			<col width="15%">
			<col width="">
			<col width="10%">
		</colgroup>
		<thead>
			<tr class="table-active">
				<th scope="col">번호</th>
				<th scope="col">작성자</th>
				<th scope="col" style="text-align: center;">제목</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tfoot>
			<tr class="table-active">
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
		</tfoot>
		<tbody>
			<c:forEach var="vo" items="${list }" varStatus="status">
				<tr>
					<td>${vo.qnanum }</td>
					<td>${vo.mid }</td>
					<td>${vo.qnatitle }&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/qnaDetail?qnanum=${vo.qnanum}">더보기</a></td>
					<fmt:formatDate value="${vo.qnadate }" pattern="yyyy/MM/dd"
						var="qnadate" />
					<td>${qnadate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- 페이징 -->
	<div id="listPaging">
		<c:choose>
			<c:when test="${pu.startPageNum > 3 }">
				<a
					href="${pageContext.request.contextPath }/unAnswerList?pageNum=${pu.startPageNum - 1}">
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
						href="${pageContext.request.contextPath }/unAnswerList?pageNum=${i}">
						<span style="color: blue;">${i }</span>
					</a>
				</c:when>
				<c:otherwise>
					<a
						href="${pageContext.request.contextPath }/unAnswerList?pageNum=${i}">
						<span style="color: gray">${i }</span>
					</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${pu.totalPageCnt > pu.endPageNum }">
				<a
					href="${pageContext.request.contextPath }/unAnswerList?pageNum=${pu.endPageNum + 1}">
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
	$(".qnaSelector").click(function() {
		$(".qnaSelector").each(function() {
			$(this).removeClass('active');
		});
		$(this).addClass('active');
	});
</script>