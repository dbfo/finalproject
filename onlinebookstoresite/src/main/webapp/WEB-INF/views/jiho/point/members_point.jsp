<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<style>
/*회원포인트 css*/
#content_point{
	position: absolute;
    display: inline-block;
    border:1px solid #dee2e6;
    width: 927px;
    height: 780px;
    padding:10px;
    background-color: yellow;
}
#pointSearch{
	border: 1px solid red;
	width: 907px;
	height: 200px;
}
#pointContent{
	border: 1px solid blue;
	margin-top:10px;
	width: 907px;
	height: 500px;
}
input[name='pregdate']{
	display: none;
}
</style>
<script type='text/javascript'>
    $(function(){
        $('.input-group-date').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-MM-dd",
            language: "kr"
        });
    });
</script>
<div id="content_point">
<h3>포인트페이지</h3>
	<form action="${cp }/members/point">
		<div id="pointSearch">
			<div class="btn-group" data-toggle="buttons">
				<label class="btn btn-primary active">
					<input type="radio"	name="pregdate" id="option1" autocomplete="off" value="0">전체
				</label>
				<label class="btn btn-primary">
					<input type="radio"	name="pregdate" id="option2" autocomplete="off" value="1">1개월
				</label>
				<label class="btn btn-primary">
					<input type="radio"	name="pregdate" id="option3" autocomplete="off" value="2">3개월
				</label>
				<input type="text" name="startDay" class="input-group-date" placeholder="시작날짜">~
				<input type="text" name="endDay" class="input-group-date" placeholder="종료날짜">
				<input type="submit" class="btn btn-success" value="검색">
			</div>
		</div>
		<div id="pointContent">
			<table class="table table-bordered">
				<thead class="thead-dark">
					<tr style="text-align: center">
						<th width="80">NO</th>
						<th width="200">내용</th>
						<th width="120">사용금액</th>
						<th width="120">적립금액</th>
						<th width="120">거래일자</th>
					</tr>
				</thead>
				<c:forEach var="vo" items="${list }" varStatus="status">
					<tr>
						<td style="text-align: center;">${pu.totalRowCount - ((pu.pageNum-1) * 5 + status.index)}</td>
						<td>
							<c:if test="${vo.tranpoint > 0 }">포인트 적립</c:if>
							<c:if test="${vo.tranpoint < 0 }">포인트 사용</c:if>
						</td>
						<td style="text-align: right;">
							<c:if test="${vo.tranpoint < 0 }">${vo.tranpoint }원</c:if>
						</td>
						<td style="text-align: right;">
							<c:if test="${vo.tranpoint > 0 }">${vo.tranpoint }원</c:if>
						</td>
						<td style="text-align: center;">
							<fmt:formatDate value="${vo.pregdate }" pattern="yyyy-MM-dd"/>
						</td>
					</tr>
				</c:forEach>
			</table>
			<div>
				<ul class="pagination justify-content-center">
					<c:if test="${pu.startPageNum>3 }">
						<li class="page-item">
							<a class="page-link" href="">이전</a></li>
					</c:if>
					<c:forEach var="i" end="${pu.endPageNum}" begin="${pu.startPageNum }">
						<li class="page-item">
							<a class="page-link" href="">${i}</a></li>
					</c:forEach>
					<c:if test="${pu.totalPageCount>pu.endPageNum}">
						<li class="page-item">
							<a class="page-link" href="">다음</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</form>
</div>