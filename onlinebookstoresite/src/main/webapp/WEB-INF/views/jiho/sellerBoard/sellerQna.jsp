<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
/*=========중고판매자 Qna관련 css==========*/
#sellerQnaContent{
	width: 1300px;
	height: 1200px;
	margin: auto;
	border: 1px solid black;
}
/*중고판매자 QnA검색박스css*/
#sellerQnaSearchBox{
	width: 1300px;
	height: 300px;
	border: 1px solid red;
}
/*중고판매자 Qna 리스트 css*/
#sellerQnaList{
	width: 1300px;
	height: 900px;
	border: 1px solid green;
}

</style>
<div id="sellerQnaContent">
	<!-- 검색박스 -->
	<div id="sellerQnaSearchBox">
		<h2>QnA리스트1111111111</h2>
	</div>
	<!-- QnA리스트 -->
	<div id="sellerQnaList">
		<h3>문의리스트</h3>
		<div class="layer1">
			<table class="table table-bordered">
				<thead class="thead-dark">
					<tr>
						<th>NO</th>
						<th>상품명</th>
						<th>문의제목</th>
						<th>작성자</th>
						<th>답변상태</th>
						<th>작성일</th>
					</tr>
				</thead>
			</table>
			
			
			
			<p class="heading">제목 1</p>
			<div class="content">첫 번째 컨텐츠<br>첫 번째 컨텐츠
			</div>
			<p class="heading">제목 2</p>
			<div class="content">
				두 번째 컨텐츠<br>두 번째 컨텐츠
			</div>
			<p class="heading">제목 3</p>
			<div class="content">
				세 번째 컨텐츠<br>세 번째 컨텐츠
			</div>
		</div>
	</div>
</div>
<script>

	$(document).ready(
		function() {
			jQuery(".content").hide();
			//content 클래스를 가진 div를 표시/숨김(토글)
			$(".heading").click(
				function() {
					$(".content").not($(this).next(".content").slideToggle(500)).slideUp();
			});
		});
</script>