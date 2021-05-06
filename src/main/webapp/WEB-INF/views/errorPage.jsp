<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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
          <li class="nav-item">
            <a class="nav-link" href="/user/customLogout">LOGOUT</a>
          </li>
         </sec:authorize>
         <!-- 로그인 안되있는경우(익명사용자) login 버튼을, 로그인 되어있는경우 logout 버튼을 가시화함-->
        </ul>
      </div>
    </div>
  </nav>
  
 <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
		   <c:if test="${requestScope['javax.servlet.error.status_code'] == 400}">
		     400
	        <small>Page Not Found</small>
	       </c:if>
		   <c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
		     404
	        <small>Page Not Found</small>
	       </c:if>
	       <c:if test="${requestScope['javax.servlet.error.status_code'] == 405}">
		     405
	        <small>Method Not Found</small>
	       </c:if>
	       <c:if test="${requestScope['javax.servlet.error.status_code'] == 500}">
		     500
	        <small>Server Not Error</small>
	       </c:if>
	       <c:if test="${requestScope['javax.servlet.error.status_code'] == 503}">
		     503
	        <small>Server Not Ready</small>
	       </c:if>
	    </h1>		  

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Home</a>
      </li>
      <li class="breadcrumb-item active">
      <c:if test="${errorType eq 400}">
       400
      </c:if>
      <c:if test="${errorType eq 401}">
       401
      </c:if>
      <c:if test="${errorType eq 404}">
       404
      </c:if>
      <c:if test="${errorType eq 500}">
       500
      </c:if>
      
      </li>
    </ol>

    <div class="jumbotron">
      <h1 class="display-1">
      <c:if test='${errorType eq "400"}'>    
	      400</h1>
	      <p>잘못 된 요청입니다. 다시 시도해 주세요. 재시도에도 안될경우 관리자에게 문의해주세요</p>
      </c:if>
       <c:if test='${errorType eq "401"}'>	    
	      401</h1>
	      <p>인증이 필요합니다. 허가되지 않은 회원이거나 로그인이 필요합니다.</p>
      </c:if>
      <c:if test='${errorType eq "404"}'>    
	      404</h1>
	      <p>요청하신 페이지를 찾지 못하겠습니다. 정확한 URL인지 확인해주세요.</p>
      </c:if>
       <c:if test='${errorType eq "500"}'>	    
	      500</h1>
	      <p>서버에러입니다. 이용에 불편을 드려 진심으로 죄송합니다.</p>
      </c:if>
             
     </div>
    <!-- /.jumbotron -->

  </div>
  <!-- /.container -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>