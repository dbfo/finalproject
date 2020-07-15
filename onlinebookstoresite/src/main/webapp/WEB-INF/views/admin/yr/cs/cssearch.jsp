<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class = "container-fluid">
<form action="${pageContext.request.contextPath }/cs/menu?PageName=${path}" method="post">
	<table class="table searchbox">
		<tr>
			<th class="table-active">검색어</th>
			<td colspan="3">
				<div class="form-group row">
					<div class="col-xs-2 ">
						<select class="form-control" name = "pfield">
							<option value =''>--선택--</option>
							<option value="bpaynum" <c:if test="${pfield == 'bpaynum'}">selected</c:if>>주문번호</option>
							<option value="mname"<c:if test="${pfield == 'mname'}">selected</c:if> >주문자명</option>
						</select>
					</div>
					<div class="col-xs-3">
						<input class="form-control" type="text" name="pkeyword">
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<th class="table-active">기간</th>
			<td colspan="3">
				<div class="row">
					<select name = "tfield" class = "col form-control col-xs-2">
						<option value="borderdate" <c:if test="${tfield == 'borderdate'}">selected</c:if>>주문일</option>
						<option value="bpaydate" <c:if test="${tfield == 'bpaydate'}">selected</c:if>>결제일</option>
					</select>
					<div class='col-md-4'>
						<input class="btn btn-outline-success btn-sm dbtn" type="button"
							name="today" value="오늘"> <input
							class="btn btn-outline-success btn-sm dbtn" type="button"
							name="tomorrow" value="어제"> <input
							class="btn btn-outline-success btn-sm dbtn" type="button"
							name="seven" value="7일"> <input
							class="btn btn-outline-success btn-sm dbtn" type="button"
							name="month" value="1개월"> <input
							class="btn btn-outline-success btn-sm dbtn" type="button"
							name="sixmonth" value="6개월">
					</div>
						<div>
							<input type="date" name = "startDate" id = "startDate" value="${startDate }"> &nbsp;~ &nbsp;
							<input type="date" name = "endDate" id = "endDate" value="${endDate }">
						</div>
				</div>
			</td>
		</tr>
		<tr>
			<th class="table-active">상품</th>
			<td colspan="3">
	
				<div class="form-group row">
					<div class="col-xs-2 ">
						<select class="form-control" name="bfield">
							<option value =''>--선택--</option>
							<option value="btitle" <c:if test="${bfield == 'btitle'}">selected</c:if>>책 이름</option>
							<option value="bnum" <c:if test="${bfield == 'bnum'}">selected</c:if>>책 번호</option>
						</select>
					</div>
					<div class="col-xs-3">
						<input class="form-control" type="text" name="bkeyword">
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<th class="table-active">주문상태</th>
			<td>
				<input type="checkbox" name="status" value="-1" id="ototal"><label for="ototal"> &nbsp;전체&nbsp;&nbsp;</label> 
				<input type="checkbox" name="status" value="1" id="oapply"><label for="oapply"> &nbsp;신청&nbsp;&nbsp;</label> 
				<input type="checkbox" name="status" value="2"id="processing"><label for="ocomplete"> &nbsp;처리중 &nbsp;&nbsp;</label>
				<input type="checkbox" name="status" value="3"id="ocomplete"><label for="ocomplete"> &nbsp;완료&nbsp;&nbsp;</label>
				<c:if test="${path == 1 }">
					<input type="checkbox" name="status" value="4"id="bdapply"><label for="ocomplete"> &nbsp;입금전 취소&nbsp;&nbsp;</label>
				</c:if>							
			</td>
		</tr>
		<tr>
			<th class="table-active">회원 / 비회원</th>
			<td>
				<input type="radio" name="mType" value="-1" id = "mtotal" <c:if test="${mType == '-1'}">checked</c:if>><label for="mtotal"> &nbsp;전체 &nbsp;&nbsp;</label>
				<input type="radio" name="mType" value="1" id = "member"<c:if test="${mType == '1'}">checked</c:if>><label for ="member"> &nbsp;회원 &nbsp;&nbsp;</label>
				<input type="radio" name="mType" value="2" id = "nonemember"<c:if test="${mType == '2'}">checked</c:if>><label for="nonemember"> &nbsp;비회원 &nbsp;&nbsp;</label>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="4"><input
				class="btn btn-outline-success float-right yrbtn" type="reset"
				value="초기화"> <input class="btn btn-success float-right yrbtn"
				type="submit" value="검색"></td>
		</tr>
	</table>
</form>
</div>