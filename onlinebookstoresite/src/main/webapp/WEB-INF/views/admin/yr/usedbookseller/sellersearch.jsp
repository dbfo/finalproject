<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class = "container-fluid">
<form action="${pageContext.request.contextPath }/cs/menu?PageName=${path}" method="post">
	<h2>판매자 정산 관리</h2>
	<table class="table searchbox">
		<tr>
			<th class="table-active">검색어</th>
			<td colspan="3">
				<div class="form-group row">
					<div class="col-xs-2 ">
					
						<select class="form-control" name = "pfield" <c:if test="${path == 4 || path == 5 || path == 6}">disabled</c:if>>
							<option value =''>--선택--</option>
							<option value="bpaynum" <c:if test="${pfield == 'bpaynum'}">selected</c:if>>주문번호</option>
							<option value="mname"<c:if test="${pfield == 'mname'}">selected</c:if> >주문자명</option>
						</select>
						
					</div>
					<div class="col-xs-3">
						<input class="form-control" type="text" name="pkeyword" value = "${pkeyword }" <c:if test="${path == 4 || path == 5 || path == 6}">disabled</c:if>>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<th class="table-active">기간</th>
			<td colspan="3">
				<div class="row">
					<select name = "tfield" class = "col form-control col-xs-2">
					
						<c:choose>
							<c:when test="${path >= 4 }">
								<option value="appdate" <c:if test="${tfield == 'appdate'}">selected</c:if>>접수일</option>													
							</c:when>
							<c:otherwise>
								<option value="borderdate" <c:if test="${tfield == 'borderdate'}">selected</c:if>>주문일</option>			
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${path >= 4 }">
								<option value="comdate" <c:if test="${tfield == 'comdate'}">selected</c:if>>처리일</option>													
							</c:when>
							<c:otherwise>
								<option value="aplctdate" <c:if test="${tfield == 'aplctdate'}">selected</c:if>>접수일</option>						
							</c:otherwise>
						</c:choose>
						
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
							<input class="form-control" type="date" name = "startDate" id = "startDate" value="${startDate }"> &nbsp;~ &nbsp;
							<input class="form-control" type="date" name = "endDate" id = "endDate" value="${endDate }">
						</div>
				</div>
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