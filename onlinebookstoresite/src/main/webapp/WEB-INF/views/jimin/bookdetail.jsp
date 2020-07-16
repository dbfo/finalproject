<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookDetail</title>
</head>
<body>
<br>
<br>
	<div  class="container" id="detailallwrap">
		<div id="detailupper">
			<div id="detailinfo">
				<img id="detailbook_img"
				src="${cp }/resources/JIMIN/images/광규2.png" id="thumbnail">
				
				<div id="detailbookNameTitle">
				<strong style="font-size: x-large;">${bookvo.btitle }</strong>
				</div>
				<br>
				<br>
				<div id="detailwriter">
						<span style="font-size: 15px; color: #7d7d7d;">저 자 : </span><strong>${bookvo.bwriter }</strong>
						ㅣ				
						<span style="font-size: 15px; color: #7d7d7d;">출판사 : </span><strong>${bookvo.bpublisher }</strong>
						ㅣ					
						<span style="font-size: 15px; color: #7d7d7d;">등록일 : </span><strong><fmt:formatDate value="${bookvo.bregdate }" pattern="yyyy-MM-dd"/></strong>
				</div>
				<br>
				<br>
				<div id="detailprice">
						<span style="font-size:17px;color: #7d7d7d; float:left; margin-left: 1px;">판매가</span>
						<span style="font-size: 22px;font-weight: bold ; color: red;float: left;margin-left: 100px;" >
						${bookvo.bprice } </span>
						<span style="font-size: 18px;font-weight: bold ; color: red;float: left;margin-left: 10px;">원</span>
						<br>
						<br>
						<span style="font-size:17px;color: #7d7d7d; float:left; margin-left: 1px;">적립금</span>
						<span style="font-size: 20px;float: left;margin-left: 100px;" >${bookvo.bpoint } </span>
						<span style="font-size: 17px;float: left;margin-left: 20px;">point</span>
						<br>
						<br>
						<span style="font-size:17px;color: #7d7d7d; float:left; margin-left: 1px;">배송비</span>
						<span style="font-size: 20px;float: left;margin-left: 100px;" >${bookvo.bshipinfo } </span>
						<span style="font-size: 17px;float: left;margin-left: 20px;">원</span>
				</div>
				<br>

				<div id="detailcontent">
				<br>
				<br>
					<strong style="font-size:17px;color: #2E2E2E;text-align: center;">
					" ${bookvo.bcontent } "
					</strong>
				</div>
			</div>
			<div id="detailbtn">
				<button class="btn btn-success btn-lg btn-block"><a href="#">구매하기</a></button>
				<br>
				<br>
				<button class="btn btn-success btn-lg btn-block"><a href="#">장바구니</a></button>
			</div>
		</div>
		
		<div id="detaillower">
		
				<nav>
				  <div class="nav nav-tabs" id="nav-tab" role="tablist">
				    <a class="nav-item nav-link active" id="nav-detail-tab" data-toggle="tab" href="#nav-detail" role="tab" aria-controls="nav-detail" aria-selected="true" style="color: black;border: 1px solid #7d7d7d;"><strong>상세정보</strong></a>
				    <a class="nav-item nav-link" id="nav-qna-tab" data-toggle="tab" href="#nav-qna" role="tab" aria-controls="nav-qna" aria-selected="false" style="color: black;border: 1px solid #7d7d7d;"><strong>교환 및 환불 정보</strong></a>
				    <a class="nav-item nav-link" id="nav-review-tab" data-toggle="tab" href="#nav-review" role="tab" aria-controls="nav-review" aria-selected="false" style="color: black;border: 1px solid #7d7d7d;"><strong>리뷰</strong></a>
				  </div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
				  <div class="tab-pane fade show active" id="nav-detail" role="tabpanel" aria-labelledby="nav-detail-tab">
					<br>
					<br>
					<h3 style="text-align: center;">상세정보
					<br><br>
					<img src="${cp }/resources/JIMIN/images/상세페이지1.jpg" id="detailimg"/>
					</h3>
				  </div>
				  <div class="tab-pane fade" id="nav-qna" role="tabpanel" aria-labelledby="nav-qna-tab">
					<div class="box_detail_content">
						<br>
							<h2>교환/반품/품절안내</h2><br>
							<p>※ 상품 설명에 반품/교환 관련한 안내가 있는 경우 그 내용을 우선으로 합니다. (업체 사정에 따라 달라질 수 있습니다.)</p>
							<table >
							<caption class="caption_hidden">교환/반품/품절안내</caption>
							<colgroup>
								<col width="22%">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">반품/교환방법</th>
									<td><strong>마이룸 &gt; 주문관리 &gt; 주문/배송내역 &gt; 주문조회 &gt; <a href="http://www.kyobobook.co.kr/myroom/orderList.laf">반품/교환신청</a> , <br>
										<a href="http://www.kyobobook.co.kr/cscenter/qnaForm.laf?questionType=003">[1:1상담&gt;반품/교환/환불]</a> 또는 고객센터 (1544-1900)</strong><br>
										※ 오픈마켓, 해외배송주문, 기프트 주문시 <a href="http://www.kyobobook.co.kr/cscenter/qnaForm.laf?questionType=003">[1:1상담&gt;반품/교환/환불]</a><br>
										&nbsp; &nbsp; 또는 고객센터 (1544-1900)</td>
								</tr>
								<tr>
									<th scope="row">반품/교환가능 기간</th>
									<td>변심반품의 경우 수령 후 7일 이내,<br> 상품의 결함 및 계약내용과 다를 경우 문제점 발견 후 30일 이내</td>
								</tr>
								<tr>
									<th scope="row">반품/교환비용</th>
									<td>변심 혹은 구매착오로 인한 반품/교환은 반송료 고객 부담</td>
								</tr>
								<tr>
									<th scope="row">반품/교환 불가 사유</th>
									<td>
										<ul class="list_normal">
											<li>소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우<br> (단지 확인을 위한 포장 훼손은 제외)</li>
											<li>소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우<br> 예) 화장품, 식품, 가전제품(악세서리 포함) 등</li>
											<li>복제가 가능한 상품 등의 포장을 훼손한 경우<br> 예) 음반/DVD/비디오, 소프트웨어, 만화책, 잡지, 영상 화보집</li>
											<li>소비자의 요청에 따라 개별적으로 주문 제작되는 상품의 경우 ((1)해외주문도서)</li>
											<li>디지털 컨텐츠인 eBook, 오디오북 등을 1회 이상 다운로드를 받았을 경우</li>
											<li>시간의 경과에 의해 재판매가 곤란한 정도로 가치가 현저히 감소한 경우</li>
											<li>전자상거래 등에서의 소비자보호에 관한 법률이 정하는 소비자 청약철회 제한 내용에<br> 해당되는 경우</li>
										</ul>
										(1) 해외주문도서 : 이용자의 요청에 의한 개인주문상품으로 단순변심 및 착오로 인한 취소/교환/반품 시 ‘해외주문 반품/취소 수수료’ 고객 부담 (해외주문 반품/취소 수수료 : ①양서-판매정가의 12%, ②일서-판매정가의 7%를 적용)
										
									</td>
								</tr>
								<tr>
									<th scope="row">상품 품절</th>
									<td>공급사(출판사) 재고 사정에 의해 품절/지연될 수 있으며, 품절 시 관련 사항에 대해서는<br> 이메일과 문자로 안내드리겠습니다.</td>
								</tr>
								<tr>
									<th scope="row">소비자 피해보상<br>
									  환불지연에 따른 배상</th>
									<td>
										<ul class="list_normal">
											<li>상품의 불량에    의한 교환, A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은<br> 소비자분쟁해결 기준 (공정거래위원회 고시)에 준하여 처리됨</li>
											<li>대금 환불 및 환불지연에 따른 배상금 지급 조건, 절차 등은 전자상거래 등에서의<br> 소비자 보호에 관한 법률에 따라 처리함</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				  </div>
				  <div class="tab-pane fade" id="nav-review" role="tabpanel" aria-labelledby="nav-review-tab">
				  	리뷰게시판입니다~~~
				  	리뷰게시판입니다~~~
				  	리뷰게시판입니다~~~
				  	리뷰게시판입니다~~~
				  	리뷰게시판입니다~~~
				  </div>
				</div>
				
	</div>
</div>
<br>
<br>
</body>
</html>