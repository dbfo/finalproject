<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> 상세 미리보기
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-7">
					<h1>${thub.imgsavefilename }</h1>
						<img alt="Bootstrap Image Preview"
							src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" />
					</div>
					<div class="col-md-5">
						<div style="font-size: 30px; font-weight: 600;">${vo.btitle }</div>
						<fmt:formatDate value="${vo.bpublishdate }" pattern="yyyy/MM/dd"
								var="bpublishdate" />
						<div>${vo.bwriter } 지음 | ${vo.bpublisher } | ${bpublishdate } 출간</div>
						<div style="font-size: 25px; font-weight: 500;">${vo.bprice }원</div>
						<div>(${vo.bpoint } point 적립 예정)</div>
						<div style="font-size: 20px;">배송비 : ${vo.bshipinfo }원</div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-12">
						<h4>[책 소개글]</h4>
						<p>${vo.bcontent }</p>
					</div>
				</div>
				<img alt="Bootstrap Image Preview"
					src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" />
			</div>
		</div>
	</div>
</div>