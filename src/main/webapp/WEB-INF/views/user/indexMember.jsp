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
              <a class="dropdown-item" href="/dash/asia/osania">호주/뉴질랜드</a>
              <a class="dropdown-item" href="/dash/asia/eastsount">베트남/필리핀</a>
              <a class="dropdown-item" href="/dash/asiaEtc">그외</a>                                           
            </div> 
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                 유럽
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="/dash/europe/uk">영국</a>
              <a class="dropdown-item" href="/dash/europe/france">프랑스</a>
              <a class="dropdown-item" href="/dash/europe/itary">이탈리아</a>        
              <a class="dropdown-item" href="/dash/europe/spain">스페인/포르투갈</a>
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

   <h2 class="my-4">TraSS에 방문해 주셔서 감사합니다. 원하시는 정보 얻어가시길 바랍니다.</h2>  

    <!-- Portfolio Section -->
    <h2>대표 게시판</h2>

    <div class="row">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="/resources/img/japan_huji.jpg" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">일본</a>
            </h4>
            <p class="card-text">일본 게시판 입니다. 여행,유학,워킹홀리데이,이민,취업등 다양한 정보를 공유하고 교환해 주세요! </p>
            *폭언,욕설,인격모독등의 행위는 회원자격 박탈사유 입니다.의견차는 대화와 타협으로 해결해주세요.* </p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="/resources/img/paris.jpg" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">프랑스</a>
            </h4>
            <p class="card-text">프랑스 게시판 입니다. 여행,유학,워킹홀리데이,이민,취업등 다양한 정보를 공유하고 교환해 주세요! </p>
            *폭언,욕설,인격모독등의 행위는 회원자격 박탈사유 입니다.의견차는 대화와 타협으로 해결해주세요 *</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="/resources/img/London.jpg" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">영국</a>
            </h4>
            <p class="card-text">영국 게시판 입니다. 여행,유학,워킹홀리데이,이민,취업등 다양한 정보를 공유하고 교환해 주세요! </p>
            *폭언,욕설,인격모독등의 행위는 회원자격 박탈사유 입니다.의견차는 대화와 타협으로 해결해주세요 *</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="/resources/img/swiss_matahorn.jpg" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">스위스</a>
            </h4>
            <p class="card-text">스위스 게시판 입니다. 여행,유학,워킹홀리데이,이민,취업등 다양한 정보를 공유하고 교환해 주세요! </p>
            *폭언,욕설,인격모독등의 행위는 회원자격 박탈사유 입니다.의견차는 대화와 타협으로 해결해주세요 *</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="/resources/img/poroto.jpg" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">포루트갈</a>
            </h4>
            <p class="card-text">포루트갈 게시판 입니다. 여행,유학,워킹홀리데이,이민,취업등 다양한 정보를 공유하고 교환해 주세요! </p>
            *폭언,욕설,인격모독등의 행위는 회원자격 박탈사유 입니다.의견차는 대화와 타협으로 해결해주세요 *</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="/resources/img/boracay.jpg" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">필리핀</a>
            </h4>
            <p class="card-text">필리핀 게시판 입니다. 여행,유학,워킹홀리데이,이민,취업등 다양한 정보를 공유하고 교환해 주세요! </p>
            *폭언,욕설,인격모독등의 행위는 회원자격 박탈사유 입니다.의견차는 대화와 타협으로 해결해주세요 *</p>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->


    <!-- Call to Action Section -->
    <div class="row mb-4">
      <div class="col-md-8">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
      </div>
      <div class="col-md-4">
        <a class="btn btn-lg btn-secondary btn-block" href="#">Call to Action</a>
      </div>
    </div>

  </div>
  <!-- /.container -->

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
