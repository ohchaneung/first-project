<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/include/top.jsp" charEncoding="utf-8" />

<section>
	<div align="center">
		<br>
		<h1>상품 목록</h1>
		<br>
		<form  action="${path}/board_getBoardList.do">
          <select name=ch1>
            <option value="pname">상품명</option>
            <option value="grade">종류</option>        
           </select>
          <input  type=text   name=ch2>
          <input  type=submit  value="검색하기">
        </form>
		<br>
		<table border=1 frame=void align="center">
		<c:set var="count" value="1"></c:set>
		<tr>
		<c:forEach items="${li}" var="m">
				<td>
				<a href="${path}/board_getBoard.do?pno=${m.getPno()}">
				<img src=./board/files/${m.getImg()} width=225 height=175 />
				</a> <br>
				<c:if test="${member_role == 'Admin'}" >
				상품명 : ${m.getPname()} <br>
				가격 : ${m.getPrice() } <br>
				수량 : ${m.getQuantity() } <br>
				종류 : ${m.getGrade() }
				</c:if>
				<c:if test="${member_role != 'Admin'}" >
				상품명 : ${m.getPname()} <br>
				가격 : ${m.getPrice() } <br>
				종류 : ${m.getGrade() }
				</c:if>
				</td>
		<c:if test="${count % 3 == 0 }">
			<tr>
		</c:if>
		<c:set var="count" value="${count+1}"></c:set>
		</c:forEach>
		</tr>

		</table>
		<br>
		
		<c:if test="${startIdx > 1}">
		<a href="${path}/board_getBoardList.do?startIdx=1&ch1=${ch1}&ch2=${ch2}">맨앞으로</a> &emsp;
		</c:if>
		<c:if test="${startIdx == 1}">
		맨앞으로 &emsp;
		</c:if>
		
		<c:if test="${startIdx > 1}">
		<a href="${path}/board_getBoardList.do?startIdx=${startIdx-6}&ch1=${ch1}&ch2=${ch2}">이전페이지</a>
		</c:if>
		<c:if test="${startIdx == 1}">
		이전페이지
		</c:if>
		
		&emsp;
		<c:forEach var="i" begin="${listStratPage}" end="${listEndPage}" >
		  <c:if test="${i<=totalPage}">
		  	  <c:if test="${i!=nowPage}">
			    <a href=${path}/board_getBoardList.do?startIdx=${(i-1)*pageSize+1}&ch1=${ch1}&ch2=${ch2}>${i}</a>
			  </c:if>
			  <c:if test="${i==nowPage}">
			    [${i}]
			  </c:if>
		  </c:if>
		</c:forEach>
		&emsp;
		
		<c:if test="${ nowPage < totalPage }">
		  <a href="${path}/board_getBoardList.do?startIdx=${startIdx+6}&ch1=${ch1}&ch2=${ch2}">다음페이지</a>	&emsp;
      	</c:if>
      	
      	<c:if test="${nowPage == totalPage}">
      	  다음페이지	&emsp;
      	</c:if>
      	
      	<c:if test="${ nowPage < totalPage }">
		  <a href="${path}/board_getBoardList.do?startIdx=${endPage}&ch1=${ch1}&ch2=${ch2}">맨뒤로</a>
      	</c:if>
      	
      	<c:if test="${nowPage == totalPage}">
      	  맨뒤로
      	</c:if>
      	
		<br> <br>

	</div>
</section>

<c:import url="/include/bottom.jsp" charEncoding="utf-8" />