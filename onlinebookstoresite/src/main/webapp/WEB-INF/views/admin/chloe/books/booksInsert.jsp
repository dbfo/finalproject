<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> 상품등록
	</div>
	<form method="post" action="${pageContext.request.contextPath }/booksInsert" enctype="multipart/form-data">
		<table class="booksInsertTable table">
			<tr>
				<th style="text-align: center;" class="table-active">카 테 고 리</th>
				<td colspan="3">
					<select name="bctg" id="bctg">
						<option value="">- 선택 -</option>
						<c:forEach var="big" items="${getBigctg }">
							<option value="${big.bcatenum }">${big.bcataname }</option>
						</c:forEach>
					</select>
					<div id="smctgDiv" style="display: none">
						<select name="smctg" id="smctg">
							<option value="">- 선택 -</option>
						</select>
					</div>
				</td>
			</tr>

			<tr>
				<th style="text-align: center;" class="table-active">책 제 목</th>
				<td><input type="text" name="btitle" id="btitle" size="70"></td>
				<th style="text-align: center;" class="table-active">작가 (지은이)</th>
				<td><input type="text" name="bwriter" class="normalText"></td>
			</tr>

			<tr>
				<th style="text-align: center;" class="table-active">출 간 일</th>
				<td><input type="date" name="bpublishdate" id="bpublishdate"></td>

			</tr>

			<tr>
				<th style="text-align: center;" class="table-active">출 판 사</th>
				<td colspan="3"><input type="text" name="bpublisher" class="normalText"></td>
			</tr>

			<tr>
				<th style="text-align: center;" class="table-active">책 가 격</th>
				<td><input type="text" name="bprice" size="50" class="normalText"> 원</td>
				<th style="text-align: center;" class="table-active">적립포인트</th>
				<td><input type="text" name="bpoint" size="30" readonly="readonly"> point 적립예정</td>
			</tr>

			<tr>
				<th style="text-align: center;" class="table-active">입 고 수 량</th>
				<td colspan="3"><input type="text" name="bcount" class="normalText"> 개</td>
			</tr>

			<tr>
				<th style="text-align: center;" class="table-active">썸 네 일</th>
				<td><input type="file" name="thumbnail"></td>
				<th style="text-align: center;" class="table-active">이미지</th>
				<td><input type="file" name="img1"></td>
			</tr>

			<tr>
				<th style="text-align: center;" class="table-active">책 설 명</th>
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
	$("input[name='bprice']").change(function() {
		var price = $(this).val();
		$("input[name='bpoint']").val(Math.round(price * 0.05));
	});

	// 유효성검사
	$("form").submit(function() {
		var bctg = $("#bctg").val();
		if (bctg == "") {
			alert("큰 카테고리를 선택해 주세요.");
			$("#bctg")[0].focus();
			return false;
		}

		var smctg = $("#smctg").val();
		if (smctg == "") {
			alert("작은 카테고리를 선택해 주세요.");
			$("#smctg")[0].focus();
			return false;
		}

		var btitle = $("input[name='btitle']");
		if (btitle.val() == "") {
			alert("책 제목을 입력해 주세요.");
			btitle.focus();
			return false;
		}

		var bwriter = $("input[name='bwriter']");
		if (bwriter.val() == "") {
			alert("지은이를 입력해 주세요.");
			bwriter.focus();
			return false;
		}

		var bpublishdate = $("input[name='bpublishdate']");
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
		
		if (isNaN(bprice.val())) {
			alert("가격을 숫자로만 입력해 주세요");
			bprice.focus();
			return false;
		}

		var bcount = $("input[name='bcount']");
		if (bcount.val() == "") {
			alert("수량을 입력해 주세요.");
			bcount.focus();
			return false;
		}
		
		if (isNaN(bcount.val())) {
			alert("수량을 숫자로만 입력해 주세요");
			bcount.focus();
			return false;
		}

		var thumbnail = $("input[name='thumbnail']");
		if (thumbnail.val() == "") {
			alert("썸네일 등록은 필수사항입니다.");
			thumbnail.focus();
			return false;
		}

		var img1 = $("input[name='img1']");
		if (img1.val() == "") {
			alert("이미지 등록은 필수사항입니다.");
			img1.focus();
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