<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<link href="${pageContext.request.contextPath }/resources/yjcss/css/made.css" rel="stylesheet" />

<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> 상품등록
	</div>
	<form method="post" action="${pageContext.request.contextPath }/booksInsert" enctype="multipart/form-data">
		<table class="booksInsertTable table">
			<tr>
				<th align="center" class="table-active">카테고리 *</th>
				<td colspan="3"><select name="bctg" id="bctg">
						<option value="">- 선택 -</option>
						<c:forEach var="big" items="${getBigctg }">
							<option value="${big.bcatenum }">${big.bcataname }</option>
						</c:forEach>
				</select>
					<div id="smctgDiv" style="display: none">
						<select name="smctg" id="smctg">
							<option value="">- 선택 -</option>
						</select>
					</div></td>
			</tr>

			<tr>
				<th align="center" class="table-active">책제목 *</th>
				<td><input type="text" name="btitle" id="btitle" size="50"></td>
				<th align="center" class="table-active">작가 (지은이) *</th>
				<td><input type="text" name="bwriter" id="bwriter" size="50"></td>
			</tr>

			<tr>
				<th align="center" class="table-active">출간일 *</th>
				<td><input type="date" name="bpublishdate" id="bpublishdate"></td>

			</tr>

			<tr>
				<th align="center" class="table-active">출판사 *</th>
				<td colspan="3"><input type="text" name="bpublisher" size="50"></td>
			</tr>

			<tr>
				<th align="center" class="table-active">책가격 *</th>
				<td><input type="text" name="bprice" id="bprice" size="50"> 원</td>
				<th align="center" class="table-active">적립포인트 *</th>
				<td><input type="text" name="bpoint" id="bpoint" size="50" readonly="readonly"> point 적립예정</td>
			</tr>

			<tr>
				<th align="center" class="table-active">입고수량 *</th>
				<td colspan="3"><input type="text" name="bcount" size="50"> 개</td>
			</tr>

			<tr>
				<th align="center" class="table-active">썸네일 *</th>
				<td><input type="file" name="thumbnail"></td>
				<th align="center" class="table-active">이미지</th>
				<td><input type="file" name="img1"></td>
			</tr>

			<tr>
				<th align="center" class="table-active">책설명 *</th>
				<td colspan="3">
					<textarea rows="30" cols="200" name="bcontent"></textarea>
				</td>
			</tr>

			<tr>
				<td align="center" colspan="4">
					<input type="submit" value="등  록" class="btn btn-primary">
					<input type="reset" value="초기화" class="btn btn-secondary">
				</td>
			</tr>
		</table>
	</form>
</div>

<!-- 스크립트 -->
<script>
	// 카테고리
	$("#bctg").change(function() {
		var big = $(this).val();
		//alert("big:" + big);
		$.ajax({
			url : "/finalproject/booksctg",
			data : {
				bcatenum : big
			},
			success : function(data) {
				$("#smctgDiv").css("display", "inline-block");
				$("#smctg").empty();
				$("#smctg").append("<option value=''>- 선택 -</option>")
				$(data).each(function(i, sm) {
					$("#smctg").append("<option value='" + sm.scatenum + "'>" + sm.scataname + "</option>")
				});
			}
		});
	});

	// 포인트 = 가격 * (5 / 100)
	$("#bprice").change(function() {
		var price = $(this).val();
		$("#bpoint").val(price * 0.05);
	});
	
	// 유효성검사
	$("form").submit(function() {
		var bctg = $("#bctg").val();
		var smctg = $("#smctg").val();
		if (bctg == "") {
			alert("카테고리를 선택해 주세요.");
			return false;
		}
		if (smctg == "") {
			alert("카테고리를 선택해 주세요.");
			return false;
		}

		var btitle = $("#btitle");
		if (btitle.val() == "") {
			alert("책 제목을 입력해 주세요.");
			btitle.focus();
			return false;
		}

		var bwriter = $("#bwriter");
		if (bwriter.val() == "") {
			alert("지은이를 입력해 주세요.");
			bwriter.focus();
			return false;
		}

		var bpublishdate = $("#bpublishdate");
		if (bpublishdate.val() == "") {
			alert("출간일을 선택해 주세요.");
			bpublishdate.focus();
			return false;
		}

		var bpublisher = $("input[name='bpublisher']");
		if (bpublisher.val() == "") {
			alert("출판사를 입력해 주세요.");
			bpublisher.focus();
			return false;
		}
		
		var bprice = $("input[name='bprice']");
		if (bprice.val() == "") {
			alert("가격을 입력해 주세요.");
			bprice.focus();
			return false;
		}

		var bcount = $("input[name='bcount']");
		if (bcount.val() == "") {
			alert("수량을 입력해 주세요.");
			bcount.focus();
			return false;
		}

		var thumbnail = $("input[name='thumbnail']");
		if (thumbnail.val() == "") {
			alert("썸네일 등록은 필수사항입니다.");
			thumbnail.focus();
			return false;
		}

		var bcontent = $("textarea");
		if (bcontent.val() == "") {
			alert("책 설명을 입력해 주세요.");
			bcontent.focus();
			return false;
		}
		return true;
	});
</script>