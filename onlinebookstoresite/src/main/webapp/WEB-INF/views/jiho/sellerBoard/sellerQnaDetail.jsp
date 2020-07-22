<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	height: 600px;
	border: 1px solid red;
	margin: auto;
}
#sellerMoon table{
	border: 1px solid black;
	border-collapse: collapse;
	width: 1000px;
	height: 200px;
}
#sellerMoon table tr,td{
	border: 1px solid #444444;
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
</style>
<div id="obQnaDetail">
	<h1>문의사항 상세</h1>
	<div id="sellerMoon">
		<table>
			<tr>
				<td class="moondetail">작성자</td>
				<td class="moondetailText">${qnaList.mid }</td>
				<td class="moondetail">등록일자</td>
				<td class="moondetailText"><fmt:formatDate value="${qnaList.obqdate }" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td colspan="1" class="moondetail">문의한 상품</td>
				<td colspan="3" style="padding-left: 10px">
					<img src="${cp }/resources/jh/jhobupload/${img.imgsavefilename}">
					[중고] ${qnaList.obname }</td>
			</tr>
			<tr>
				<td colspan="1" class="moondetail">문의내용</td>
				<td colspan="3" style="padding-left: 10px">${qnaList.obqcontent }</td>
			</tr>
		</table>
	</div>
</div>