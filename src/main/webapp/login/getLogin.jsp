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
	
	$('#updateBtn').click(function() {

		var query = {
			custno : $('#custno').val(),
			pwd1 : $('#pwd1').val(),
			name : $('#name').val(),
			zipcode : $('#sample6_postcode').val(),
			addr1 : $('#sample6_address').val(),
			addr2 : $('#sample6_detailAddress').val(),
			addr3 : $('#sample6_extraAddress').val()
		}

		if (f1.pwd1.value == "") {
			alert("비밀번호를 입력해주세요.");
			f1.pwd1.focus();
			return false;
		} else if (f1.name.value == "") {
			alert("이름을 입력해주세요.");
			f1.name.focus();
			return false;
		} else if (f1.zipcode.value == "") {
			alert("주소검색을 해주세요.");
			f1.zipcode.focus();
			return false;
		} else if (f1.addr2.value == "") {
			alert("상세주소를 입력해주세요.");
			f1.addr2.focus();
			return false;
		} else {
			$.ajax({
				type : 'get',
				url : path + "/login_update.do",
				data : query,
				success : function(data) {
					alert("회원정보수정이 완료되었습니다.");
					location.replace(path + "/index.jsp");	
				}
			})
		}
	})

	$('#deleteBtn').click(function() {
		var query = {
			custno : $('#custno').val()
		}
		$.ajax({
			type : 'get',
			url : path + "/login_delete.do",
			data : query,
			success : function(data) {
				alert("회원탈퇴가 완료되었습니다.");
				location.replace(path + "/index.jsp");
			}
		})
	})
})
</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>
<section>
	<br> <br>
	<h2>회원 상세 정보</h2>
	<form name="f1">
	<input type=hidden id="custno" value="${getLogin.custno}" /> 
		<table border=1 align="center">
			<tr>
				<td>아이디</td>
				<td align="left"><input type=text name=id id="id" value="${getLogin.id}" disabled/> 
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td align="left"><input type=password name=pwd1 id="pwd1" value="${getLogin.pwd1}" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td align="left"><input type=text name=name id="name" value="${getLogin.name}" /></td>
			</tr>
			<tr>
				<td>주소</td>
				<td align="left">
				<input type="number" name=zipcode id="sample6_postcode" value="${getLogin.zipcode}">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" name=addr1 id="sample6_address" value="${getLogin.addr1}"><br>
				<input type="text" name=addr2 id="sample6_detailAddress" value="${getLogin.addr2}"> 
				<input type="text" name=addr3 id="sample6_extraAddress" value="${getLogin.addr3}"></td>
			</tr>
			<tr>
				<td colspan=2 align="center">
				<input type=button value="회원정보수정" id="updateBtn">
				<input type=button value="회원탈퇴" id="deleteBtn"></td>
			</tr>
		</table>
	</form>
</section>

<c:import url="/include/bottom.jsp" charEncoding="utf-8" />