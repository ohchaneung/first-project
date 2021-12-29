<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/include/top.jsp" charEncoding="utf-8" />
<script>
	function check(){
		if (f1.pname.value == ""){
			alert("상품명을 입력해 주세요.");
			f1.pname.focus();
			return false;
			
		} else if (f1.price.value == "") {
			alert("가격을 입력해 주세요.");
			f1.price.focus();
			return false;
			
		} else if (f1.quantity.value == "") {
			alert("수량을 입력해 주세요.");
			f1.quantity.focus();
			return false;
			
		} else if (f1.grade.value == "") {
			alert("종류를 입력해 주세요.");
			f1.grade.focus();
			return false;
			
		} else if (f1.updateFile.value == "") {
			alert("사진을 첨부해주세요.");
			f1.updateFile.focus();
			return false;
		}
	}
</script>
<section>

	<br> <br>
	<h2>음료 등록</h2>
	<form action="${path}/board_insert.do" method="post"
		enctype="multipart/form-data" name="f1" onsubmit="return check()">
		<table border=1 align="center">
			<tr>
				<td>상품명</td>
				<td align="left"><input type=text name=pname /></td>
			</tr>
			<tr>
				<td>가격</td>
				<td align="left"><input type=number name=price /></td>
			</tr>
			<tr>
				<td>수량</td>
				<td align="left"><input type=number name=quantity /></td>
			</tr>
			<tr>
				<td>종류</td>
				<td align="left">
				<select name="grade">
					<option value="탄산">탄산</option>
					<option value="이온">이온</option>
					<option value="기타">기타</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>사진첨부</td>
				<td align="left"><input type=file name=updateFile /></td>
			</tr>
			<tr>
				<td colspan=2 align="center">
				<input type=submit value="상품등록"></td>
			</tr>
		</table>
	</form>
</section>

<c:import url="/include/bottom.jsp" charEncoding="utf-8" />