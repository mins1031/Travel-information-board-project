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
        <form action="/board/notice/register" method="post" novalidate>
          <div class="control-group form-group">
            <div class="controls">
              <label>제목 : </label>
              <input type="text" class="form-control" id="name" name="n_title" required data-validation-required-message="Please enter your name.">
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>작성자:</label>
              <input type="tel" class="form-control" id="phone"  value="<sec:authentication property="principal.username"/>" required data-validation-required-message="Please enter your phone number.">
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>내용:</label>
              <textarea rows="10" cols="100" class="form-control" id="message" name="n_content" required data-validation-required-message="Please enter your message" maxlength="999" style="resize:none">
                </textarea>
            </div>
          </div>
          <div id="success"></div>
          <!-- For success/fail messages -->
          <button type="submit" class="btn btn-primary" id="sendMessageButton">Send Message</button>
          
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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

 <script type="text/javascript">
 
 </script>
</body>
</html>