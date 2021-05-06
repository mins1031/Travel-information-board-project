<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>N.C.Q</title>

  <!-- Bootstrap core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/resources/css/modern-business.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="/user/indexAdmin">N.C.Q</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" id="alogin" href="/user/userInfo">MYPAGE</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/user/customLogout">LOGOUT</a>
          </li>
        
        </ul>
      </div>
    </div>
  </nav>
  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url('/resources/img/풍경1.gif')">
          <div class="carousel-caption d-none d-md-block">
            <h3>First Slide</h3>
            <p>This is a description for the first slide.</p>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('/resources/img/londoneye.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Second Slide</h3>
            <p>This is a description for the second slide.</p>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('/resources/img/escape1.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Third Slide</h3>
            <p>This is a description for the third slide.</p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>

  <!-- Page Content -->
  <div class="container">

    <h1 class="my-4">Welcome Admin <sec:authentication property="principal.username"/>!!</h1>

       
    <!-- Features Section -->
  
  <div class="container">
	    
	<h1 class="mt-4 mb-3">관리자 기능</h1>

    <ol class="breadcrumb">
      
    </ol> 
    
	  <div class="row">
	       <div class="col-lg-4 mb-4">
		        <div class="card h-100">
		          <h4 class="card-header">공지사항</h4>
		          <div class="card-body">
		            <p class="card-text">공지사항 메뉴로 이동합니다.</p>
		          </div>
		          <div class="card-footer">
		            <a href="/board/notice/list" class="btn btn-primary">이동</a>
		          </div>
		        </div>
		    </div>
		    
	        <div class="col-lg-4 mb-4">
	        <div class="card h-100">
	          <h4 class="card-header">어드민 계정 등록</h4>
	          <div class="card-body">
	            <p class="card-text">새로운 어드민 계정을 등록합니다.</p>
	          </div>
	          <div class="card-footer">
	            <a href="/user/adminJoin" class="btn btn-primary">이동</a> 
	          </div>
	        </div>
	      </div> 
	      <div class="col-lg-4 mb-4">
	        <div class="card h-100">
	          <h4 class="card-header">회원 목록</h4>
	          <div class="card-body">
	            <p class="card-text">최근 가입한 순으로 회원 목록을 나열합니다.</p>
	          </div>
	          <div class="card-footer">
	            <a href="/user/userList" class="btn btn-primary">이동</a>
	          </div>
	        </div>
	      </div>	    	  
	    </div>
	     <!--       1 row      -->
	   <div class="row">
	      <div class="col-lg-4 mb-4">
	        <div class="card h-100">
	          <h4 class="card-header">국내게시판 목록</h4>
	          <div class="card-body">
	            <p class="card-text">국내 게시판 목록 입니다.</p>
	              <li>
		            <strong><a href="/dash/internal/sudo">수도권</a></strong>
		          </li>
		          <li>
		            <strong><a href="/dash/internal/gangwon">강원도</a></strong>
		          </li>
		          <li>
		            <strong><a href="/dash/internal/chungcheong">충청도</a></strong>
		          </li>
		          <li>
		            <strong><a href="/dash/internal/gyeongsang">경상도</a></strong>
		          </li>
		          <li>
		            <strong><a href="/dash/internal/jeonla">전라도</a></strong>
		          </li>
		          <li>
		            <strong><a href="/dash/internal/jeju">제주도</a></strong>
		          </li>
	          </div>
	        </div>
	      </div>
	      <div class="col-lg-4 mb-4">
	        <div class="card h-100">
	          <h4 class="card-header">아시아 게시판 목록</h4>
	          <div class="card-body">
	            <p class="card-text">아시아 게시판 목록 입니다.</p>
	              <li>
		            <strong><a href="/dash/asia/china">중국</a></strong>
		          </li>
		          <li>
		            <strong><a href="/dash/asia/japan">일본</a></strong>
		          </li>
		          <li>
		            <strong><a href="/dash/asia/osania">오세아니아</a></strong>
		          </li>
		          <li>
		            <strong><a href="/dash/asia/eastsount">동남아</a></strong>
		          </li>
		          <li>
		            <strong><a href="/dash/asia/etc">그외</a></strong>
		          </li>
	          </div>
	        </div>
	      </div>
	      <div class="col-lg-4 mb-4">
	        <div class="card h-100">
	          <h4 class="card-header">유럽 게시판 목록</h4>
	          <div class="card-body">
	            <p class="card-text">유럽 게시판 목록 입니다.</p>
	              <li>
		            <strong><a href="/dash/europe/uk">영국</a></strong>
		          </li>
		          <li>
		            <strong><a href="/dash/europe/france">프랑스</a></strong>
		          </li>
		          <li>
		            <strong><a href="/dash/europe/itary">이탈리아</a></strong>
		          </li>
		          <li>
		            <strong><a href="/dash/europe/iberia">이베리아 반도</a></strong>
		          </li>
		          <li>
		            <strong><a href="/dash/europe/swiss">스위스</a></strong>
		          </li>
		          <li>
		            <strong><a href="/dash/europe/germany">독일</a></strong>
		          </li>
		          <li>
		            <strong><a href="/dash/europe/etc">북유럽/그외</a></strong>
		          </li>
	          </div>
	        </div>
	      </div>
	      <div class="col-lg-4 mb-4">
	        <div class="card h-100">
	          <h4 class="card-header">아메리카 게시판 목록</h4>
	          <div class="card-body">
	            <p class="card-text">아메리카 게시판 목록 입니다.</p>
	              <li>
		            <strong><a href="/dash/america/usa">미국</a></strong>
		          </li>
		          <li>
		            <strong><a href="/dash/america/canada">캐나다</a></strong>
		          </li>
		          <li>
		            <strong><a href="/dash/america/mexico">멕시코</a></strong>
		          </li>
		          <li>
		            <strong><a href="/dash/america/etc">남미/그외</a></strong>
		          </li>
	          </div>
	        </div>
	      </div>
	  </div>
	  <!--       2 row      -->
  </div>

  <div>
  
  </div>

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- <script type="text/javascript">
     $("#alogin").on("click", function() {

		self.location = "/user/login"; 

	 });
  </script>  --> 
     
</body>
</html>
