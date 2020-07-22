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
#sellerMoon table{
	border: 1px solid black;
	border-collapse: collapse;
	width: 1000px;
	
}
#sellerMoon table tr,td{
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
</style>
<div id="obQnaDetail">
	<h1>문의사항 상세</h1>
	<div id="sellerMoon">
		<table>
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
		<%--답변이 없을 경우 --%>
		<c:if test="${answerList==nul }">
			<table>
				<tr>
					<td>이미지</td>
					<td>
						<textarea rows="5" cols="200"></textarea>
					</td>
				</tr>
			</table>
		</c:if>
	</div>
</div>