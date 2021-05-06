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
              <a class="dropdown-item" href="/dash/sudo">수도권</a>
              <a class="dropdown-item" href="/dash/gangwon">강원도</a>
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
              <a class="dropdown-item" href="shoes.jsp">미국</a>
              <a class="dropdown-item" href="bag.jsp">케나다</a>
              <a class="dropdown-item" href="bag.jsp">멕시코</a>        
              <a class="dropdown-item" href="bag.jsp">남미/그 외</a>                          
            </div> 
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
              <input type="text" class="form-control" name="bno" value='<c:out value="${board.bno}"/>' 
                 readonly="readonly"   required data-validation-required-message="Please enter your name.">
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>제목 : </label>
              <input type="text" class="form-control" id="name" name="b_title" value='<c:out value="${board.b_title}"/>'
               readonly="readonly"
                 required data-validation-required-message="Please enter your name.">
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>작성자:</label>
              <input type="tel" class="form-control" id="phone"  value='<c:out value="${board.user.u_id}"/>' readonly="readonly" 
                  required data-validation-required-message="Please enter your phone number.">
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>내용:</label>
              <textarea rows="10" cols="100" class="form-control" name="b_content" readonly="readonly" maxlength="999"
               style="resize:none"><c:out value="${board.b_content}"/></textarea>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>게시판 타입:</label>
              <input type="text" class="form-control" id="type"  value='<c:out value="${board.region.regionId}"/>' readonly="readonly" 
                  required data-validation-required-message="Please enter your phone number.">
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>작성 일자:</label>
              <input type="tel" class="form-control" id="phone" name="n_regdate" 
                value='<c:out value="${board.b_regdate}"/>'
                 readonly="readonly" required data-validation-required-message="Please enter your message" maxlength="999" style="resize:none"></textarea>
            </div>
          </div>

          <div id="success"></div>
          <!-- For success/fail messages -->
               
		    <sec:authentication property="principal" var="pinfo"/>
		      
		      <sec:authorize access="isAuthenticated()">
		       <c:if test="${pinfo.username eq board.user.u_id}">
		          <button class="btn btn-primary" data-oper='modify' id="modifyBtn">Modify</button>
		       </c:if>
		      </sec:authorize>
           <!-- 로그인 되어있다면 작성자와 이용자의 id가 같은상황이면 수정버튼 활성화시키고 아닌경우 수정버튼 안나옴. -->
           
          <button class="btn btn-primary" id="listBtn">List</button>
          
          <form id="operForm" action="/board/notice/modify" method="get">
             <input type="hidden" id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
             <input type="hidden" id="boardType" name='boardType' value='<c:out value="${boardType}"/>'>
             <input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
             <input type="hidden" name='amount' value='<c:out value="${cri.amount}"/>'>
             <input type="hidden" name='keyword' value='<c:out value="${cri.keyword}"/>'>
             <input type="hidden" name='type' value='<c:out value="${cri.type}"/>'>
             <input type="hidden" id='userInfoToken' name='userInfoToken' value='<c:out value="${userInfoToken}"/>'>
          </form>
      </div>

    </div>
    <!-- /.row -->
   </div>

       <div class='thumbnails'>
		  <div class='thumbnail'>
		  </div>
	   </div> 
	   
    <!--   <div class="col-sm-6 col-md-3">
      <a href="#" class="thumbnail">
        <img src="DSC_6305.jpg" alt="...">
      </a>
    </div>
    -->
  <style>
	.uploadResult {
	  width:100%;
	  background-color: gray;
	}
	.uploadResult ul{
	  display:flex;
	  flex-flow: row;
	  justify-content: center;
	  align-items: center;
	}
	.uploadResult ul li {
	  list-style: none;
	  padding: 10px;
	  align-content: center;
	  text-align: center;
	}
	.uploadResult ul li img{
	  width: 100px;
	}
	.uploadResult ul li span {
	  color:white;
	}
	.thumbnails {
	  position: absolute;
	  display: none;
	  justify-content: center;
	  align-items: center;
	  top:0%;
	  width:100%;
	  height:100%;
	  background-color: gray; 
	  z-index: 100;
	  background:rgba(255,255,255,0.5);
	}
	.thumbnail {
	  position: relative;
	  display:flex;
	  justify-content: center;
	  align-items: center;
	}
	
	.thumbnail img {
	  width:600px;
	}
  </style>

   <div class="card my-4">
          <h5 class="card-header">첨부파일:</h5>
          <div class="card-body">
             
             <div class="uploadResult">
               <ul>
               
               </ul>
             </div>
          </div>
        </div>
   
 
      <div class="card my-4">
          <h5 class="card-header">Leave a Comment:</h5>
          <div class="card-body">
              <div class="form-group">
                <textarea id="replyContent" class="form-control" rows="3"></textarea>
              </div>
              
              <sec:authorize access="isAuthenticated()">
		          <button id="addReplyBtn" class="btn btn-primary">댓글 작성</button>
		      </sec:authorize>
              
          </div>
        </div>

        <!-- Single Comment -->
           
      <div class="container">       
        <div class="media mb-4">
         
           <ul class="chat" >
            <li class="left clearfix" data-rno='6'>
             <div>
              <div class="media-body">
                <strong class="primary-font">user00</strong>
                <small class="pull-right text-muted" style='float:right;'>2018-01-01 13:13</small>
              </div>
              <p>Good job!</p>        
             </div>
            </li>
           </ul>
           
        </div>
      </div>  
  <!-- 댓글 끝 -->
      <div class="panel-footer">
        
      </div>
   
   
   <div class="modal fade" id="modal" role="dialog" aria-labelledby="introHeader" aria-hidden="true" tabindex="-1">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                  aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="modalLabel">댓글</h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>Reply</label>
                <input class="form-control" name="reply">
              </div>
              <div class="form-group">
                <label>Replyer</label>
                <input class="form-control" name="replyer">
              </div>
              <div class="form-group">
                <label>Reply Date</label>
                <input class="form-control" name="replyDate">
              </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="modalModifyBtn" class="btn btn-primary" data-dismiss="modal">수정</button>
                <button type="button" id="modalRemoveBtn" class="btn btn-primary" data-dismiss="modal">삭제</button>
                <button type="button" id="modalcloseBtn" class="btn btn-primary" data-dismiss="modal">닫기</button>
            </div>
          </div>
         </div>
       </div>    
   <!-- 모달 끝 -->

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
  <script type="text/javascript" src="/resources/js/boardSwitch.js"></script>

 <script type="text/javascript">
    $(document).ready(function(){
    	
    	var operForm = $("#operForm");
    	
    	var type = $("#type").val();
    	var userInfoToken = operForm.find("#userInfoToken").val();
    	
    	var url = null;
    	//console.log(userInfoToken);
    	if(userInfoToken === 'null') {
    		var boardType = typeSwitch(type);
        	//모듈화해주기 위해 해당 내용 
        	url = "/dash"+boardType ;
    	} else if(userInfoToken !== 'null'){
    		url = "/user/userBoard";
    	} // 유저 작성 게시판 화면으로 돌아가는 로직도 있어야하기에 유저작성게시판에서 get하면 폼의 인풋값으로 토큰 값을 주고 해당값이 널이면 일반 게시판으로,
    	  //널이 아니면 유저작성 게시판으로 리다이렉트함 
 
    	
    	$("#modifyBtn").on("click",function(e){
    		operForm.attr("action","/dash/modify").submit();
    	});
    	
    	$("#listBtn").on("click",function(e){
    		operForm.find("#bno").remove();
    		operForm.attr("action",url);
            operForm.submit();
    	});
    });
    
 </script>
 
 <script type="text/javascript">
	 var csrfHeaderName="${_csrf.headerName}";
	 var csrfTokenValue="${_csrf.token}";
	 $(document).ajaxSend(function(e,xhr,options){
	 	 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	  })//post로 댓글 작성시 csrf토큰을 같이 적용시키는 로직.
	  	 
   $(document).ready(function(){
    	
    	var bnoValue = '<c:out value="${board.bno}"/>';
    	var replyUL = $(".chat");
    	
        var modal = $(".modal");
        var modalInputReply = modal.find("input[name='reply']");
        var modalInputReplyer = modal.find("input[name='replyer']");
        var modalInputReplyDate = modal.find("input[name='replyDate']");
    	
        var modalMoBtn = $("#modalModifyBtn");
        var modalRemoveBtn = $("#modalRemoveBtn");        
           	
        var username = null;
        
    	<sec:authorize access='isAnonymous()'>
    		username=""; 
    	</sec:authorize>  
    	<sec:authorize access='isAuthenticated()'>
    	   username = "<sec:authentication property='principal.username'/>";
    	</sec:authorize>
        
    	console.log();
    	
    	showList(1);	    
    	
    	//댓글 리스트
    	function showList(page) {
	    	replyService.getList({bno:bnoValue, page: page|| 1}, function(replyCnt, list){
	       	 
	    		console.log(replyCnt);
	    		console.log(list);
	    		//console.log(page); 
	    		 
	    		if(page == "p"){
	    		      pageNum = Math.ceil(replyCnt/10.0);
	    		      showList(pageNum);
	    		      return;
	    		}
	    		//댓글을 추가한 페이지를 출력하기 위함이 기에 댓글수를 가져와 마지막페이지를 띄워준다. 갱신이 안됨... 이유불뮨 보류
	    		
	    		var str="";
	    		if(list == null || list.length == 0){
	    			replyUL.html("");
	    			
	    			return; // 서버에서 받아온 데이터가 비어있을거나 null인경우 replyUL의 내용을 "" 로 적용후 리턴 즉 댓글이 없는게시글일경우임.
	    		}
	    		
		       	 for(var i =0, len = list.length || 0; i< len; i++){
		       	   str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
		       	   str +="<div><div class='media-body'><strong class='primary-font'>"+list[i].replyer+"</strong>";
		       	   str +="<small class='pull-right text-muted' style='float:right;'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
		       	   str +="<p>"+list[i].reply+"</p></div></li>";
		       	 }
		       	 
		       	 replyUL.html(str);
		       	 
		       	 showReplyPage(replyCnt);
	        }); 
    	}
    	//댓글 리스트 끝
    	
    	// 댓글 등록
        $("#addReplyBtn").on('click',function(e){
        	
        	var username = null;
      
        	<sec:authorize access='isAnonymous()'>
        		username=""; 
        	</sec:authorize>  
        	<sec:authorize access='isAuthenticated()'>
        	   username = "<sec:authentication property='principal.username'/>";
        	</sec:authorize>
        	 
        	 
        	var replyContent = $("#replyContent").val();
        	
        	var reply ={
        	    "bno" : bnoValue,
        		"reply" : replyContent,
        		"replyer" : username
        	};
        	
            replyService.add(reply,function(result){
        			
        		alert(result);
        		$("#replyContent").val("");
        		showList(1); //댓글 등록전 보고있던 마지막 댓글 페이지로 이동함.작동재대로 안됨;;
        	});
        });
    //댓글 등록 끝
    
	//댓글 조회
	    $(".chat").on("click",'li',function(e){
			
			var rno = $(this).data("rno");
							
			replyService.get(rno,function(result){
				
				modalInputReply.val(result.reply);
				modalInputReplyer.val(result.replyer);
				
				modalInputReplyDate.val(replyService.displayTime(result.replyDate)).attr("readonly","readonly");
				modal.data("rno",rno);
				
				modal.find("button[id != 'modalCloseBtn']").hide();
				modalMoBtn.show();
				modalRemoveBtn.show();
				
				$(".modal").modal("show");
				
			})//댓글 조회 이벤트메서드
            
            modalMoBtn.on("click",function(e){
    	         var reply = {rno:rno,reply:modalInputReply.val(),replyer:modalInputReplyer.val()};
    	         
    	         if(!username){
   				  alert("로그인후 수정이 가능합니다.");
   				  modal.modal("hide");
   				  return;
   				}
   				
   				var originalReplyer = modalInputReplyer.val();
   				
   				console.log("Original: replyer : " +originalReplyer )
   				
   				if(username != originalReplyer){
   					alert("자신이 작성한 댓글만 수정이 가능합니다.");
   					modal.modal("hide");
   					return;
   				}
    	         
    	         replyService.update(reply,function(result){
    	        	 
    	        	 alert(result);
    	        	 modal.modal("hide");
    	        	 showList(pageNum);
    	         });
            });
			//댓글 수정 이벤트메서드
			modalRemoveBtn.on("click",function(e){
   	         
				if(!username){
				  alert("로그인후 삭제가 가능합니다.");
				  modal.modal("hide");
				  return;
				}
				
				var originalReplyer = modalInputReplyer.val();
				
				console.log("Original: replyer : " +originalReplyer )
				
				if(username != originalReplyer){
					alert("자신이 작성한 댓글만 삭제가 가능합니다.");
					modal.modal("hide");
					return;
				}
				
   	         replyService.remove(rno,originalReplyer,function(result){
   	        	 
   	        	 alert(result);
   	        	 modal.modal("hide");
   	        	 showList(pageNum);
   	         });
           });//댓글 삭제 이벤트메서드
		});
    //댓글 조회 끝
      
     /*페이징 처리 내용*/
       
       var pageNum =1;
       var replyPageFooter = $(".panel-footer");
       
       function showReplyPage(replyCnt){
    	   
    	   var endNum = Math.ceil(pageNum / 10.0) * 10;
    	   var startNum = endNum - 9;
    	   
    	   var prev = startNum != 1; //startNum이 1이 아니면 1~10의 페이지를 지난 11~20 페이지라는 뜻이기에 이전 기능 활성화 !
    	   var next = false;
    	   
    	   if(endNum * 10 >= replyCnt){
    		   endNum = Math.ceil(replyCnt/10.0);
    	   }
    	   if(endNum * 10 < replyCnt){
    		   next = true;
    	   }
    	   
    	   var str = "<ul class='pagination pull-right'>";
    	   
    	   if(prev){
    		   str += "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
    	   }
    	   
    	   for(var i = startNum; i <= endNum; i++){
    		   var active = pageNum == i ? "active" : '';
    		   
    		   str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
    	   }
    	   if(next){
    		   str += "<li class='page-item'><a class='page-link' href='"+(endNum +1)+"'>Next</a></li>";
    	   }
    	   str += "</ul></div>";
    	   
    	   
    	   replyPageFooter.html(str);
       }
                  
       replyPageFooter.on('click',"li a", function(e){
    	   e.preventDefault();
    	   console.log("page click");
    	   
    	   var targetPageNum = $(this).attr("href");
    	   
    	   console.log("targetPageNum: " + targetPageNum);
    	   
    	   pageNum = targetPageNum;
    	   showList(pageNum);
       });
       

    }); 
 </script>
 
