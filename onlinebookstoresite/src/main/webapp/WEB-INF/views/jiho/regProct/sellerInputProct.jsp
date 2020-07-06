<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
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
<div id="prodInputForm">
	<h2>상품등록</h2>
	<div id="cate">
		<span>카테고리확인</span><input type="button" class="btn btn-outline-success" value="추가"><br>
		<div id="cateck">
		
		</div>
	</div>
	<div id="basic">
		<p>상품기본정보</p>
		<table class="infotable">
			<tr>
				<td>도서명</td>
				<td><input type="text" name="obname"></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="obwriter"></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="obpublisher"></td>
			</tr>
			<tr>
				<td>출간일</td>
				<td><input type="text" name="obpdate"></td>
			</tr>
		</table>
	</div>
	<div id="price">
		<p>상품가격정보</p>
		<table class="infotable">
			<tr>
				<td>정가</td>
				<td><input type="text" name="oborgprice"></td>
			</tr>
			<tr>
				<td>품질체크</td>
				<td><input type="text" name="obstatus">
				<input type="button" value="품질체크">
				</td>
			</tr>
			<tr>
				<td>판매가</td>
				<td><input type="text" name="obsaleprice"></td>
			</tr>
		</table>
	</div>
	<div id="ship">
		<p>배송정보</p>
		<table class="infotable">
			<tr>
				<td>택배비</td>
				<td><input type="text" name="obdelfee"></td>
			</tr>
			<tr>
				<td>출고주소</td>
				<td><input type="text" id="sample4_postcode" placeholder="우편번호">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
					<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
					<span id="guide" style="color:#999;display:none"></span><br>
					<input type="text" id="sample4_detailAddress" placeholder="상세주소">
					<input type="text" id="sample4_extraAddress" placeholder="참고항목">
				</td>
			</tr>
		</table>
	</div>
	<div id="imginfo">
		<p>상품이미지등록</p>
		<table class="infotable">
			<tr>
				<td>대표(기본이미지)-필수</td>
				<td><input type="text" name=""></td>
			</tr>
			<tr>
				<td>실물이미지-선택</td>
				<td><input type="text" name=""></td>
			</tr>
			<tr>
				<td>실물이미지-선택</td>
				<td><input type="text" name=""></td>
			</tr>
			<tr>
				<td>실물이미지-선택</td>
				<td><input type="text" name=""></td>
			</tr>
		</table>
	</div>
	<div id="info">
		<p>상품설명</p>
		<table class="infotable">
			<tr>
				<td>상품설명</td>
				<td><input type="text" name="dbdetail"></td>
			</tr>
		</table>
	</div>
</div>