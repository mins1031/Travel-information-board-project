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
  
  <div class="container">
	    
	<h1 class="mt-4 mb-3">회원정보</h1>

    <ol class="breadcrumb">
      
    </ol> 
    
	  <div class="row">
	      <div class="col-lg-4 mb-4">
	        <div class="card h-100">
	          <h4 class="card-header">회원 등록 정보</h4>
	          <div class="card-body">
	            <p class="card-text"> 회원가입시 기재한 정보와 추가적인 내용을 확인, 수정할수 있습니다.</p>
	          </div>
	          <div class="card-footer">
	            <a href="/user/userDetailInfo" class="btn btn-primary">클릭</a>
	          </div>
	        </div>
	      </div>
	      <div class="col-lg-4 mb-4">
	        <div class="card h-100">
	          <h4 class="card-header">게시물 관리</h4>
	          <div class="card-body">
	            <p class="card-text">작성하셨던 게시글을 확인할 수 있습니다.</p>
	          </div>
	          <div class="card-footer">
	            <a href="/user/userBoard" class="btn btn-primary">클릭</a>
	          </div>
	        </div>
	      </div>
	       <div class="col-lg-4 mb-4">
	        <div class="card h-100">
	          <h4 class="card-header">회원탈퇴</h4>
	          <div class="card-body">
	            <p class="card-text">회원탈퇴입니다.</p>
	          </div>
	          <div class="card-footer">
	            <a href="/user/remove" id="removeBtn" class="btn btn-primary">클릭</a>
	          </div>
	        </div>
	      </div>
	    </div>	  
	  
	  <form role="form" action="/user/remove" method="post">
	     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	     <input type="hidden" name="u_id" value='<sec:authentication property="principal.username"/>'>
	  </form>
  </div>
  
  <div class="modal fade" id="modal" role="dialog" aria-labelledby="introHeader" aria-hidden="true" tabindex="-1">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">모달</h4>
            </div>
            <div class="modal-body">
               <div class="form-group">
                <label>가입시 이메일을 입력해 주세요</label>
                <input class="form-control" id="modalInputEmail" name="modalInputEmail">
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" id="modalModifyBtn" class="btn btn-primary" data-dismiss="modal">수정</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
            </div>
          </div>
         </div>
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
  
  <script type="text/javascript">
   $(document).ready(function(){
	   var result = '<c:out value="${result}"/>';
 	  
 	  checkModal(result);
 	  
 	  function checkModal(result) {
 		  
 		  if(result == ""){
 			  console.log("result is null");
 			  return;
 		  }
 		  
 		  if(result == "success"){
 			  $(".modal-body").html("삭제완료.");
 		  }
 		  
 		  $("#modal").modal("show");
 	  }	  
   
	    $("#removeBtn").on("click",function(e){
	    	
	    	e.preventDefault();
	    	
            $("#modal").modal("show");
	    	$("#modalModifyBtn").on("click",function(e){
   	        
	    		var email = $("#modalInputEmail").val();
	    		$(".modal-body").html("<h4>정말 삭제하시겠습니까?</h4>");
	            $("#modal").modal("show");
	            
	    		var formObj = $("form");	
	    		formObj.submit();
  			});
	    			    
	    });
    
   }); 
  </script>
</body>
</html>