<script type="text/javascript">
  $(document).ready(function(){
	 
	  (function(){
		  
		  var bno = '<c:out value="${board.bno}"/>';
		 
		  $.getJSON("/dash/getAttachList", {bno : bno}, function(arr){
			  
			  console.log(arr);
			  	   
			  var str = "";
			  
			  $(arr).each(function(i,attach){
				     
				    if(attach.fileType){
				    	
				     var fileCallPath =  encodeURIComponent( attach.uploadPath + "/s_"+ attach.uuid +"_"+ attach.fileName);
					 //파일의 절대경로를 가져옴.
					 str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'> <div>";
					 str += "<img src='/display?fileName="+fileCallPath+"'>";
					 str += "</div>";
					 str += "</li>";
				    } else {
					 
					 str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'> <div>";
					 str += "<span>" +attach.fileName+ "</span><br/>";
					 str += "<img src='/resources/img/attach.png'>";
					 str += "</div>";
					 str += "</li>";
				 
				    }				 
			  });
			  
			  $(".uploadResult ul").html(str);			
			  
		  }); //get Json end
	  })(); //end function
	  
	  $(".uploadResult").on("click","li", function(e){
		      
			    console.log("view image");
			    
			    var liObj = $(this);
			    
			    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
			    
			    self.location ="/download?fileName="+path
			   
	  });
	  
	/*  function showImage(fileCallPath){
		    
		   var modal = $(".modal");
		  
		    //alert(fileCallPath);
		    
		    $(".modal").css("display","flex").show();
		    
		    $(".modal-body")
		    .html("<img src='/display?fileName="+fileCallPath+"' >")
		    .animate({width:'100%', height: '100%'}, 1000);
		    modal.find("button[id != 'modalModifyBtn']").hide();
		    modal.find("button[id != 'modalRemoveBtn']").hide();
		    $(".modal").modal("show");
	  }
	  $(".modal").on("click", function(e){
		    $(".modal-body").animate({width:'0%', height: '0%'}, 1000);
		    setTimeout(function(){
		      $('.modal').hide();
		    }, 1000);
		  });

		  $(".modal").on("click", function(e){
			    $(".modal-body").animate({width:'0%', height: '0%'}, 1000);
			    setTimeout(function(){
			      $('.modal-body').hide();
			    }, 1000);
			  });*/
	//bigPictureWrapper 클래스가 동작을 안함.... 대체 방안 강구전까지 봉인.		  
	  
  });
</script>
</body>
</html>