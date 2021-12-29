<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/include/top.jsp" charEncoding="utf-8" />

<script>
function check(){
	if (f1.quantity.value == "") {
		alert("수량을 입력해주세요.");
		f1.quantity.focus();
		return false;
	}
}
</script>

<section>
	<div align="center">
		<br>
		<h2>장바구니</h2>
		<table border=1 width=1000>
			<tr height=40>
				<th>회원번호</th>
				<th>상품번호</th>
				<th>사진</th>
				<th>상품명</th>
				<th>종류</th>
				<th>단가</th>
				<th>수량</th>
				<th>합계</th>
				<th>삭제 버튼</th>
			</tr>

			<c:set var="allPrice" value="0"></c:set>
			<c:forEach var="c" items="${cartList}">

				<tr align="center">
					<td>${c.custno}</td>
					<td>${c.pno}</td>
					<td><img src=./board/files/${c.img} width=80 height=80 /></td>
					<td>${c.pname}</td>
					<td>${c.grade}</td>
					<td>${c.price}</td>
					<td>
					<form action="${path}/cart_update.do" name="f1" 
						method="post" onsubmit="return check()">
						<input type=hidden name=cno value="${c.cno}" />
						<input type=hidden name=custno value="${c.custno}" />
						<input type=hidden name=price value="${c.price}" />
						<input type=text name="quantity" value="${c.quantity}" size="2"/>
						<input type=submit value="변경" class="reupdateBtn"/>
					</form>
					</td>
					<td>${c.totalprice}</td>
					<td><a href="${path}/cart_delete.do?cno=${c.cno}&custno=${c.custno}">삭제</a></td>
				</tr>
				<c:set var="allPrice" value="${allPrice + c.totalprice}"></c:set>
			</c:forEach>
			<tr align="center" height=50>
			<td colspan=6></td>
			<td>총 합계</td>
			<td>${allPrice}</td>
			<td></td>
			</tr>
		</table>
	</div>
	<br>
</section>
<c:import url="/include/bottom.jsp" charEncoding="utf-8" />