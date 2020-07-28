<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<br>
<br>
	<div  class="container" id="detailallwrap">
		<div id="detailupper">
			<div id="detailinfo">
				<img id="detailbook_img"
				src="${cp }/resources/JIMIN/images/${img1.imgsavefilename}" id="thumbnail">
				
				<div id="detailbookNameTitle">
				<strong style="font-size: x-large;">${oldbookvo.obname }</strong>
				</div>
				<br>
				<br>
				<div id="detailwriter">
						<span style="font-size: 15px; color: #7d7d7d;">저 자 : </span><strong>${oldbookvo.obwriter }</strong>
						ㅣ				
						<span style="font-size: 15px; color: #7d7d7d;">출판사 : </span><strong>${oldbookvo.obpublisher }</strong>
						ㅣ					
						<span style="font-size: 15px; color: #7d7d7d;">등록일 : </span><strong><fmt:formatDate value="${oldbookvo.obregdate }" pattern="yyyy-MM-dd"/></strong>
				</div>
				<br>
				<br>
				<div id="detailprice">
						<c:set var="status" value="${oldbookvo.obstatus }"/>
						
						<c:if test="${status == 1 }">
							<span style="font-size:17px;color: #7d7d7d; float:left; margin-left: 1px;">상태</span>
							<span style="font-size: 22px;font-weight: bold ; color: orange;float: left;margin-left: 100px;" >
							&nbsp 최상 </span>
						</c:if>
						<c:if test="${status == 2 }">
							<span style="font-size:17px;color: #7d7d7d; float:left; margin-left: 1px;">상태</span>
							<span style="font-size: 22px;font-weight: bold ; color: orange;float: left;margin-left: 100px;" >
							&nbsp 상 </span>
						</c:if>
						<c:if test="${status == 3 }">
							<span style="font-size:17px;color: #7d7d7d; float:left; margin-left: 1px;">상태</span>
							<span style="font-size: 22px;font-weight: bold ; color: orange;float: left;margin-left: 100px;" >
							&nbsp 중 </span>
						</c:if>
						<c:if test="${status == 4 }">
							<span style="font-size:17px;color: #7d7d7d; float:left; margin-left: 1px;">상태</span>
							<span style="font-size: 22px;font-weight: bold ; color: orange;float: left;margin-left: 100px;" >
							&nbsp 하 </span>
						</c:if>
						<br>
						<br>
						<span style="font-size:17px;color: #7d7d7d; float:left; margin-left: 1px;">정상가</span>
						<span style="font-size: 22px;font-weight: bold ; color: red;float: left;margin-left: 100px;" >
						${oldbookvo.oborgprice } </span>
						<span style="font-size: 18px;font-weight: bold ; color: red;float: left;margin-left: 10px;">원</span>
						<br>
						<br>
						<span style="font-size:17px;color: #7d7d7d; float:left; margin-left: 1px;">판매가</span>
						<span style="font-size: 22px;font-weight: bold ; color: red;float: left;margin-left: 100px;" >
						${oldbookvo.obsaleprice } </span>
						<span style="font-size: 18px;font-weight: bold ; color: red;float: left;margin-left: 10px;">원</span>
						<br>
						<br>
						<span style="font-size:17px;color: #7d7d7d; float:left; margin-left: 1px;">배송비</span>
						<span style="font-size: 20px;float: left;margin-left: 100px;" >${oldbookvo.obdelfee } </span>
						<span style="font-size: 17px;float: left;margin-left: 20px;">원</span>
				</div>
				<br>

				<div id="detailcontent">
				<br>
				<br>
					<strong style="font-size:17px;color: #2E2E2E;text-align: center;">
					" ${oldbookvo.obdetail } "
					</strong>
				</div>
			</div>
			<div id="detailbtn">
				<button class="btn btn-success btn-lg btn-block" id="buynow"><a href="${cp }/order/directUsedOrder?obnum=${oldbookvo.obnum}&bcount=1">구매하기</a></button>
				<br>
				<br>
				<button class="btn btn-success btn-lg btn-block" id="cartBtn">장바구니</button>
				<input type="hidden" id="obnum" value="${oldbookvo.obnum}">
				<br>
				<br>
				<span style="text-align: center;"><strong>재고수량:</strong></span>
				<input type="text" readonly="readonly" style="width:100px; border-style: none; color: red;" id="obcnt1" value="1">
				<br>
				<br>
			</div>
		</div>
		
		<div id="detaillower">
		
				<nav>
				  <div class="nav nav-tabs" id="nav-tab" role="tablist">
				    <a class="nav-item nav-link active" id="nav-detail-tab" data-toggle="tab" href="#nav-detail" role="tab" aria-controls="nav-detail" aria-selected="true" style="color: black;border: 1px solid #7d7d7d;"><strong>상세정보</strong></a>
				    <a class="nav-item nav-link" id="nav-qna-tab" data-toggle="tab" href="#nav-qna" role="tab" aria-controls="nav-qna" aria-selected="false" style="color: black;border: 1px solid #7d7d7d;"><strong>QnA</strong></a>
				    <a class="nav-item nav-link" id="nav-review-tab" data-toggle="tab" href="#nav-review" role="tab" aria-controls="nav-review" aria-selected="false" style="color: black;border: 1px solid #7d7d7d;"><strong>리뷰</strong></a>
				  </div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
				  <div class="tab-pane fade show active" id="nav-detail" role="tabpanel" aria-labelledby="nav-detail-tab">
					<br>
					<br>
					<h3 style="text-align: center;">상세정보
					<br><br>
					<img src="${cp }/resources/JIMIN/images/${img2.imgsavefilename}" id="detailimg"/>
					</h3>
				  </div>
				  <div class="tab-pane fade" id="nav-qna" role="tabpanel" aria-labelledby="nav-qna-tab">
					<div class="box_detail_content">
								<h3 style="text-align: center;">QnA</h3>
								<br><br>
								<table border="1" width="1110px" style="text-align: center;vertical-align: middle;">
									<tr>
										<th><strong>작성자</strong></th>
										<th><strong>제목</strong></th>
										<th><strong>내용</strong></th>
										<th><strong>작성일</strong></th>
										<th><strong>삭제</strong></th>
									</tr>
									<c:forEach var="vo" items="${qnavo }">
											<input type="hidden" id="obqnum" value="${vo.obqnum}">
											<input type="hidden" id="qnamnum" value="${vo.mnum }">
										<tr>
											<td>${vo.mid }</td>
											<td>${vo.obqtitle }</td>
											<td>${vo.obqcontent }</td>
											<td><fmt:formatDate value="${vo.obqdate }"></fmt:formatDate></td>
											<td><button id="qnadel" style="background-color: orange">삭제</button></td>
										</tr>
									</c:forEach>
								</table>
								페이지
								<div>
								</div>
					<div class="tabqnaWrite">	
					<form id="qnaform" method="GET" action="${cp }/enrllQna">
					
						<input type="hidden" id="obnum" name="obnum" value="${obnum}">
						<input type="hidden" id="snum" name="snum" value="${snum}">
						<input type="hidden" id="mnum" name="mnum" value="${mnum }">
						
						
						
						<div style=" width: 1110px;background-color:#f9f9f9 ;padding: 12px 20px 19px 20px; overflow: hidden; border: 2px solid #f9f9f9">
							<br>
							<span style="font-size: 20px;"><strong>QnA문의</strong></span> 
							<dl>
								<br>
								<strong>제목</strong>
								<br>
								<span>
									<textarea name="obqtitle" style="width:900px;height:30px;"></textarea>
								</span>
								<br>
								<strong>내용</strong>
								<br>
								<span>
									<textarea name="obqcontent" style="width:900px;height:100px;"></textarea>
									<input type="submit" style="display:inline-block  ;float:right ; margin-right:50px;  margin-bottom: 18px; " class="btn btn-success" id="enrollBtn" value="등록하기"> 
								</span>
							</dl>
						</div>
					</form>	
					</div>
					</div>
				  </div>
				  <div class="tab-pane fade" id="nav-review" role="tabpanel" aria-labelledby="nav-review-tab">
							
					<div class="tabWrite">	
					<!-- <form name="form" method="post" action="/ypbooks/book/pop_review_proc.jsp" target="ifrmProc"> -->
					<form id="insertform" method="GET" action="${cp }/enrllReview">
					
						<input type="hidden" name="obnum" value="${obnum}">
