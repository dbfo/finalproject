<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<style>
/*문의사항 상세페이지css*/
#obQnaDetail{
	width: 1300px;
	height: 900px;
	border: 1px solid black;
	margin: auto;
}
#sellerMoon{
	width: 1000px;
	height: 700px;
	border: 1px solid red;
	margin: auto;
}
#sellerQnatable tr,td{
	border: 1px solid black;
	border-collapse: collapse;
	width: 1000px;
	
}
#sellerQnatable tr,td{
	border: 1px solid #B4B7B7;
}
.moondetail{
	text-align: center;
	background-color: #EDEDED;
	width: 200px;
}
.moondetailText{
	text-align: center;
	width: 400px;
}
#thumb{
	border: 1px solid #eaeaea;
	width: 120px;
	height: 180px;
    margin-top: 10px;
    margin-bottom: 10px;
}
/*답변css*/
#dapTable{
    margin-top: 30px;
   
}
#dapTextarea{
    margin-left: 10px;
    margin-top: 30px;
    border: 2px solid black;
    border-radius: 10px 10px 10px 10px;
    padding-left: 10px;
    margin-right: 10px;
    display: inline;
}
#sellerdap{
	border: 1px solid black;
	height: 180px;
}
#dapimg{
	float:left;
	width: 160px;
	margin: 0px;
	padding: 0px;
}
</style>
<div id="obQnaDetail">
	<h1>문의사항 상세</h1>
	<div id="sellerMoon">
		<table id="sellerQnatable">
			<tr height="70">
				<td class="moondetail">작성자</td>
				<td class="moondetailText">${qnaList.mid }</td>
				<td class="moondetail">등록일자</td>
				<td class="moondetailText"><fmt:formatDate value="${qnaList.obqdate }" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td colspan="1" class="moondetail">문의한 상품</td>
				<td colspan="3" style="padding-left: 10px">
					<img src="${cp }/resources/jh/jhobupload/${img.imgsavefilename}" id="thumb">
					[중고] ${qnaList.obname }</td>
			</tr>
			<tr height="100">
				<td colspan="1" class="moondetail">문의내용</td>
				<td colspan="3" style="padding-left: 10px">${qnaList.obqcontent }</td>
			</tr>
		</table>
		<input type="hidden" value="${qnaList.obqnum } id="obqnum">
		<%--답변이 없을 경우 --%>
		<c:if test="${answerList==nul }">
			<div id="sellerdap">
				<img id="dapimg" src="${cp}/resources/jh/jhimages/문의답글이미지.jpg" >
					<textarea rows="5" cols="110" id="dapTextarea"></textarea>
			</div>
			<button type="button" class="btn btn-primary" onclick="insertDap(${qnaList.obqnum})">답변등록하기</button>
			<button type="button" class="btn btn-secondary">리스트보기</button>
		</c:if>
		<%--답변이 있을 경우 --%>
		<c:if test="${answerList !=null }">
			답변있음~
		</c:if>
	</div>
</div>
<script>
	function insertDap(obqnum) {
		var obqacontent=$("#dapTextarea").val();
		alert(obqacontent);
	}


</script>