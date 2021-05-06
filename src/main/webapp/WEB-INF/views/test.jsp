<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="kr.ncq.domain.UsersDAO" %>
<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    Object principal = auth.getPrincipal();
 
    String name = "";
    if(principal != null) {
        name = auth.getName();
    }


%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <sec:authorize access="isAnonymous()">
      <a href="#">로그인</a> 
  </sec:authorize>
  <sec:authorize access="hasRole('ROLE_ADMIN')">
    <!-- <h5><%=name %>님, 반갑습니다.</h5> -->
    <a href="#">로그아웃dd</a>
    <p><sec:authentication property="principal.username"/>님 반갑습니다.</p>
     <input type="button"  id="noticeRegister" style='float:right;' value="공지사항 등록">
     <sec:authentication property="principal.user.u_auth"/>
  </sec:authorize>
   
   

</body>
</html>