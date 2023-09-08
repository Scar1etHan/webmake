<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- CSS -->
<style>
		table td{width:100px;}
</style>

</head>
	
<body>
   <%@ include file="interface.jsp" %>
		<table>
	 <thead>
	 	 <tr>
			   <th>번호</th>
			   <th>이름</th>
			   <th>카테고리</th>
			   <th>가격</th>
			   <th>수량</th>
			   <th>등록날짜</th>
		  </tr>
	 </thead>
	 <tbody>
	  <c:forEach items="${list}" var="list">
		  <tr>
			   <td><!-- 중복없이 구분가능 -->
			   		<a href="/Admin/regProductView?n=${list.gdsNum}">${list.gdsNum}</a>
			   	</td>
			   <td>${list.gdsName}</td>
			   <td>${list.cateCode}</td>
			   <td>
			   		<fmt:formatNumber value="${list.gdsPrice}" pattern="###,###,###"/>
			   </td>
			   <td>${list.gdsStock}</td>
			   <td>
			   		<fmt:formatDate value="${list.gdsDate}" pattern="yyyy-MM-dd" />
			   </td>
		  </tr>   
	  </c:forEach>
	 </tbody>
	</table>
</body>
</html>