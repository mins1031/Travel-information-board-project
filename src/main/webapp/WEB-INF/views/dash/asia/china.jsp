<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
              <a class="dropdown-item" href="/dash/chungcheong">충청도</a>
              <a class="dropdown-item" href="/dash/gyeongsang">경상도</a>
              <a class="dropdown-item" href="/dash/jeonla">전라도</a>
              <a class="dropdown-item" href="/dash/jeju">제주도</a>                                           
            </div> 
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="internalBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                 아시아
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="/dash/china">중국</a>
              <a class="dropdown-item" href="/dash/japan">일본</a>
              <a class="dropdown-item" href="/dash/osania">호주/뉴질랜드</a>
              <a class="dropdown-item" href="/dash/eastsount">베트남/필리핀</a>
              <a class="dropdown-item" href="/dash/asia">그외</a>                                           
            </div> 
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                 유럽
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="shoes.jsp">영국</a>
              <a class="dropdown-item" href="bag.jsp">프랑스</a>
              <a class="dropdown-item" href="bag.jsp">이탈리아</a>        
              <a class="dropdown-item" href="bag.jsp">스페인/포르투갈</a>
              <a class="dropdown-item" href="bag.jsp">스위스</a>
              <a class="dropdown-item" href="bag.jsp">독일</a>
              <a class="dropdown-item" href="bag.jsp">북유럽/그외</a>                          
            </div> 
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                 아메리카
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="shoes.jsp">미국</a>
              <a class="dropdown-item" href="bag.jsp">케나다</a>
              <a class="dropdown-item" href="bag.jsp">멕시코</a>        
              <a class="dropdown-item" href="bag.jsp">남미/그 외</a>                          
            </div> 
          <li>
            <a class="nav-link" id="alogin" href="/user/customLogin">LOGIN</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
   
   <div class="container">
      <div class="row">
       
        <div class="col-lg-12">
          <h2 class="page-header">중국 게시판</h2>
        </div>
      
        <div class="col-lg-12">
          <div>
            <div>
             <input type="button"  class="btn btn-primary" id="boardRegister" style='float:right;' value="게시글 등록">
            </div>
          </div>
        </div>
      
      <table class="table table-striped table-bordered table-hover">
       <thead>
          <tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일자</th><th>조회수</th></tr>
       </thead>
       
         <c:forEach items="${boardList}" var="board">
         <tr>
           <td><c:out value="${board.bno}" /></td>
           <td><a class='move' href='<c:out value="${board.bno}"/>'>
           <c:out value="${board.b_title}" />   <b>[<c:out value="${board.replyCnt}"/>]</b>
           </a></td>
           <td><c:out value="${board.user.u_id}"/></td>
           <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.b_regdate}"/></td>
           <td><c:out value="${board.b_hit}" /></td>
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
	             
        </ul>             
     </div>
      
      <!-- 페이징 끝 -->
      
       <form action="/dash/sudo" id="actionForm" method="get">
               <input type='hidden' name="boardType" value="${boardType}">
	           <input type='hidden' name="pageNum" value="${pageMaker.cri.pageNum}">
	           <input type='hidden' name="amount" value="${pageMaker.cri.amount}">
	           <input type='hidden' name="type" value="${pageMaker.cri.type}">
	           <input type='hidden' name="keyword" value="${pageMaker.cri.keyword}">       
	    </form>
	    <!-- url이 list인 이유는 다른 페이지를 선택할때 값을 계속 전달해 나가기 위함임 다른 페이지로 이동시(get)는 js로 제어해줌 -->  
	    <form action="/dash/sudo" id="regiForm" method="get">
	       <input type='hidden' name="boardType" value="${boardType}">
	    </form>
     </div>
    </div>
    
    <div class="search row">
	    <div class="col-xs-2 col-sm-2">
	       <select name="searchType" class="form-control">
	          
	       </select>
	     </div>              
	     
	     <div class="col-xs-10 col-sm-10">
	       <div class="input-group">
	         <input type="text" name="keyword" id="keywordInput" class="form-control"/>
	         <span class="input-group-btn">
	            <button class="btn btn-primary" id="searchBtn">검색</button>
	         </span>
	       </div>
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
  <script type="text/javascript" src="/resources/js/reply.js"></script>
  
   <script type="text/javascript">
     $(document).ready(function(){
    	 
    	 console.log(replyService);
    
     });
   </script>
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
    	  //게시물 등록시 등록여부 확인가능한 모달창 구현 로직
    	  
    	  var regiForm = $("#regiForm");
    	  
    	   $("#boardRegister").on('click',function(e){
   		      
    		   regiForm.attr("action","/dash/register");
    		   regiForm.submit();
   		   }); //등록 버튼 클릭시 화면이동
   		   
   		   
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
       		  
       		  actionForm.find("input[name='pageNum']").val($(this).attr("href"));//bno의 값대로 href값이 정해짐.
       	      actionForm.submit();
       	   });
           //페이징 된 번호들 클릭시 해당 페이지로 이동시키는 로직           
       	  
       	  $(".move").on('click',function(e){
       		 
       		  e.preventDefault();
       		  actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href") + "'>"); 
       		  //get페이지로 pageNum 값을 넘겨주는 방식은 해당 a를 클릭하면 히든형식의 input태그를 만들고 value값을 해당 태그의 href값으로 한 내용을 넘겨주는 방식임
       		  actionForm.attr("action","/dash/get");
       		  actionForm.submit();
       	  });
       	  
       	  //값 전달하는 form 조작 로직
      });
      
   </script>
</body>
</html>