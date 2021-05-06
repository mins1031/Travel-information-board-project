<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Trass</title>

  <!-- Bootstrap core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  
  <!-- Custom styles for this template -->
  <link href="/resources/css/modern-business.css" rel="stylesheet">
   
  <link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        @import url(https://fonts.googleapis.com/css?family=Raleway:300,400,600);


body{
    margin: 0;
    font-size: .9rem;
    font-weight: 400;
    line-height: 1.6;
    color: #212529;
    text-align: left;
    background-color: #f5f8fa;
}

.navbar-laravel
{
    box-shadow: 0 2px 4px rgba(0,0,0,.04);
}

.navbar-brand , .nav-link, .my-form, .login-form
{
    font-family: Raleway, sans-serif;
}

.my-form
{
    padding-top: 1.5rem;
    padding-bottom: 1.5rem;
}

.my-form .row
{
    margin-left: 0;
    margin-right: 0;
}

.login-form
{
    padding-top: 1.5rem;
    padding-bottom: 1.5rem;
}

.login-form .row
{
    margin-left: 0;
    margin-right: 0;
}
    </style>
     <script src="/resources/vendor/jquery/jquery.min.js"></script>
     <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> 
</head>
<body>
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
            <a class="nav-link" id="login" href="/user/customLogin?">LOGIN</a>
          </li>
         </sec:authorize>  
         <sec:authorize access="isAuthenticated()">
          <li class="nav-item">
            <a class="nav-link" href="/user/customLogout">LOGOUT</a>
          </li>
         </sec:authorize>
     
    </div>
 </nav>
   <main class="login-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">로그인</div>
                    <div class="card-body">
                        <form action="/user/customJoin" method="post">
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">아이디</label>
                                <div class="col-md-6">
                                    <input type="text" id="id" class="form-control" name="u_id" required autofocus>
                                    <a class="btn btn-primary" id="idCheckBtn" value="0" >중복검사</a>                          
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">비밀번호</label>
                                <div class="col-md-6">
                                    <input type="password" id="pw" class="form-control" name="u_pw" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">비밀번호 확인</label>
                                <div class="col-md-6">
                                    <input type="password" id="pwVerify" class="form-control" name="u_pwVerify" required>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">이름</label>
                                <div class="col-md-6">
                                    <input type="text" id="u_name" class="form-control" name="u_name" required>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">주소</label>
                                <div class="col-md-6">
                                    <input type="text" id="address" class="form-control" name="u_address" required>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">전화번호</label>
                                <div class="col-md-6">
                                    <input type="text" id="tell" class="form-control" name="u_tell">
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">휴대폰 번호</label>
                                <div class="col-md-6">
                                    <input type="text" id="phone" class="form-control" name="u_phone" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">이메일</label>
                                <div class="col-md-6">
                                    <input type="email" id="email" class="form-control" name="u_email" required>
                                </div>                                
                            </div>
                            <div class="form-group row">
                                <div class="col-md-6 offset-md-4">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="sms"> SMS 수신 동의
                                        </label>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" id="regBtn" class="btn btn-primary">
                                                                                    회원가입
                                </button>
                            </div>
                             <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>
</main>
 

<script type="text/javascript">
var csrfHeaderName="${_csrf.headerName}";
var csrfTokenValue="${_csrf.token}";
	$(document).ajaxSend(function(e,xhr,options){
		 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	 })//po
	$(document).ready(function(){	
	
		var value = "0";
		
		console.log("dd");
		console.log(value);
	  $("#idCheckBtn").on('click',function(e){
		 
		  e.preventDefault();
		  
		  $.ajax({
			  
			  url: '/user/idCheck',
			  type : 'post',
			  dataType : "json",
			  data : {"u_id" : $("#id").val()},
			  beforeSend: function(xhr){
				  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			  },
			  success : function(result) {
				  if(result == 1){
					  alert("사용할수 없는 아이디 입니다!");
					  value = '0';
				  } else {
					  alert("사용가능 한 아이디 입니다!");
					  value = '1';
				  }
			  }
		  });
	  });
	 
	  $("#regBtn").on('click',function(e){

		  var pw = $("#pw").val();
		  var pwVerify = $("#pwVerify").val();


		  if(pw !== pwVerify){
			  e.preventDefault();
			  alert("비밀번호가 동일한지 확인해주세요 ");
		  }
		  
		  if(value === '0'){
			  e.preventDefault();
			  alert("아이디 중복체크 확인해주세요");
		  }
	  });
	}); 
</script>
</body>
</html>