<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<style>
#salesManagement {
	width: 1300px;
	height: 1300px;
	border: 1px solid red;
	margin: auto;
}
/*판매관리 상단메뉴css*/
/*
body {
	color: #555;
	background: #eeeeee;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
*/
p {
	margin: 0 0 20px;
	line-height: 1.5;
}

.salesTopMenu {
	width: 1300px;
	height:1250px;
	border:1px solid black;
	/*max-width: 800px;*/
	padding: 50px;
	margin: 0 auto;
	background: #ffffff;
}

.salesTopMenu section {
	display: none;
	padding: 20px 0 0;
	border-top: 1px solid #ddd;
}

/*라디오버튼 숨김*/
.salesTopMenu input[name='tabs'] {
	display: none;
}

.salesTopMenu label {
	display: inline-block;
	margin: 0 0 -1px;
	padding: 15px 25px;
	font-weight: 600;
	text-align: center;
	color: #bbb;
	border: 1px solid transparent;
}

.salesTopMenu label:hover {
	color: #2e9cdf;
	cursor: pointer;
}

/*input 클릭시, label 스타일*/
.salesTopMenu input:checked+label {
	color: #555;
	border: 1px solid #ddd;
	border-top: 2px solid #2e9cdf;
	border-bottom: 1px solid #ffffff;
}

#tab1:checked ~ #content1, 
#tab2:checked ~ #content2, 
#tab3:checked ~	#content3, 
#tab4:checked ~ #content4 {
	display: block;
}
/*입금대기중 css*/
#detail1{
	border: 1px solid green;
	height: 1100px;
}
.toptr{
	text-align: center;
}
#detail1 table .toptr{
	height: 30px;
	background-color: silver;
}
#searchBox1{
	width: 1200px;
	height: 200px;
	border: 1px solid red;
}
input[name='keyword1']{
	margin-left: 20px;
	margin-right: 10px;
}
input[name='borderdate1']{
	margin-left: 20px;
	margin-right: 10px;
}
input[name='field1']{
	margin-left:20px;
	width: 400px;
	display: inline;
}
#slaesListbt1{
	margin-left: 10px;
	margin-right: 10px;
}
</style>
<div id="salesManagement">
	<h2>판매관리</h2>
	<!-- 상단 탭메뉴 -->
	<div class="salesTopMenu">
	
		<input id="tab1" type="radio" name="tabs" <c:if test="${tabType==1 }">checked</c:if>><label for="tab1">입금대기중</label> <!--디폴트 메뉴-->
		<input id="tab2" type="radio" name="tabs" <c:if test="${tabType==2 }">checked</c:if>><label for="tab2">입금완료/배송요청</label>
		<input id="tab3" type="radio" name="tabs" <c:if test="${tabType==3 }">checked</c:if>><label for="tab3">배송중/구매확정전</label>
		<input id="tab4" type="radio" name="tabs" <c:if test="${tabType==4 }">checked</c:if>> <label for="tab4">구매확정/정산대기</label>
		
		<!-- 입금대기중 -->
		<section id="content1">
			<div id="detail1">
				<div id="searchBox1">
					<!-- 검색박스 -->
					<table class="table table-bordered">
						<tr>
							<th scope="col" rowspan="3" style="background-color: silver;" width="250">주문조회</th>
							<td>
								<input type="checkbox" name="keyword1" value="all">전체
								<input type="checkbox" name="keyword1" value="obname">상품명
								<input type="checkbox" name="keyword1" value="mname">주문인
								<input type="checkbox" name="keyword1" value="receiver">수령인
							</td>
						</tr>
						<tr>
							<td>
								<input type="radio" name="borderdate1" value="0">전체
								<input type="radio" name="borderdate1" value="1">일자별&nbsp;&nbsp;&nbsp;
								<input type="date" name="startDay"><span>&nbsp;~</span>
								<input type="date" name="endDay">
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="field1" class="form-control" placeholder="검색어를 입력하세요.">
								<!-- 버튼 -->
								<input type="submit" value="검색" class="btn btn-success" id="slaesListbt1">
								<input type="button" value="검색조건 초기화" id="resetBt" class="btn btn-secondary">
							</td>
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
							<th scope="col" rowspan="2" width="400">상품정보</th>
							<th scope="col">주문인</th>
							<th scope="col">총 주문금액</th>
							<th scope="col" rowspan="2">총 합계</th>
							<th scope="col" rowspan="2">주문일</th>
						</tr>
						<tr class="toptr">
							<th scope="col">수령인</th>
							<th scope="col">배송비</th>
						</tr>
					</thead>
					<c:forEach var="vo" items="${list1 }" varStatus="status">
						<tr>
							<th scope="col" width="60" rowspan="2" style="text-align: center;">1</th>
							<th scope="col" width="100" rowspan="2" style="text-align: center;">${vo.bpaynum }</th>
							<th scope="col" rowspan="2" width="400">
								<c:forEach var="oldbook" items="${vo.sellerOldbooksVo }">
									상품명:${oldbook.obname }	| 수량: 1개 | 판매가 : ${oldbook.obsaleprice }원<br>
								</c:forEach>
							</th>
							<th scope="col" style="text-align: center;margin: auto;">${vo.mname }</th>
							<th scope="col" style="text-align: right;">${vo.ordermoney }원</th>
							<th scope="col" rowspan="2" style="text-align: right;margin: auto;">${vo.bfinalmoney }원</th>
							<th scope="col" rowspan="2" style="text-align: center;"><fmt:formatDate value="${vo.borderdate }" pattern="yyyy-MM-dd"/></th>
						</tr>
						<tr>
							<th scope="col" style="text-align: center;">${vo.receiver }</th>
							<th scope="col" style="text-align: right;">${vo.delfee }원</th>
						</tr>
					</c:forEach>	
				</table>
				<!-- 페이징버튼 -->
				<div>
					<ul class="pagination justify-content-center">
						<!-- 이전버튼 -->
						<li class="page-item"><a class="page-link" href="">이전</a></li>
						
							<li class="page-item"><a class="page-link" href="">1</a></li>
						<!-- 다음버튼 -->
						<li class="page-item"><a class="page-link" href="">다음</a></li>
					</ul>
				</div>
			</div>
		</section>
		<!-- 입금완료/배송요청 -->
		<section id="content2">
			<p>tab menu2의 내용</p>
		</section>

		<!-- 배송중/구매확정전 -->
		<section id="content3">
			<p>tab menu3의 내용</p>
		</section>


		<!-- 구매확정/정산대기 -->
		<section id="content4">
			<p>tab menu4의 내용</p>
		</section>
	</div>
</div>