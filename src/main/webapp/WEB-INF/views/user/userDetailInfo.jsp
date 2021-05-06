<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>TraSS</title>

  <!-- Bootstrap core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/resources/css/modern-business.css" rel="stylesheet">
</head>

<body>
  <!-- Navigation -->
 <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="/">TraSS</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="/board/notice/list">공지사항</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="internalBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                 국내
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="/dash/internal/sudo">수도권</a>
              <a class="dropdown-item" href="/dash/internal/gangwon">강원도</a>
              <a class="dropdown-item" href="/dash/internal/chungcheong">충청도</a>
              <a class="dropdown-item" href="/dash/internal/gyeongsang">경상도</a>
              <a class="dropdown-item" href="/dash/internal/jeonla">전라도</a>
              <a class="dropdown-item" href="/dash/internal/jeju">제주도</a>                                           
            </div> 
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="internalBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                 아시아
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="/dash/asia/china">중국</a>
              <a class="dropdown-item" href="/dash/asia/japan">일본</a>
              <a class="dropdown-item" href="/dash/asia/oceania">오세아니아</a>
              <a class="dropdown-item" href="/dash/asia/eastsouth">동남아</a>
              <a class="dropdown-item" href="/dash/asia/etc">그외</a>                                           
            </div> 
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                 유럽
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="/dash/europe/uk">영국</a>
              <a class="dropdown-item" href="/dash/europe/france">프랑스</a>
              <a class="dropdown-item" href="/dash/europe/italia">이탈리아</a>        
              <a class="dropdown-item" href="/dash/europe/iberia">이베리아반도</a>
              <a class="dropdown-item" href="/dash/europe/swiss">스위스</a>
              <a class="dropdown-item" href="/dash/europe/germany">독일</a>
              <a class="dropdown-item" href="/dash/europe/etc">북유럽/그외</a>                          
            </div> 
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                 아메리카
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="/dash/america/usa">미국</a>
              <a class="dropdown-item" href="/dash/america/canada">케나다</a>
              <a class="dropdown-item" href="/dash/america/mexico">멕시코</a>        
              <a class="dropdown-item" href="/dash/america/etc">남미/그 외</a>                          
            </div> 
         <sec:authorize access="isAnonymous()">  
          <li>
            <a class="nav-link" id="login"  href="/user/customLogin?">LOGIN</a>
          </li>
         </sec:authorize>  
         <sec:authorize access="isAuthenticated()">
          <li>
            <a class="nav-link" id="mypage" href="/user/userInfo">MYPAGE</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/user/customLogout">LOGOUT</a>
          </li>
         </sec:authorize>
         <!-- 로그인 안되있는경우(익명사용자) login 버튼을, 로그인 되어있는경우 logout 버튼을 가시화함-->
        </ul>
      </div>
    </div>
  </nav>
  
   <div class="container">
      <div class="row">
       
        <div class="col-lg-12">
          <h2 class="page-header">수도권 게시판</h2>
        </div>
      
      <table class="table table-striped table-bordered table-hover">
       <thead>
          <tr><th>id</th><th>이름</th><th>주소</th><th>번호</th><th>email</th></tr>
       </thead>
  
        <tr>
           <td><c:out value="${user.u_id}" /></td>
           <td><c:out value="${user.u_name}" /></td>
           <td><c:out value="${user.u_address}"/></td>
           <!-- <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.b_regdate}"/></td> -->
           <td><c:out value="${user.u_phone}" /></td>
           <td><c:out value="${user.u_email}" /></td>
         </tr>
       
      </table>      
</body>
</html>