<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
﻿<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/include/top.jsp" charEncoding="utf-8" />

<section>
	<div align="center">
		<br>
		<h2>회원 목록</h2>
		<table border=1 width=1000>
			<tr height=40>
				<th>회원번호</th>
				<th>아이디</th>
				<th>비밀번호1</th>
				<th>비밀번호2</th>
				<th>이름</th>
				<th>우편번호</th>
				<th>주소</th>
				<th>직책</th>
				<th>가입날짜</th>
			</tr>

			<c:forEach var="m" items="${li}">

				<tr>
					<td>${m.custno}</td>
					<td>${m.id}</td>
					<td>${m.pwd1}</td>
					<td>${fn:substring(m.pwd2, "0", "10")}</td>
					<td>${m.name}</td>
					<td>${m.zipcode}</td>
					<td>${m.addr1}${m.addr3}${m.addr2}</td>
					<td>${m.role}</td>
					<td><fmt:formatDate value="${m.joindate}" pattern="yyyy.MM.dd. HH:mm"/></td>
				</tr>

			</c:forEach>
		</table>
	</div>
	<br>
</section>
<c:import url="/include/bottom.jsp" charEncoding="utf-8" />