<!-- 						<input type="hidden" name="mnum" value="4"> -->
						
						<div style=" width: 1110px;background-color:#f9f9f9 ;padding: 12px 20px 19px 20px; overflow: hidden; border: 2px solid #f9f9f9">
							<span style="font-size: 20px;"><strong>독자서평 쓰기</strong></span>
							 <span style="font-size: 12px;">로그인을 하시면 독자서평을 쓰실 수 있습니다.</span> 
							<dl>
								<input type="hidden" name="review_name" id="review_name" value="지쳤거나 좋아하는 게 없거나">
								<br>
								<div>
								<strong>도서평점</strong>&nbsp&nbsp&nbsp
									<input type="radio" value="1" name="bscore" class="writeRadio"><span style="color: red;">&nbsp ★</span>
									&nbsp
									<input type="radio" value="2" name="bscore" class="writeRadio"><span style="color: red;">&nbsp ★★</span>
									&nbsp
									<input type="radio" value="3" name="bscore" class="writeRadio" checked="checked"><span style="color: red;">&nbsp ★★★</span>
									&nbsp
									<input type="radio" value="4" name="bscore" class="writeRadio"><span style="color: red;">&nbsp ★★★★</span>
									&nbsp
									<input type="radio" value="5" name="bscore" class="writeRadio"><span style="color: red;">&nbsp ★★★★★</span>
									&nbsp
								</div>
								<br>
								<strong>내용</strong>
								<br><br>
								<span>
									<textarea name="reviewcontent" style="width:900px;height:100px;"></textarea>
									<input type="submit" style="display:inline-block  ;float:right ;margin-bottom: 18px; " class="btn btn-success" id="enrollBtn" value="등록하기"> 
								</span>
							</dl>
						</div>
					</form>

