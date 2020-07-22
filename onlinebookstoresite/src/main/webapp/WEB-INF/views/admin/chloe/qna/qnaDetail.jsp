<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> ${vo.mid }님의 질문의 상세내용
	</div>
	<table class="table">
		<tr>
			<th style="text-align: center;" class="table-active">문 의 번 호</th>
			<td>${vo.qnanum }</td>
		</tr>

		<tr>
			<th style="text-align: center;" class="table-active">회 원 번 호</th>
			<td>${vo.mnum }</td>
		</tr>

		<tr>
			<th style="text-align: center;" class="table-active">작 성 자</th>
			<td>${vo.mid }</td>
		</tr>

		<tr>
			<th style="text-align: center;" class="table-active">문 의 제 목</th>
			<td>${vo.qnatitle }</td>
		</tr>

		<tr>
			<th style="text-align: center;" class="table-active">문 의 내 용</th>
			<td>
				<div style="height: 550px;">${vo.qnacontent }</div>
			</td>
		</tr>

		<tr>
			<td align="center" colspan="4">
				<button type="button" class="btn btn-success" 
				data-toggle="modal" data-target="#myModal">답변달기</button>
			</td>
		</tr>
	</table>
</div>

<!-- 답변모달 -->
<div class="modal fade" id="myModal">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">답변달기</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">Modal body..</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="submit" class="btn btn-secondary">작성</button>
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