<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- booksUpdate -->
<link
	href="${pageContext.request.contextPath }/resources/yjcss/css/made.css"
	rel="stylesheet" />

<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> 상품수정
	</div>
	<form method="post"
		action="${pageContext.request.contextPath }/booksUpdate"
		enctype="multipart/form-data">
		<input type="hidden" name="bnum" value="${bvo.bnum }">
		<table class="booksUpdateTable table">
			<tr>
				<th align="center" class="table-active">카테고리</th>
				<td colspan="3">
					<select name="bctg" id="bctg">
						<c:forEach var="big" items="${getBigctg }">
							<option value="${big.bcatenum}"
								<c:if test="${big.bcatenum == bcatenum }">selected</c:if>>${big.bcataname }
							</option>
						</c:forEach>
					</select>
					<div id="smctgDiv" style="display: inline-block">
						<select name="smctg" id="smctg">
							<option value="">- 선택 -</option>
							<c:forEach var="sm" items="${getsctg }">
								<option value="${sm.scatenum}"
									<c:if test="${sm.scatenum == bvo.scatenum }">selected</c:if>>${sm.scataname }
								</option>
							</c:forEach>
						</select>
					</div>
				</td>
			</tr>

			<tr>
				<th align="center" class="table-active">책제목</th>
				<td>
					<input type="text" name="btitle" id="btitle" size="60" value="${bvo.btitle }">
				</td>
				
				<th align="center" class="table-active">작가 (지은이)</th>
				<td>
					<input type="text" name="bwriter" id="bwriter" size="50" value="${bvo.bwriter }">
				</td>
			</tr>

			<tr>
				<th align="center" class="table-active">출간일</th>
				<fmt:formatDate value="${bvo.bpublishdate }" pattern="yyyy-MM-dd" var="bpublishdate" />
				<td>
					<input type="date" name="bpublishdate" id="bpublishdate" value="${bpublishdate }">
				</td>
			</tr>

			<tr>
				<th align="center" class="table-active">출판사</th>
				<td colspan="3">
					<input type="text" name="bpublisher" size="50" value="${bvo.bpublisher }">
				</td>
			</tr>

			<tr>
				<th align="center" class="table-active">책가격</th>
				<td>
					<input type="text" name="bprice" id="bprice" size="50" value="${bvo.bprice }"> 원
				</td>
				
				<th align="center" class="table-active">적립포인트</th>
					<td>
						<input type="text" name="bpoint" id="bpoint" size="50" readonly="readonly" value="${bvo.bpoint }"> point 적립예정
					</td>
			</tr>

			<tr>
				<th align="center" class="table-active">입고수량</th>
				<td colspan="3">
					<input type="text" name="bcount" size="50" value="${bvo.bcount }"> 개
				</td>
			</tr>

			<tr>
				<th align="center" class="table-active">기존 썸네일</th>
				<td>
					<input type="hidden" name="thumbNum" value="${thumbImg.imgnum }">
					<div id="savedThumbImg" style="text-align: center;">
						<img width="300px" height="350px"
							src="${pageContext.request.contextPath}/resources/imgUpload/${thumbImg.imgsavefilename }">
					</div>
				</td>
				
				<th align="center" class="table-active">기존 이미지</th>
				<td>
					<c:if test="${!empty img1 }">
						<input type="hidden" name="imgNum" value="${img1.imgnum }">
						<div id="savedImg" style="text-align: center;">
							<img width="300px" height="350px"
								src="${pageContext.request.contextPath}/resources/imgUpload/${img1.imgsavefilename }">
						</div>
					</c:if>
				</td>
			</tr>

			<tr>
				<th align="center" class="table-active">수정할 썸네일</th>
				<td>
					<input type="file" name="thumbnail">
				</td>
				
				<th align="center" class="table-active">수정할 이미지</th>
					<td><input type="file" name="img1"></td>
				</tr>

			<tr>
				<th align="center" class="table-active">책설명</th>
				<td colspan="3">
					<textarea rows="30" cols="200" name="bcontent">${bvo.bcontent }</textarea>
				</td>
			</tr>

			<tr>
				<td align="center" colspan="4">
					<input type="submit" value="수  정" class="btn btn-primary">
					<input type="reset" value="초기화" class="btn btn-secondary">
				</td>
			</tr>
		</table>
	</form>
</div>

<!-- 스크립트 -->
<script>
	// 카테고리
	$("#bctg").change(
			function() {
				var big = $(this).val();
				//alert("big:" + big);
				$.ajax({
					url : "/finalproject/booksctg",
					data : {
						bcatenum : big
					},
					success : function(data) {
						// 				$("#smctgDiv").css("display", "inline-block");
						$("#smctg").empty();
						$("#smctg").append("<option value=''>- 선택 -</option>")
						$(data).each(
								function(i, sm) {
									$("#smctg").append(
											"<option value='" + sm.scatenum + "'>"
													+ sm.scataname
													+ "</option>")
								});
					}
				});
			});

	// 포인트 = 가격 * (5 / 100)
	$("#bprice").change(function() {
		var price = $(this).val();
		$("#bpoint").val(Math.round(price * 0.05));
	});

	// 유효성검사
	$("form").submit(function() {
		var bctg = $("#bctg").val();
		if (bctg == "") {
			alert("카테고리를 선택해 주세요.");
			$("#bctg")[0].focus();
			return false;
		}

		var smctg = $("#smctg").val();
		if (smctg == "") {
			alert("카테고리를 선택해 주세요.");
			$("#smctg")[0].focus();
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