<!-- 					<table style="width:1110px;" class="writeList1"> -->
<%-- 						<c:forEach var ="rvo" items="${reviewvo }"> --%>
<!-- 						<tbody style="width:1110px;border: 1px solid #7d7d7d;"> -->
<!-- 						<tr> -->
<%-- 							<td style=" width:13%;" id="mid" >${rvo.mname }</td> --%>
<!-- 							<td style="width:19%;" id="mscore">		 -->
							
<%-- 							<c:set var="score" value="${rvo.bscore }" /> --%>

<%-- 								<c:if test="${score eq 5 }"> --%>
<!-- 									<span style="color: red;">★★★★★</span> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test="${score eq 4 }"> --%>
<!-- 									<span style="color: red;">★★★★</span> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test="${score eq 3 }"> --%>
<!-- 									<span style="color: red;">★★★</span> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test="${score eq 2 }"> --%>
<!-- 									<span style="color: red;">★★</span> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test="${score eq 1 }"> --%>
<!-- 									<span style="color: red;">★</span> -->
<%-- 								</c:if> --%>
<%-- <%-- 								<span>${rvo.bscore }</span> --%> --%>
<!-- 							</td> -->
<%-- 							<td class="tdCen" id="mdate"><fmt:formatDate value="${rvo.breviewregdate }"></fmt:formatDate></td> --%>
<!-- 						</tr> -->
<!-- 						<tr class="writeCon02"> -->
<!-- 							<td colspan="4" id="mwrite"> -->
<%-- 								<span>${rvo.reviewcontent }</span> --%>
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 						</tbody> -->
<%-- 						</c:forEach> --%>
<!-- 					</table> -->
					<br>
						<div>
