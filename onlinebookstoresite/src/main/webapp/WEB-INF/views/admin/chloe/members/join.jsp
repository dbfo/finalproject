<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="container-fluid">
	<form action="${pageContext.request.contextPath }/join" method="post">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="mname"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="mid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
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
				<td><input type="text" name="addr"></td>
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
				<td><input type="submit" value="가입"></td>
			</tr>
		</table>
	</form>
</div>

<script>
	//스크립트가 작동이 안됨 노트북 죽여버려
</script>