<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>

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
   <link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet2">

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
        </ul>
      </div>
    </div>
  </nav>

  <div class="container">
      <div class="row">
       
        <div class="col-lg-12">
          <h2 class="page-header">유저목록</h2>
        </div>
      
 
       </div> 
      <table class="table table-striped table-bordered table-hover">
       <thead>
          <tr><th>id</th><th>이름</th><th>주소</th><th>연락처</th><th>이메일</th></tr>
       </thead>
       
       <c:forEach items="${userList}" var="user">
         <tr>
           <td><c:out value="${user.u_id}" /></td>
           <td><a class='move' href='<c:out value="${user.u_id}"/>'>
           <c:out value="${user.u_name}" /></a></td>
           <td><c:out value="${user.u_address}"/></td>
           <td><c:out value="${user.u_phone}"/></td>
           <td><c:out value="${user.u_email}"/></td>
         </tr>
       </c:forEach>
     </table>    
     <!-- 글목록 끝 -->
     
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
		    <li class="page-item">
		     <c:if test="${pageMaker.prev}"> 
              <a class="page-link" href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		        <span class="sr-only">Previous</span>
		      </a>
             </c:if>
		      
		    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		      <li class="page-item ${pageMaker.cri.pageNum == num ? "active" : ""} ">
		         <a class="page-link" href="${num}">${num}</a>
		      </li>
		    </c:forEach>  
		    </li>
		    
		    <li class="page-item">
		      <c:if test="${pageMaker.next}"> 
	              <a class="page-link" href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			        <span class="sr-only">Next</span>
			      </a>
              </c:if>
		    </li>
		  </ul>
		</nav>
	         <form action="/board/notice/list" id="actionForm" method="get">
	           <input type='hidden' name="pageNum" value="${pageMaker.cri.pageNum}">
	           <input type='hidden' name="amount" value="${pageMaker.cri.amount}">
	           <input type='hidden' name="type" value="${pageMaker.cri.type}">
	           <input type='hidden' name="keyword" value="${pageMaker.cri.keyword}">	           
	         </form>  <!-- url이 list인 이유는 다른 페이지를 선택할때 값을 계속 전달해 나가기 위함임 다른 페이지로 이동시(get)는 js로 제어해줌 -->     
        </ul>             
     </div>

     <div class="row">
	    <div class="col-lg-12">
	    
	      <form id="searchForm" action="/board/notice/list" method="get">
	       <select name="type" >
	          <option value=""
	             <c:out value="${pageMaker.cri.type == null ? 'selected':'' }"/>>--</option>
	          <option value="T"
	            <c:out value="${pageMaker.cri.type eq 'T' ? 'selected':'' }"/>>제목</option>
	          <option value="C"
	            <c:out value="${pageMaker.cri.type eq 'C' ? 'selected':'' }"/>>내용</option>
	          <option value="W"
	            <c:out value="${pageMaker.cri.type eq 'W' ? 'selected':'' }"/>>작성자</option>
	          <option value="TC"
	            <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected':'' }"/>>제목  or 내용</option>
	          <option value="TW"
	            <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected':'' }"/>>제목 or 작성자</option>
	          <option value="TWC"
	            <c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected':'' }"/>>제목 or 내용 or 작성자</option>  
	       </select>

	         <input type="text" name="keyword" id="keywordInput"
	             value="<c:out value="${pageMaker.cri.keyword}"/>"/>
	         <input type="hidden" name="pageNum" value="<c:out value='${pageMaker.cri.pageNum}'/>"/>
	         <input type="hidden" name="amount" value="<c:out value='${pageMaker.cri.amount}'/> "/>
	         <span class="input-group-btn">
	            <button class="btn btn-primary" id="searchBtn" >검색</button>
	         </span>
 
       </form>  
      </div>
     </div>   
  
<!-- Modal -->   
     <div class="modal fade" id="modal" role="dialog" aria-labelledby="introHeader" aria-hidden="true" tabindex="-1">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">공지 사항</h4>
            </div>
            <div class="modal-body">
               
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
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
  <script src="/resources/bootstrapt/js/bootstrap.min.js"></script>
  <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
 <script type="text/javascript">

  $(document).ready(function(){
		 
	  var result = '<c:out value="${result}"/>';
	  
	  checkModal(result);
	  
	  function checkModal(result) {
		  
		  if(result == ""){
			  console.log("result is null");
			  return;
		  }
		  
		  if(parseInt(result) > 0){
			  console.log("result!");
			  $(".modal-body").html("게시글 " + parseInt(result) + "번이 등록 되었습니다.");
		  } else if(result == "success"){
			  $(".modal-body").html("삭제완료.");
		  }
		  
		  $("#modal").modal("show");
	  }	 
	  
	  var updateResult = '<c:out value="${upresult}"/>';
   	  
   	  checkUpdateModal(updateResult);
         
   	  function checkUpdateModal(updateResult) {
   		  
   		  if(updateResult === ""){
   			  console.log("result is null");
   			  return;
   		  }
   		  
   		  if(parseInt(updateResult) > 0){
   			  console.log("update complete!");
   			  $(".modal-body").html("게시글 " + parseInt(updateResult) + "번이 수정 되었습니다.");
   		  } else if(updateResult === -1){
   			  console.log("update false...");
   			  $(".modal-body").html("update 실패");
   		  }
   		  
   		  $("#modal").modal("show");
   	  } 
   	  
   	  var actionForm = $("#actionForm");
   	  
   	  $(".page-item a").on("click",function(e){
   		  
   		  e.preventDefault();
   		  
   		  console.log('click');
   		  
   		  actionForm.find("input[name='pageNum']").val($(this).attr("href"));
   	      actionForm.submit();
   	   });
   	  
   	  $("#noticeRegister").on('click',function(e){
   		 
   		  self.location = "/board/notice/register";
   	  });
   	  
   	  $(".move").on('click',function(e){
   		 
   		  e.preventDefault();
   		  actionForm.append("<input type='hidden' name='n_id' value='"+ $(this).attr("href") + "'>"); 
   		  //get페이지로 pageNum 값을 넘겨주는 방식은 해당 a를 클릭하면 히든형식의 input태그를 만들고 value값을 해당 태그의 href값으로 한 내용을 넘겨주는 방식임
   		  actionForm.attr("action","/board/notice/get");
   		  actionForm.submit();
   	  });
   	  
   	  var searchForm = $("#searchForm");
   	  
   	  $("#searchForm button").on("click",function(e){
   		 
   		  if(!searchForm.find("option:selected").val()){
   			  alert("검색종류를 입력하세요");
   			  return false;
   		 }
   		  if(!searchForm.find("input[name='keyword']").val()){
 			  alert("키워드를 입력하세요");
 			  return false;
 		  }
   		  
   		  searchForm.find("input[name='pageNum']").val("1");
   		  e.preventDefault();
   		  
   		  searchForm.submit();
   	  });//검색시 검색되어 나온 페이지를 1페이지로 가게 하는 동작을 위한 js
  });
  
  </script>  
  
</body>
</html>