<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> ${vo.mid }님의 질문 상세내용 및 답변 상세
	</div>
	<table class="table">
		<tr>
			<th style="text-align: center;" class="table-active">문 의 번 호</th>
			<td colspan="3">${vo.qnanum }</td>
		</tr>

		<tr>
			<th style="text-align: center;" class="table-active">회 원 번 호</th>
			<td>${vo.mnum }</td>
			<th style="text-align: center;" class="table-active">작 성 자</th>
			<td>${vo.mid }</td>
		</tr>

		<tr>
			<th style="text-align: center;" class="table-active">문 의 제 목</th>
			<td  colspan="3">${vo.qnatitle }</td>
		</tr>

		<tr>
			<th style="text-align: center;" class="table-active">문 의 내 용</th>
			<td  colspan="3">
				<div style="height: 300px;">${vo.qcontent }</div>
			</td>
		</tr>
		
		<tr>
			<th style="text-align: center;" class="table-active">답 변 내 용</th>
			<td  colspan="3"><div style="height: 300px;">${vo.acontent }</div></td>
		</tr>
		
		<tr>
			<th style="text-align: center;" class="table-active">답 변 일 자</th>
			<fmt:formatDate value="${vo.adate }" pattern="yyyy/MM/dd" var="adate" />
			<td  colspan="3">${adate }</td>
		</tr>
		

		<tr>
			<td align="center" colspan="4">
				<button type="button" onclick="location.href='${pageContext.request.contextPath}/answerList'" class="btn btn-secondary">확인</button>
			</td>
		</tr>

		<tr>
			<td align="center" colspan="4">
				<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">답변수정(모달)</button>
				<button type="button" onclick="location.href='${pageContext.request.contextPath}'" class="btn btn-danger">답변삭제</button>
			</td>
		</tr>
	</table>
</div>

<!-- 답변수정모달 -->
<div class="modal fade" id="myModal">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">답변달기</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<div class="modal-body">
				<form method="post" action="${pageContext.request.contextPath }/qnaAnswerUpdate" id="frm">
					<input type="hidden" name="qnanum" value="${vo.qnanum }">
					<input type="hidden" name="mnum" value="${vo.mnum }">
					<input type="hidden" name="qnatitle" value="${vo.qnatitle }">
					<input type="hidden" name="qcontent" value="${vo.qcontent }">
					
					<table class="table">
						<tr>
							<th style="text-align: center;" class="table-active">본 문 내 용</th>
							<td  colspan="3">
								<div style="height: 300px;">${vo.qcontent }</div>
							</td>
						</tr>
					
						<tr>
							<th style="text-align: center;" class="table-active">수정할 답변내용</th>
							<td><textarea rows="10" cols="100" name="acontent">${vo.acontent }</textarea></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="modal-footer">
				<input type="button" value="작성" class="btn btn-primary" id="submitBtn">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<style>
table th {
	width: 200px;
}
</style>

<script>
	$("#submitBtn").click(function() {
		$("#frm").submit();
	});
</script>