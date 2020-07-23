<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<style>
/*=========중고판매자 Qna관련 css==========*/
#sellerQnaContent{
	width: 1300px;
	height: 900px;
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
	height: 600px;
	border: 1px solid green;
}
/*답변css*/
.sellerDap{
    padding-left: 70px;
    padding-right: 70px;
}

</style>
<div id="sellerQnaContent">
	<!-- 검색박스 -->
	<div id="sellerQnaSearchBox">
		<h2>QnA리스트1111111111</h2>
			<table class="table table-bordered">
				<tr>
					<td class="tdstyle" id="statusa">답변 상태별 조회</td>
					<td class="prodLooktdStyle">
						<input type="radio" name="obqstatus" value="2">전체
						<input type="radio" name="obqstatus" value="0">미답변
						<input type="radio" name="obqstatus" value="1">답변완료
					</td>
				</tr>
				<tr>
					<td class="tdstyle">등록일자별 조회</td>
					<td class="prodLooktdStyle">
						<input type="radio" name="obqdate" value="all">전체
						<input type="radio" name="obqdate" value="date">일자별&nbsp;&nbsp;&nbsp;
						<input type="date" name="startDay"><span>&nbsp;~</span>
						<input type="date" name="endDay">
					</td>
				</tr>
				<tr>
					<td class="tdstyle">키워드로 검색</td>
					<td>
						<div class="input-group mt-1 mb-1">
							<div class="input-group-prepend">
								<select name="field" class="form-control">
									<option value="all">전체</option>
									<option value="obqtitle">문의제목</option>
									<option value="mid">작성자</option>
								</select>
							</div>
							<input type="text" name="keyword" class="form-control" placeholder="검색어를 입력하세요.">
							<!-- 버튼 -->
							<input type="submit" value="검색" class="btn btn-success" id="list2bt">
							<input type="button" value="검색조건 초기화" id="resetBt" class="btn btn-secondary">
						</div>
					</td>
				</tr>
			</table>
	</div>
	<!-- QnA리스트 -->
	<div id="sellerQnaList">
		<form action="">
			<h3>문의리스트</h3>
			<div class="layer1">
				<table class="table table-bordered">
					<thead 
					class="thead-dark">
						<tr style="text-align: center">
							<th width="80">NO</th>
							<th>문의제목</th>
							<th width="200">작성자</th>
							<th width="120">답변상태</th>
							<th width="120">게시물관리</th>
							<th width="120">작성일</th>
						</tr>
					</thead>
					<c:forEach var="vo" items="${list }" >
							<tr>
								<td style="text-align: center;">번호</td>					
								<td><a href="${cp }/seller/qnadetail?obqnum=${vo.obqnum}"><span style="color: black;">${vo.obqtitle }</span></a></td>					
								<td style="text-align: center;">${vo.mid }</td>					
								<td style="text-align: center;">
									<c:if test="${vo.obqstatus==0 }">
										<span class="badge badge-primary">미답변</span>
									</c:if>
									<c:if test="${vo.obqstatus==1 }">
										<span class="badge badge-secondary">답변완료</span>
									</c:if>
								</td>				
								<td style="text-align: center;">
									<c:if test="${vo.obqstatus==0 }">
										<a href="${cp }/seller/qnadetail?obqnum=${vo.obqnum}">
											<button type="button" class="btn btn-primary btn-sm" >답변하기</button>
										</a>
									</c:if>
									<c:if test="${vo.obqstatus==1 }">
										<a href="${cp }/seller/qnaupdate?obqnum=${vo.obqnum}">
											<button type="button" class="btn btn-secondary btn-sm">수정하기</button>
										</a>
									</c:if>
								</td>	
								<td style="text-align: center;"><fmt:formatDate value="${vo.obqdate }" pattern="yyyy-MM-dd"/></td>					
							</tr>
					</c:forEach>
				</table>
			</div>
		</form>
	</div>
</div>
<script>

//	답글처리기능
	function insertAnswer(obqnum) {
		var content=$("input[name=content]").val();
		$.ajax({
			url: "${cp}/seller/insertAnswer?obqnum="+obqnum+"&obqacontent="+content,
			dataType:"json",
			success:function(data){
				console.log(data.code);
				if(data.code=="success"){
					alert("성공");
				}else{
					alert("실패");
				}
			}
		});
	}	
/*
	$(document).ready(
		function() {
			jQuery(".content").hide();
			//content 클래스를 가진 div를 표시/숨김(토글)
			$(".heading").click(
				function() {
					$(".content").not($(this).next(".content").slideToggle(500)).slideUp();
			});
		
	});*/
</script>