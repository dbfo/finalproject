<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> 상세 미리보기
	</div>
	<div class="container-fluid">
		<div class="row">
			<div id="btnDiv1">
				<button type="button" onclick="location.href='${pageContext.request.contextPath}/booksUpdate?bnum=${vo.bnum }'" class="btn btn-success">수정</button>
				<button type="button" onclick="location.href='${pageContext.request.contextPath}/booksDelete?bnum=${vo.bnum }'" class="btn btn-danger">삭제</button>
			</div>
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-7" id="thumbDiv">
						<%-- <h1>${imgVO1.thumbnail}</h1> --%>
						<img width="400px" height="600px"
							src="${pageContext.request.contextPath}/resources/imgUpload/${imgVO1.imgsavefilename}" />
					</div>
					<div class="col-md-5">
						<div id="titleDiv" style="font-size: 35px; font-weight: 600;">${vo.btitle }</div>
						<fmt:formatDate value="${vo.bpublishdate }" pattern="yyyy/MM/dd"
							var="bpublishdate" />
						<div id="wppDiv" style="font-size: 20px;">${vo.bwriter } 지음 | ${vo.bpublisher } | ${bpublishdate } 출간</div>
						<div id="priceDiv" style="font-size: 30px; font-weight: 500;">${vo.bprice }원</div>
						<div id="pointDiv">(${vo.bpoint } point 적립 예정)</div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-12">
						<div id="introTextDiv" style="font-size: 30px; font-weight: 600;">[소개글]</div>
						<div id="contentTextDiv">${vo.bcontent }</div>
					</div>
				</div>
				<c:if test="${!empty imgVO2 }">
					<div id="imgDiv">
						<%-- <h1>${imgVO2.thumbnail}</h1> --%>
						<img
							src="${pageContext.request.contextPath}/resources/imgUpload/${imgVO2.imgsavefilename}" />
					</div>
				</c:if>
			</div>
			<div id="btnDiv2">
				<button type="button" onclick="location.href='/booksUpdate'" class="btn btn-success">수정</button>
				<button type="button" onclick="location.href='#'" class="btn btn-danger">삭제</button>
			</div>
		</div>
	</div>
</div>

<style type="text/css">
#thumbDiv, #introTextDiv, #contentTextDiv, #imgDiv {
	text-align: center;
}

#introTextDiv, #contentTextDiv{
	margin-top: 20px;
	margin-bottom: 40px;
}

#titleDiv, #wppDiv, #priceDiv, #pointDiv {
	margin-top: 15px;
	/* 	margin-bottom: 30px; */
}

#btnDiv1, #btnDiv2 {
	margin-left: 100px;
	margin-top: 20px;
	margin-bottom: 30px;
}
</style>