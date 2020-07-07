<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- 다음주소api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 에디터api -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<!-- css적용 추후 파일에 따로 분리 예정임 -->
<style>
	#prodInputForm{
		border: 1px solid red;
		width: 1300px;
		height: 2100px;
		margin: auto;
	}
	#cate{ /*카테고리css*/
		width: 1300px;
		height: 200px;
		border: 1px solid black;
	}
	#cateck{
		width: 1300px;
		height: 50%;
		background-color: silver;
	}
	.bgtd{
		background-color: silver;
		width: 200px;
		height: 50px;
	}
	#basic{ /*상품기본정보 css*/
		width: 1300px;
		height: 300px;
		border: 1px solid yellow;
	}
	#infotable1 tr td input{
		width: 500px;
		height: 30px;
	}
	#price{ /*상품가격css*/
		width: 1300px;
		height: 300px;
		border: 1px solid blue;
	}
	.infotd2{
		width: 500px;
		height: 30px;
	}
	#ship{ /*배송정보*/
		width: 1300px;
		height: 300px;
		border: 1px solid green;
	}
	#infotable3 tr td input{
		height: 30px;
	}
	.addr{
		width: 500px;
	}
	#infotable4 tr td input{
		width: 500px;
		height: 30px;
	}
	#infotable5 tr td{
		height: 500px;
	}
	#summernote{
		height: 300px;
	}
	#bigbox{
		width: 200px;
		height: 300px;
		border: 1px solid black;
		float: left;
	}
	.selectbox{
		width: 150px;
		height:25px;
		padding-left: 20px;
	}
	#insertbt{
		margin: auto;
	}
</style>
<script>
	//에디터api적용
	$(document).ready(function() {
	  $('#summernote').summernote({
		  height:400
	  });
	});

	//주소api적용
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<form method="post" action="${pageContext.request.contextPath}/seller/prodInsert" enctype="multipart/form-data">
	<div id="prodInputForm">
		<h2>상품등록</h2>
		<!-- 카테고리등록 -->
		<div id="cate">
			<p>카테고리확인&emsp;</p>
			<!-- <input type="button" class="btn btn-primary" value="분류추가" id="catebt"><br><br> -->
			<table id="infotable" class="table table-bordered">
				<tr>
					<td class="bgtd">카테고리</td>
					<td><select name="bcataname" onchange="getsubcate(this.value)" class="selectbox">
						<option value="">---선택---</option>
						<c:forEach var="vo" items="${list}">
							<option value="${vo.bcatenum}">${vo.bcataname}</option>
						</c:forEach>
						</select>
						<select name="scatename" class="selectbox">
							<option value="">---선택---</option>
						</select>
					</td>
				</tr>	
			</table>
		</div>
		<!-- 상품기본정보등록 -->
		<div id="basic">
			<p>상품기본정보</p>
			<table id="infotable1" class="table table-bordered">
				<tr>
					<td class="bgtd">도서명</td>
					<td><input type="text" name="obname"><span>&emsp;※필수입력</span></td>
				</tr>
				<tr>
					<td class="bgtd">저자</td>
					<td><input type="text" name="obwriter"><span>&emsp;※필수입력</span></td>
				</tr>
				<tr>
					<td class="bgtd">출판사</td>
					<td><input type="text" name="obpublisher"><span>&emsp;※필수입력</span></td>
				</tr>
				<tr>
					<td class="bgtd">출간일</td>
					<td><input type="date" name="obpdate"><span>&emsp;※필수입력</span></td>
				</tr>
			</table>
		</div>
		<!-- 상품가격정보등록 -->
		<div id="price">
			<p>상품가격정보</p>
			<table id="infotable2" class="table table-bordered">
				<tr>
					<td class="bgtd">정가</td>
					<td><input type="text" name="oborgprice" class="infotd2"></td>
				</tr>
				<tr>
					<td class="bgtd">품질체크</td>
					<td>
					<input type="radio" name="obstatus" value="1" width="100">최상
					<input type="radio" name="obstatus" value="2">상
					<input type="radio" name="obstatus" value="3">중
					<input type="radio" name="obstatus" value="4">하
					</td>
				</tr>
				<tr>
					<td class="bgtd">판매가</td>
					<td><input type="text" name="obsaleprice" class="infotd2"></td>
				</tr>
			</table>
		</div>
		<!-- 배송정보등록 -->
		<div id="ship">
			<p>배송정보</p>
			<table id="infotable3" class="table table-bordered">
				<tr>
					<td class="bgtd">택배비</td>
					<td>
						<input type="radio" name="obdelfee" checked value="0" id="free">무료
						<input type="radio" name="obdelfee" value="2500" id="fee">기본(2,500원)
					</td>
				</tr>
				<tr>
					<td class="bgtd">출고주소</td>
					<td><input type="text" id="sample4_postcode" placeholder="우편번호" name="addr1" class="addr">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="addr2" class="addr">
						<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="addr3" class="addr">
						<span id="guide" style="color:#999;display:none"></span><br>
						<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="addr4" class="addr">
						<input type="text" id="sample4_extraAddress" placeholder="참고항목" name="addr5" class="addr">
					</td>
				</tr>
			</table>
		</div>
		<!-- 상품이미지등록 -->
		<div id="imginfo">
			<p>상품이미지등록</p>
			<table id="infotable4" class="table table-bordered">
				<tr>
					<td class="bgtd">대표(기본이미지)-필수</td>
					<td><input type="file" name="img1"></td>
				</tr>
				<tr>
					<td class="bgtd">실물이미지-선택</td>
					<td><input type="file" name="img2"></td>
				</tr>
				<tr>
					<td class="bgtd">실물이미지-선택</td>
					<td><input type="file" name="img3"></td>
				</tr>
				<tr>
					<td class="bgtd">실물이미지-선택</td>
					<td><input type="file" name="img4"></td>
				</tr>
			</table>
		</div>
		<!-- 상품설명 등록 -->
		<div id="info">
			<p>상품설명</p>
			<table id="infotable5" class="table table-bordered">
				<tr>
					<td class="bgtd">상품설명</td>
					<td><textarea id="summernote" name="obdetail"></textarea></td>
				</tr>
			</table>
		</div>
	<button type="submit" class="btn btn-success btn-lg" id="insertbt">등록하기</button>
	</div>
</form>

<script type="text/javascript">
	//대분류 카테고리 선택시 소분류 가져오기
	function getsubcate(bcate) {
		$.ajax({
			url:"${pageContext.request.contextPath}/seller/getSmallcate?bcatenum="+bcate,
			dataType:"json",
			success:function(data){
				$(data).each(function(i,mem){
					$("select[name=scatename]").append("<option value="+data[i].scatenum+">"+data[i].scataname+"</option>");
				});
			}
		});
		selectdel();
	}
	//소분류 카테고리 기존option리스트 지우기
	function selectdel() {
		$("select[name=scatename] option").remove();
	}
	/*
	//배송료 체크박스
	$("#fee").change(function(){
		if($("#fee").prop("checked")){
			$("#obfee").attr("disabled", false);
		}else if($("free").prop("checked")){
			$("#obfee").attr("disabled",true);
		}
	});
	*/
</script>