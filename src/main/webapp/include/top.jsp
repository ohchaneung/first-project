<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
session.setAttribute("path", path);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음료수 판매점</title>
<link rel="stylesheet" href="${path}/include/top.css">
<style type="text/css">
</style>
</head>

<body>
	<header>음료수 판매점</header>
	<nav>
		&emsp;| <a href=${path}/index.jsp>홈</a>
		<c:if test="${member_id eq null}">
			| <a href=${path}/login_insertm.do>회원가입</a>
			| <a href=${path}/login.do>로그인</a> |
		</c:if>
		<c:if test="${member_id ne null}">
			<c:if test="${member_role == 'Admin'}">
				| <a href=${path}/login_getLoginList.do>회원목록</a>
				| <a href=${path}/board_insertm.do>상품등록</a>
			</c:if>

			| <a href=${path}/board_getBoardList.do>상품목록</a>
			<c:if test="${member_role == 'Guest'}">
			| <a href=${path}/cart_getCartList.do?custno=${member_custno}>장바구니</a>
			</c:if>
			| <a href=${path}/logout.do>로그아웃</a>
			| <a href=${path}/login_getLogin.do?id=${member_id}>${member_name}님</a> |
		</c:if>
	</nav>
