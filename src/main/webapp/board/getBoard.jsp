<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/include/top.jsp" charEncoding="utf-8" />
<style>

</style>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
	jQuery.ajaxSetup({
		cache : false
	});

	$(document).ready(function() {
		var path = "${pageContext.request.contextPath}";
		
		$('#deleteBtn').click(function() {
			var query = {
				pno : $('#pno').val()
			}
			$.ajax({
				type : 'get',
				url : path + "/board_delete.do",
				data : query,
				success : function(data) {
					alert("상품 삭제 확인");
					location.replace(path + "/board_getBoardList.do");
				}
			})
		})
	});
	
	function check1(){
		if (f1.price.value == "") {
			alert("가격을 입력해주세요.");
			f1.price.focus();
			return false;
		} else if (f1.quantity.value == "") {
			alert("수량을 입력해주세요.");
			f1.quantity.focus();
			return false;
		} else if (f1.grade.value == "") {
			alert("종류를 입력해주세요.");
			f1.grade.focus();
			return false;
		}
	}
	
	function check2(){
		if (f11.quantity.value == "") {
			alert("수량을 입력해주세요.");
			f11.quantity.focus();
			return false;
		}
	}
	
	function reupdateBtn(i){
		
		$('#updateTd' + i).show();
		$('#mainTd' + i).hide();
	}
	
	function reupdateCBtn(i){
		
		$('#updateTd' + i).hide();
		$('#mainTd' + i).show();
	}
	
	function reinsertBtn(i){
		
		$('#insertTd' + i).show();
	}
	
	function reinsertCBtn(i){
		
		$('#insertTd' + i).hide();
	}

