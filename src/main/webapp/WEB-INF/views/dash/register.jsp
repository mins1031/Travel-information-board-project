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

<style>
	.uploadResult {
		width: 100%;
		background-color: gray;
	}
	
	.uploadResult ul {
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
	}
	
	.uploadResult ul li {
		list-style: none;
		padding: 10px;
		align-content : center;
		text-align: center;
	}
	
	.uploadResult ul li img {
		width: 100px;
	}
	
</style>

<style>
	.bigPictureWrapper {
	  position: absolute;
	  display: none;
	  justify-content: center;
	  align-items: center;
	  top:0%;
	  width:100%;
	  height:100%;
	  background-color: gray; 
	  z-index: 100;
	}
	
	.bigPicture {
	  position: relative;
	  display:flex;
	  justify-content: center;
	  align-items: center;
	}
</style>


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
              <a class="dropdown-item" href="/dash/asia/oceania">호주/뉴질랜드</a>
              <a class="dropdown-item" href="/dash/asia/eastsouth">베트남/필리핀</a>
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
              <a class="dropdown-item" href="/dash/europe/italia">이탈리아</a>        
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
      <div class="col-lg-8 mb-4">
        <h3>게시글 등록</h3>
        <form role="form" action="/dash/register" method="post" novalidate>
          <div class="control-group form-group">
            <div class="controls">
              <label>제목 : </label>
              <input type="text" class="form-control" id="name" name="b_title" required data-validation-required-message="Please enter your name.">
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
              <textarea rows="10" cols="100" class="form-control" id="message" name="b_content" required data-validation-required-message="Please enter your message" maxlength="999" style="resize:none">
                </textarea>
            </div>
          </div>
          <div id="success"></div>
          <!-- For success/fail messages -->
          <button type="submit" class="btn btn-primary" id="게시글 등록">Send Message</button>
          
          <input type='hidden' name="boardType" value="${boardType}"/>
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </form>
      </div>

    </div>
    <!-- /.row -->
   </div>

    <div class="card my-4">
          <h5 class="card-header">첨부파일:</h5>
          <div class="card-body">
               <div class="form-group uploadDiv">
	             <input type="file" name="uploadFile" multiple>
	           </div>
             
             <div class="uploadResult">
               <ul>
               
               </ul>
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
 
  $(document).ready(function(e){
	 
 var formObj = $("form[role='form']");
	  
        $("button[type='submit']").on("click", function(e){ 
		  
		  e.preventDefault();
		  
		  console.log("submit clicked");
		  var str ="";
		  
		  $(".uploadResult ul li").each(function(i, obj){
			  
			  var jobj = $(obj);
			  
			  console.log(jobj);
			  
			  str +="<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			  str +="<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>"; 
			  str +="<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			  str +="<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
		  });
		  console.log(str);
		  formObj.append(str).submit();
	  });//게시글 등록버튼 누를시 폼태그에 대한 값을  formObj변수에 담고 히든속성 인풋태그를 만들어 각각의 태그 안에 파일의 정보를 담고 등록시 같이 폼태그에 담아 board로 데이터 보내줌.
	  
	  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	  var maxSize = 5242880; //5MB
	  
	  function checkExtension(fileName, fileSize){
	    
	    if(fileSize >= maxSize){
	      alert("파일 사이즈 초과");
	      return false;
	    }
	    
	    if(regex.test(fileName)){
	      alert("해당 종류의 파일은 업로드할 수 없습니다.");
	      return false;
	    }
	    return true;
	  }//파일의 사이즈가 기준을 초과하는지, 파일의 확장자가 막아야할 확장자와 동일한지를 체크하는 함수
	  
	  var csrfHeaderName="${_csrf.headerName}";
	  var csrfTokenValue="${_csrf.token}";
	  
	  $("input[type='file']").change(function(e){ //사용자가 파일을 인풋태그 안에 올리면 발생, 즉 파일을 선택했을때 동작하는듯. 파일 서버로 등록하는 함수
        /*FormData 인터페이스는 XMLHttpRequest.send()로 쉽게 보내질 수 있는 폼 field와 
		그 값들로 나타나는 key/value쌍들을 쉽게 만들 수 있는 방법을 제공한다. 
		만약에 인코딩 타입이 "multipart/form-data"로 설정이 되어 있으면 폼이 사용하는 것과 같은 포맷으로 사용한다.*/
		var formData = new FormData();//가상 form을 만듬
	    
		var inputFile = $("input[name='uploadFile']");
	    
		var files = inputFile[0].files;//위에서 만든 input태그내용대로 첫번째 파일을 적용시킴.
	    
		for(var i = 0; i < files.length; i++){

		      if(!checkExtension(files[i].name, files[i].size) ){
		        return false;
		      }
		      formData.append("uploadFile", files[i]);
	      //append: 선택된요소의 마지막에 새로운요소나 컨탠츠 추가 , formdata는 값을 키:벨류로 저장하기 때문에 자바스크립트에서 .으로 접근가능함 
	      //위내용은 uploadFile이라는 키로 해당 파일을 폼데이터에 넣어 주는 형태임. 
	    }
	    
	    $.ajax({
	      url: '/uploadAjaxAction',//해당 url호출해 controller 동작
	      processData: false, 
	      contentType: false,
	      beforeSend: function(xhr){
	    	  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	      },
	      data: formData, //위에서 폼형태로 작성완료된 formData를 서버에 보내는 데이터로 활용, 즉 서버에 파일 올리는 거임.
	      type: 'POST',
	      dataType:'json', //결과 json형태로 받음
	        success: function(result){
	          console.log(result); 
			  showUploadResult(result); //업로드 결과 처리 함수 

	      }
	    }); //$.ajax
	  });//당장은 해당 파일 페이지에 올려놓기만 하면 서버에 저장됨.
	  
	  function showUploadResult(uploadResultArr){ //ajax로 등록된후 결과list를 받아와 uploadResult ul에 출력해줌
		    
		    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
		    //result값이 null인지 확인.
		    var uploadUL = $(".uploadResult ul");
		    //uploadResult div태그안의 ul태그를 가리키는 변수 선언후 초기화
		    var str ="";
		    
		    $(uploadResultArr).each(function(i, obj){
		    //제이쿼리를 통해 배열을 처리하거나 받고 싶은때 each를 사용함 each는 매개변수로 받은것을 사용해 for in문과같이
		    //배열이나 객체의 요소를 검사할수 있는 메서드임 그래서 위 function의 i는 인덱스로 받아온 것의 길이만큼 적용되고
		    //obj는 해당 인덱스의 객체나 배열임. 결국 밑의 내용은 반복문의 안에 배열이나 리스트의 내용을 가공하는 내용이라고 봐도 무방함.
		    //==> 아마 
		        //image type
		        if(obj.image){
		          var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
		          //ajax통신하면 json형태로 받아오는데 객체로 적용이 되나봄 이렇게 .을 통해 접근할수 있는것 보니.
		          //아무튼 파일의 저장경로와 uuid값과 이름을 fileCallPath라는 변수에 인코딩해서 저장함.
		          str += "<li data-path='"+obj.uploadPath+"'";
		          str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
		          str +" ><div>";
                  str += "<span> "+ obj.fileName+"</span>"; //해당 파일의 파일이름 을 넣음
                  str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image'"
                  str += " class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
		          str += "<img src='/display?fileName="+fileCallPath+"'>";
		          str += "</div>";
		          str +"</li>";//str이라는 변수에 위의 문자열을 다담아서 출력되야하는 태그에 출력해주는 방식임
		        }else{
		          var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);            
		          var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
		              
		          str += "<li data-path='"+obj.uploadPath+"'";
			      str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
				  str +" ><div>";
		          str += "<span> "+ obj.fileName+"</span>";
		          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file'"
		          str += " class='btn btn-warning btn-circle'><i class='fa fa-times'>x</i></button><br>";
		          str += "<img src='/resources/img/attach.png'></a>";
		          str += "</div>";
		          str +"</li>";
		        } 
		    });//단순히 해당 파일이 이미지파일인지 아닌 지 구분하여 처리하는 if문임.
		    
		    uploadUL.append(str);
		  }
	  
	  $(".uploadResult").on("click","button",function(e){
		 
		  console.log("delete file");
		  
		  var targetFile = $(this).data("file");
		  var type = $(this).data("type");
		  
		  var targetLi = $(this).closest("li");
		  
		  $.ajax({
			url : '/deleteFile',
			data : {fileName : targetFile, type:type},
			dataType : 'text',
			beforeSend: function(xhr){
		    	  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		    },
			type : 'POST',
			  success: function(result){
				  alert(result);
			      targetLi.remove();
			  }
		  })
	  });
  });  
	 
 </script>
</body>
</html>