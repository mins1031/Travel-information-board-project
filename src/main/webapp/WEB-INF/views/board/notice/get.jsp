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
      <a class="navbar-brand" href="/">N.C.Q</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="new.jsp">NEW</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="outter.jsp">OUTTER</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="top.jsp">TOP</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact.jsp">BOTTOM</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              SHOES/BAG
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="shoes.jsp">SHOES</a>
              <a class="dropdown-item" href="bag.jsp">BAG</a>            
            </div> 
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact.html">ACESSORY</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact.html">SALE</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="alogin" href="/user/customLogin">LOGIN</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
   
   <div class="container">
    <div class="row">
      <div class="col-lg-8 mb-4">
        <h3>공지사항 등록</h3>
          <div class="control-group form-group">
            <div class="controls">
              <label>게시물 번호 : </label>
              <input type="text" class="form-control" name="n_id" value='<c:out value="${notice.n_id}"/>' 
                 readonly="readonly"   required data-validation-required-message="Please enter your name.">
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>제목 : </label>
              <input type="text" class="form-control" id="name" name="n_title" value='<c:out value="${notice.n_title}"/>'
               readonly="readonly"
                 required data-validation-required-message="Please enter your name.">
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>작성자:</label>
              <input type="tel" class="form-control" id="phone"  value='<c:out value="${notice.user.u_id}"/>' readonly="readonly" 
                  required data-validation-required-message="Please enter your phone number.">
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>내용:</label>
              <textarea rows="10" cols="100" class="form-control" name="n_content" readonly="readonly" maxlength="999"
               style="resize:none"><c:out value="${notice.n_content}"/></textarea>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>작성 일자:</label>
              <input type="tel" class="form-control" id="phone" name="n_regdate" 
                value='<c:out value="${notice.n_regdate}"/>'
                 readonly="readonly" required data-validation-required-message="Please enter your message" maxlength="999" style="resize:none"></textarea>
            </div>
          </div>
          <div id="success"></div>
          <!-- For success/fail messages -->
          <sec:authorize access="isAnonymous()">
		  </sec:authorize>
		  <sec:authorize access="hasRole('ROLE_ADMIN')">	     
		    
            <button class="btn btn-primary" data-oper='modify' id="modifyBtn">Modify</button>
	      </sec:authorize>
          
          <button class="btn btn-primary" id="listBtn">List</button>
          
          <form id="operForm" action="/board/notice/modify" method="get">
             <input type="hidden" id='n_id' name='n_id' value='<c:out value="${notice.n_id}"/>'>
             <input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
             <input type="hidden" name='amount' value='<c:out value="${cri.amount}"/>'>
             <input type="hidden" name='keyword' value='<c:out value="${cri.keyword}"/>'>
             <input type="hidden" name='type' value='<c:out value="${cri.type}"/>'>
          </form>
      </div>

    </div>
    <!-- /.row -->
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

 <script type="text/javascript">
    $(document).ready(function(){
    	
    	var operForm = $("#operForm");
    	
    	$("#modifyBtn").on("click",function(e){
    		operForm.attr("action","/board/notice/modify").submit();
    	});
    	
    	$("#listBtn").on("click",function(e){
    		operForm.find("#n_id").remove();
    		operForm.attr("action","/board/notice/list");
            operForm.submit();
    	});
    });
 </script>
</body>
</html>