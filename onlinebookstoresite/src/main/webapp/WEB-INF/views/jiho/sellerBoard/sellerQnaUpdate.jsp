<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<div id="obQnaDetail">
	<h1><img src="${cp }/resources/jh/jhimages/문의사항 수정_1.png"></h1>
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
			<form action="${cp }/seller/goqnaupdate" method="post">
				<div id="sellerdap">
					<input type="hidden" value="${qnaList.obqnum }" name="obqnum">
					<img id="dapimg" src="${cp}/resources/jh/jhimages/문의답글이미지.jpg" >
						<textarea rows="5" cols="110" id="dapTextarea" name="obqacontent">${answerList.obqacontent}</textarea>
				</div>
				<button type="submit" class="btn btn-primary">수정하기</button>
				<a href="${cp }/seller/qnalist"><button type="button" class="btn btn-secondary">리스트보기</button></a>
			</form>
	</div>
</div>
<script>
	$(function(){
		$("form").submit(function(){
			var obqacontent=$("#dapTextarea").val();
			if(obqacontent==""){
				alert("내용을 입력해주세요.");
				return false;
			}
		});
	});
</script>