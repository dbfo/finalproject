<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<style>
/*입금완료/배송요청중 css*/
#detail2 {
	border: 1px solid green;
	height: 1400px;
}

.toptr {
	text-align: center;
}

#detail2 table .toptr {
	height: 30px;
	background-color: silver;
}

#searchBox2 {
	width: 1200px;
	height: 200px;
	border: 1px solid red;
}

.borderdate2 {
	margin-left: 20px;
	margin-right: 10px;
}

#keyword_menu2{
	margin-left: 20px;
	width: 400px;
	display: inline;
}

#slaesListbt2 {
	margin-left: 10px;
	margin-right: 10px;
}

.field_menu2 {
	margin-right: 10px;
	margin-left: 20px;
}
</style>
<script type="text/javascript" src="${cp }/resources/jh/js/jquery-3.2.1.min.js"></script>
<form action="${cp }/seller/salesManagement2?tabType=2&keyword2=${map.keyword2}&startDay2=${map.startDay2}&
							endDay2=${map.endDay2}&field2=${map.field2}&bpaydate2=${map.bpaydate2}">
	<div id="detail2">
		<div id="searchBox2">
			<!-- 검색박스 -->
			<table class="table table-bordered">
				<tr>
					<th scope="col" rowspan="3" style="background-color: silver;" width="250">주문조회</th>
					<td><input type="radio" name="field2" value="all" class="field_menu2">전체
						<input type="radio" name="field2" value="obname" class="field_menu2">상품명
						<input type="radio" name="field2" value="mname" class="field_menu2">주문인
						<input type="radio" name="field2" value="receiver" class="field_menu2">수령인
					</td>
				</tr>
				<tr>
					<td><input type="radio" name="bpaydate2" value="1" class="borderdate2">전체
						<input type="radio" name="bpaydate2" value="2" class="borderdate2">결제일&nbsp;&nbsp;&nbsp;
						<input type="date" name="startDay2" value=""><span>&nbsp;~</span>
						<input type="date" name="endDay2" value=""></td>
				</tr>
				<tr>
					<td><input type="text" name="keyword2" class="form-control" id="keyword_menu2"
						placeholder="검색어를 입력하세요.">
						<!-- 버튼 -->
						<input type="submit" value="검색" class="btn btn-success" id="slaesListbt2">
						<input type="button" value="검색조건 초기화" id="resetBt2" class="btn btn-secondary"></td>
				</tr>
			</table>
		</div>
		<!-- 리스트 -->
		<h2>LIST</h2>
		<table class="table table-bordered">
			<thead class="thead-dark">
				<tr class="toptr">
					<th scope="col" width="60" rowspan="2">NO</th>
					<th scope="col" width="100" rowspan="2">주문번호</th>
					<th scope="col" width="400">상품정보</th>
					<th scope="col">상품합계</th>
					<th scope="col" rowspan="2">총 합계</th>
					<th scope="col" rowspan="2">결제일</th>
					<th scope="col" rowspan="2" width="120">출고처리</th>
				</tr>
				<tr class="toptr">
					<th scope="col">출고정보</th>
					<th scope="col">배송비</th>
				</tr>
			</thead>
			<c:forEach var="vo" items="${list }" varStatus="status">
				<tr>
					<td scope="col" width="60" rowspan="2">NO</td>
					<td scope="col" width="100" rowspan="2">${vo.bpaynum }</td>
					<td scope="col" width="400">
						<c:forEach var="book" items="${vo.sellerOldbooksVo }">
							▶상품명 : ${book.obname } | 수량 : 1개 | 상품금액 : ${book.obsaleprice }<br>
						</c:forEach>
					</td>
					<td scope="col">${vo.ordermoney }</td>
					<td scope="col" rowspan="2">${vo.bfinalmoney }</td>
					<td scope="col" rowspan="2">${vo.bpaydate }</td>
					<td scope="col" rowspan="2" width="120">버튼</td>
				</tr>
				<tr>
					<td scope="col">
						주문인/수령인 : ${vo.mname } / ${vo.receiver }<br>
						연락처 : ${vo.bphone } <br>
						<span class="addr">배송주소 : ${vo.baddr }</span>
					</td>
					<td scope="col">배송비</td>
				</tr>
			</c:forEach>
			
		</table>
		<!-- 페이징버튼 
		<div>
			<ul class="pagination justify-content-center">
				이전버튼 
				<c:if test="${pu.startPageNum>3 }">
					<li class="page-item"><a class="page-link"
						href="${cp}/seller/salesManagement?
									pageNum=${pu.startPageNum-1}&tabType=1&keyword1=${map.keyword1}&startDay=${map.startDay}&
									endDay=${map.endDay}&field1=${map.field1}&borderdate1=${map.borderdate1}">
							이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pu.startPageNum }"
					end="${pu.endPageNum}">
					<li class="page-item"><a class="page-link"
						href="${cp}/seller/salesManagement?pageNum=${i}&tabType=1
									&keyword1=${map.keyword1}&startDay=${map.startDay}&endDay=${map.endDay}&field1=${map.field1}&borderdate1=${map.borderdate1}">${i}</a></li>
				</c:forEach>
				 다음버튼
				<c:if test="${pu.totalPageCount>pu.endPageNum}">
					<li class="page-item"><a class="page-link"
						href="${cp}/seller/salesManagement?pageNum=${pu.endPageNum+1}&tabType=1
									&keyword1=${map.keyword1}&startDay=${map.startDay}
									&endDay=${map.endDay}&field1=${map.field1}&borderdate1=${map.borderdate1}">
							다음</a></li>
				</c:if>
			</ul>
		</div>-->
	</div>
</form>
<script>
	$(function(){
		$(".addr").each(function(i, e) {
			var str=$(this).text();
			str=str.replace(/\|/gi,' ');
			$(this).text(str);
		});
		
		$("input:radio[name=borderdate1]").click(function(){
			if($("input[name=borderdate1]:checked").val()=='2'){
				$("input[name=startDay]").attr("disabled",false);
				$("input[name=endDay]").attr("disabled",false);
			}
			if($("input[name=borderdate1]:checked").val()=='1'){
				$("input[name=startDay]").attr("disabled",true);
				$("input[name=endDay]").attr("disabled",true);
			}
		});
		//초기화버튼
		$("#resetBt1").click(function() {
			$("input[name=field1]")[0].checked=true;
			$("input[name=borderdate1]")[0].checked=true;
			$("input[name=startDay]").attr("disabled",true);
			$("input[name=startDay]").val("");
			$("input[name=endDay]").attr("disabled",true);
			$("input[name=endDay]").val("");
			$("input[name=keyword1]").val("");
		});
		$("form").submit(function() {
			//일자별 검색 유효성검사1
			if($("input[name=borderdate1]:checked").val()=='2'){
				if($("input[name=startDay]").val()==''){
					alert('시작 날짜를 입력해주세요.');
					return false;
				}
			}
			if($("input[name=borderdate1]:checked").val()=='2'){
				if($("input[name=endDay]").val()==''){
					alert('종료 날짜를 입력해주세요.');
					return false;
				}
			}
					
			//날짜 검색시 유효성검사2
			var startDay=$("input[name=startDay]").val();
			var endDay=$("input[name=endDay]").val();
			var startArr=startDay.split('-');
			var endArr=endDay.split('-');
			var start=startArr[0]+startArr[1]+startArr[2];
			var end=endArr[0]+endArr[1]+endArr[2];
			if(start>end){
				alert('검색 날짜를 올바르게 입력해주세요.');
				return false;
			}
		});
	});
		
</script>