</script>
<section>

	<br> <br>
	<h2>음료 상세 보기</h2>
	<c:if test="${member_role == 'Admin'}">
		<form action="${path}/board_update.do" method="post" 
			enctype="multipart/form-data" name="f1" onsubmit="return check1()">
			<input type=hidden value="${getBoard.pno}" id="pno" name=pno />
			<table border=1 align="center">
				<tr>
					<td>이미지</td>
					<td align="left">
					<img src=./board/files/${getBoard.img} width=225 height=175 /><br>
					<input type=file name=updateFile />
					</td>
				</tr>
				<tr>
					<td>상품명</td>
					<td align="left"><input type=text name=pname value="${getBoard.pname}" disabled /></td>
				</tr>
				<tr>
					<td>가격</td>
					<td align="left"><input type=number name=price value="${getBoard.price}" /></td>
				</tr>
				<tr>
					<td>수량</td>
					<td align="left"><input type=number name=quantity value="${getBoard.quantity}" /></td>
				</tr>
				<tr>
					<td>종류</td>
					<td align="left">
					<c:if test="${getBoard.grade == '탄산'}">
						<select name="grade">
							<option value="탄산" selected>탄산</option>
							<option value="이온">이온</option>
							<option value="기타">기타</option>
						</select>
					</c:if>
					<c:if test="${getBoard.grade == '이온'}">
						<select name="grade">
							<option value="탄산">탄산</option>
							<option value="이온" selected>이온</option>
							<option value="기타">기타</option>
						</select>
					</c:if>
					<c:if test="${getBoard.grade == '기타'}">
						<select name="grade">
							<option value="탄산">탄산</option>
							<option value="이온">이온</option>
							<option value="기타" selected>기타</option>
						</select>
					</c:if>
					</td>
				</tr>
				<tr>
					<td colspan=2 align="center">
					<input type="button" id="deleteBtn" value="상품삭제" />
					<input type="submit" value="상품수정" />
					</td>
				</tr>
			</table>
		</form>
	</c:if>
	<c:if test="${member_role == 'Guest'}">
		<form action="${path}/cart_insert.do" method="post" name="f11" onsubmit="return check2()">
			<input type=hidden value="${getBoard.pno}" name=pno />
			<input type=hidden value="${member_custno}" name=custno />
			<table border=1 align="center">
				<tr>
					<td>이미지</td>
					<td align="left">
					<img src=./board/files/${getBoard.img} width=350 height=200 />
					<input type=hidden value="${getBoard.img}" name=img />
					</td>
				</tr>
				<tr>
					<td>상품명</td>
					<td align="left"><input type=text value="${getBoard.pname}" disabled />
					<input type=hidden value="${getBoard.pname}" name=pname />
					</td>
				</tr>
				<tr>
					<td>가격</td>
					<td align="left"><input type=number value="${getBoard.price}" disabled />
					<input type=hidden value="${getBoard.price}" name=price />
					</td>
				</tr>
				<tr>
					<td>수량</td>
					<td align="left"><input type=number name=quantity /> => ${getBoard.quantity}개 이하로만 가능합니다
					</td>
				</tr>
				<tr>
					<td>종류</td>
					<td align="left">
					<input type=text value="${getBoard.grade}" disabled />
					<input type=hidden value="${getBoard.grade}" name=grade />
					</td>
				</tr>
				<tr>
					<td colspan=2 align="center">
					<input type="submit" value="장바구니에 담기" />
					</td>
				</tr>
			</table>
		</form>
	</c:if>
	<br>
	<hr>
	<br>
	<h1>구매 후기</h1>
	<form action="${path}/review_insert.do" method="post" name=f1>
	<input type=hidden value="${getBoard.pno}" name="pno">
	<input type=hidden value="${member_custno}" name="custno">
	<textarea rows=5 cols=100 name="content" placeholder="100자 이내로 입력해 주세요"></textarea>
	<input type=submit value="후기 등록">
	</form>
	<br>
	<table border=0 align="center" width=900>
		<c:set var="reviewCnt" value="1"></c:set>
		<c:forEach items="${getReviewList}" var="r">
			<c:if test="${member_role == 'Admin'}">
				<c:set var="idx" value="${r.idx}"></c:set>
				<c:set var="ref" value="${r.ref}"></c:set>
				<c:set var="content" value="${r.content}"></c:set>
				<tr align="left">
				<td height="50" class="reviewTd mainTd" id="mainTd${reviewCnt}">
				<c:if test="${r.re_level == 0}">
				${r.name}
				</c:if>
				<c:if test="${r.re_level != 0}">
				<img src="./files/공백.jpg" height="10" width="${r.re_level * 30}"> => ${r.name}
				</c:if>
					&emsp;&emsp;&emsp;
					${content}&emsp;&emsp;&emsp;
					<fmt:formatDate value="${r.createdate}" pattern="yyyy.MM.dd. HH:mm"/>&emsp;&emsp;&emsp;
					<button class="reupdateBtn" onclick="reinsertBtn(${reviewCnt});">답글쓰기</button>&emsp;
					<c:if test="${member_custno == r.custno}">
					<button class="reupdateBtn" onclick="reupdateBtn(${reviewCnt});">수정</button>&emsp;
					</c:if>
					<a href="${path}/review_delete.do?idx=${idx}&pno=${r.pno}">삭제</a>
				</td>
				<c:if test="${member_custno == r.custno}">
					<td height="50" class="reviewTd updateTd" id="updateTd${reviewCnt}">
						<form action="${path}/review_update.do" name=f2>
						<input type="hidden" value="${idx}" name="idx">
						<input type="hidden" value="${r.pno}" name="pno">
						<textarea rows=5 cols=100 name="content" placeholder="${content}"></textarea><br>
						<div align="right">
						<input type=submit class="reupdateBtn" value="수정완료">
						<input type=button class="reupdateBtn" onclick="reupdateCBtn(${reviewCnt});" value="취소">
						</div>
						</form>
					</td>
				</c:if>
				</tr>
				<tr>
				<td height="50" class="reviewTd insertTd" id="insertTd${reviewCnt}">
					<form action="${path}/review_reinsert.do" name=f3>
					<input type="hidden" value="${member_custno}" name="custno">
					<input type="hidden" value="${r.pno}" name="pno">
					<input type="hidden" value="${ref}" name="ref">
					<input type="hidden" value="${r.re_step}" name="re_step">
					<input type="hidden" value="${r.re_level}" name="re_level">
					<textarea rows=5 cols=100 name="content" placeholder="100자 이내로 입력해 주세요"></textarea><br>
					<div align="right">
					<input type=submit class="reupdateBtn" value="답글 등록">
					<input type=button class="reupdateBtn" onclick="reinsertCBtn(${reviewCnt});" value="취소">
					</div>
					</form>
				</td>
				</tr>
				<c:set var="reviewCnt" value="${reviewCnt+1}"></c:set>
			</c:if>
			<c:if test="${member_role == 'Guest'}">
				<c:set var="idx" value="${r.idx}"></c:set>
				<c:set var="ref" value="${r.ref}"></c:set>
				<c:set var="content" value="${r.content}"></c:set>
				<tr align="left">
				<td height="50" class="reviewTd mainTd" id="mainTd${reviewCnt}">
				<c:if test="${r.re_level == 0}">
					${r.name}
				</c:if>
				<c:if test="${r.re_level != 0}">
					<img src="./files/공백.jpg" height="10" width="${r.re_level * 30}"> => ${r.name}
				</c:if>
					&emsp;&emsp;&emsp;
					${content}&emsp;&emsp;&emsp;
					<fmt:formatDate value="${r.createdate}" pattern="yyyy.MM.dd. HH:mm"/>&emsp;&emsp;&emsp;
					<button class="reupdateBtn" onclick="reinsertBtn(${reviewCnt});">답글쓰기</button>&emsp;
					<c:if test="${member_custno == r.custno}">
						<button class="reupdateBtn" onclick="reupdateBtn(${reviewCnt});">수정</button>&emsp;
						<a href="${path}/review_delete.do?idx=${idx}&pno=${r.pno}">삭제</a>
					</c:if>
				</td>
				<c:if test="${member_custno == r.custno}">
					<td height="50" class="reviewTd updateTd" id="updateTd${reviewCnt}">
						<form action="${path}/review_update.do" name=f2>
						<input type="hidden" value="${idx}" name="idx">
						<input type="hidden" value="${r.pno}" name="pno">
						<textarea rows=5 cols=100 name="content" placeholder="${content}"></textarea><br>
						<div align="right">
						<input type=submit class="reupdateBtn" value="수정완료">
						<input type=button class="reupdateBtn" onclick="reupdateCBtn(${reviewCnt});" value="취소">
						</div>
						</form>
					</td>
				</c:if>
				</tr>
				<tr>
				<td height="50" class="reviewTd insertTd" id="insertTd${reviewCnt}">
					<form action="${path}/review_reinsert.do" name=f3>
					<input type="hidden" value="${member_custno}" name="custno">
					<input type="hidden" value="${r.pno}" name="pno">
					<input type="hidden" value="${ref}" name="ref">
					<input type="hidden" value="${r.re_step}" name="re_step">
					<input type="hidden" value="${r.re_level}" name="re_level">
					<textarea rows=5 cols=100 name="content" placeholder="100자 이내로 입력해 주세요"></textarea><br>
					<div align="right">
					<input type=submit class="reupdateBtn" value="답글 등록">
					<input type=button class="reupdateBtn" onclick="reinsertCBtn(${reviewCnt});" value="취소">
					</div>
					</form>
				</td>
				</tr>
				<c:set var="reviewCnt" value="${reviewCnt+1}"></c:set>
			</c:if>
		</c:forEach>
	</table>
	<br>
</section>

<c:import url="/include/bottom.jsp" charEncoding="utf-8" />