<%-- 						   <c:choose> --%>
<%-- 				               <c:when test="${pu.startPageNum>1 }"> --%>
<!-- 				                  <button style="width: 50px; border-radius: 5px / 5px;"> -->
<%-- 				                  	<a style="color: black;" href="bdetail?pageNum=${pu.startPageNum-1 }&field=${field}&keyword=${keyword}&bnum=${bnum}"> --%>
<!-- 				                  	<strong style="color: black;">이전글</strong> -->
<!-- 				                  	</a> -->
<!-- 				                  </button> -->
<%-- 				               </c:when> --%>
<%-- 				               <c:otherwise> --%>
<!-- 				                  <button disabled="disabled"> -->
<!-- 				                  	<a href="#">이전글</a> -->
<!-- 				                  </button> -->
<%-- 				               </c:otherwise> --%>
<%-- 				            </c:choose> --%>
<%-- 								<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }"> --%>
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${i==pu.pageNum }"> --%>
<!-- 										<button style="border-style: none;border-style: ridge; width: 30px; border-radius: 5px / 5px;"> -->
<%-- 									 	<a href="obdetail?pageNum=${i }&field=${field}&keyword=${keyword}&obnum=${obnum}"> --%>
<%-- 									 	<span style="color:red">${i }</span> --%>
<%-- 									 	<strong style="color:red">${i }</strong> --%>
<!-- 									 	</a> -->
<!-- 									 	</button> -->
<%-- 								 	</c:when> --%>
<%-- 								 	<c:otherwise> --%>
<!-- 								 		<button style="border-style: none;width: 30px;border-radius: 5px / 5px;"> -->
<%-- 									 	<a href="obdetail?pageNum=${i }&field=${field}&keyword=${keyword}&obnum=${obnum}"> --%>
<%-- 									 	<span style="color: black">${i }</span> --%>
<%-- 									 	<strong style="color:black">${i }</strong> --%>
<!-- 									 	</a> -->
<!-- 									 	</button> -->
<%-- 								 	</c:otherwise> --%>
<%-- 							 	</c:choose> --%>
<%-- 								</c:forEach> --%>
							</div>
					</div>
				  </div>
				</div>
	</div>
</div>
<br>
<br>
<script>
//    $(document).on('click','#gocart',function(){
// 		var form=$('<form></form>');
// 		form.attr('action','${cp}/order/usedorder');
// 		form.attr('method','post');
// 		form.appendTo('body');
// 		var sid=$(this).data('sid');
// 		$("."+sid+"_checkTd").each(function(){
// 			if($(this).is(':checked')){
// 				var cartNumValue=$(this).data('cartnum');
// 				var cartNum=$("<input type='hidden' value="
// 						+cartNumValue+" name='cartNum'>");
// 				form.append(cartNum);
// 			}
// 		});
// 		form.submit();
// 	})
   
	$("#cartBtn").click(function(){
		var obnum=$("#obnum").val();
//  		var buycount=$("#obcnt1").val();
 		var buycount=1;
		$.post("${cp }/cart/oldinsert?obnum="+obnum+"&bcount="+buycount, function(data){
			console.log("callback");
			if(data=="success"){
				alert("장바구니에 담았습니다.");
			}else{
				alert("장바구니 담기 실패입니다.");
			}
		});
	});
	$("#qnadel").click(function(){
		var obqnum=$("#obqnum").val();
		var obnum=$("#obnum").val();
		var snum=$("#snum").val();
		var mnum=$("#mnum").val();
		var qnamnum=$("#qnamnum").val();
		console.log("obqnum="+obqnum);
		console.log("obnum="+obnum);
		console.log("snum="+snum);
		console.log("mnum="+mnum);
		console.log("qnamnum="+qnamnum);
		
		if(mnum == qnamnum){
			$.get("${cp }/delqna?obqnum="+obqnum+"&obnum="+obnum+ "&snum=" +snum,function(data){
				console.log("callback");
				window.location.reload();
			});
		}else{
			alert("본인이 작성한 글이 아닙니다.");
		}
	});

</script>