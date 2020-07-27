<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<div class="container-fluid">
	<form action="${pageContext.request.contextPath }/join" method="post">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="mname"> </td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="mid">
				<span class="checkSpan" id="idCheck"></span></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="mpwd"></td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td><input type="text" name="mpwd"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td><input type="text" name="phone"></td>
			</tr>

			<tr>
				<td>주소</td>
				<td>
					<tr>
	<td class="bgtd">출고주소</td>
	<td><input type="text" id="sample4_postcode" placeholder="우편번호" name="addr1" class="addr"
		onclick="sample4_execDaumPostcode()" readonly="readonly">
	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
	<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="addr2" class="addr"
		onclick="sample4_execDaumPostcode()" readonly="readonly">
	<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="addr3" class="addr">
		<span id="guide" style="color:#999;display:none"></span><br>
	<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="addr4" class="addr">
	<input type="text" id="sample4_extraAddress" placeholder="참고항목" name="addr5" class="addr"
		onclick="sample4_execDaumPostcode()" readonly="readonly">
	</td>
</tr>
				</td>
			</tr>

			<tr>
				<td>생년월일</td>
				<td><input type="date" name="birth"></td>
			</tr>

			<tr>
				<td>성별</td>
				<td><input type="radio" name="sex" value="F"> 여자 <input
					type="radio" name="sex" value="M"> 남자</td>
			</tr>

			<tr>
				<td><input type="submit" value="가입" id="submit"></td>
			</tr>
		</table>
	</form>
</div>

<script>
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9]{4,12}$/;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/;
	// 이름 정규식
	var nameJ = /^[가-힣]{2,6}$/;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

	$("#mid").blur(
			function() {
				var mid = $("#mid").val();
				$.ajax({
					url : "${pageContext.request.contextPath}/idCheck?mid="
							+ mid,
					type : "get",
					success : function(data) {
						console.log("1=중복/0=가능-->" + data);
						if (data == 1) {
							$("#idCheck").text("사용 중인 아이디입니다.");
							$("#idCheck").css("color", "red");
							$("#submit").attr("disabled", true);
						} else {
							if (idJ.test(mid)) {
								$("#idCheck").text("");
								$("#submit").attr("disabled", false);
							} else if (mid = "") {
								$("idCheck").text("아이디를 입력해 주세요").$("#idCheck")
										.css("color", "red");
								$("#submit").attr("disabled", true);
							} else {
								$("idCheck").text("아이디는 소문자와 숫자 4~12자리만 가능합니다")
										.$("#idCheck").css("color", "red");
								$("#submit").attr("disabled", true);
							}
						}
					},
					error : function() {
						console.log("실~~패");
					}
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
