<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/include/top.jsp" charEncoding="utf-8" />

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
	jQuery.ajaxSetup({
		cache : false
	});

	$(document).ready(function() {
		var path = "${pageContext.request.contextPath}";
		$('#submitBtn').click(function() {

			var query = {
				id : $('#id').val(),
				pwd1 : $('#pwd1').val()
			}

			if (f1.id.value == "") {
				alert("아이디를 입력해주세요.");
				f1.id.focus();
				return false;
			} else if (f1.pwd1.value == "") {
				alert("비밀번호를 입력해주세요.");
				f1.pwd1.focus();
				return false;
			} else {
				$.ajax({
					type : 'get',
					url : path + "/login_LoginCheck.do",
					data : query,
					success : function(data) {
						if (data == 1) {
							alert("로그인 성공!!!");
							location.replace(path + "/index.jsp");
							
						} else {
							$('#id').val('');
							$('#pwd1').val('');
							$('#id').focus();
							alert("아이디 또는 비밀번호가 틀렸습니다.");
						}
					}
				})
			}
		})
	})
</script>
<section>

	<br> <br>
	<h2>로그인</h2>
	<form name=f1>
		<table border=1 align="center">
			<tr>
				<td>아이디</td>
				<td align="left"><input type=text name=id id="id" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td align="left"><input type=password name=pwd1 id="pwd1" /></td>
			</tr>
			<tr>
				<td colspan=2 align="center"><input type=button value="로그인"
					id="submitBtn"></td>
			</tr>
		</table>
	</form>
</section>

<c:import url="/include/bottom.jsp" charEncoding="utf-8" />