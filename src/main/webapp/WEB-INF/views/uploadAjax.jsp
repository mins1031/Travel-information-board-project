<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
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

     <div class='bigPictureWrapper'>
	    <div class='bigPicture'>
	    </div>
	</div>
	     
     <h1>Upload with Ajax</h1>
        
     <div class='uploadDiv'>
         <input type='file' name='uploadFile' multiple>
     </div>
     
     <div class='uploadResult'>
        <ul>
           
        </ul>
     </div>
     
     <button id="uploadBtn">Upload</button>

     
     <script
		  src="https://code.jquery.com/jquery-3.5.1.js"
		  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		  crossorigin="anonymous">
     </script>
             
     <script>
     
     function showImage(fileCallPath){
    	 
   	     $(".bigPictureWrapper").css("display","flex").show();
    	 
    	 $(".bigPicture")
    	 .html("<img src='/display?fileName="+encodeURI(fileCallPath)+"'>")
    	 .animate({width:'100%', height: '100%'},1000);
    	 
     }
     $(".bigPictureWrapper").on("click",function(e){
		 $(".bigPicture").animate({width:'0%', height:'0%'},1000);
		 setTimeout(function() {
			 $(".bigPictureWrapper").hide();
		 }, 1000);
	 });
       $(document).ready(function(){
    	   
    	   var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
    	   var maxSize = 5242880;
    	   
    	   function checkExtension(fileName, fileSize){
    		   
    		   if(fileSize >= maxSize){
    			   alert("파일 사이즈 초과");
    			   return false;
    		   }
    	   
	    	   if(regex.test(fileName)){
	    		   alert("해당 종류의 파일은 업로드 할 수 없습니다.");
	    		   return false;
	    	   }
    	       return true;
    	   }
    	   
    	   var uploadResult = $(".uploadResult ul");
    	   
    	   function showUploadedFile(uploadResultArr){
    		   
    		   var str = "";
    		   
    		   $(uploadResultArr).each(function(i, obj){
    		     
    		     if(!obj.image){
    		       
    		       var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);
    		       
    		       var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
    		       
    		       str += "<li><div><a href='/download?fileName="+fileCallPath+"'>"+
    		           "<img src='/resources/img/attach.png'>"+obj.fileName+"</a>"+
    		           "<span data-file=\'"+fileCallPath+"\' data-type='file'> x </span>"+
    		           "<div></li>"
    		           
    		     }else{
    		       
    		       var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
    		       
    		       var originPath = obj.uploadPath+ "\\"+obj.uuid +"_"+obj.fileName;
    		       
    		       originPath = originPath.replace(new RegExp(/\\/g),"/");
    		       
    		       str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\">"+
    		              "<img src='display?fileName="+fileCallPath+"'></a>"+
    		              "<span data-file=\'"+fileCallPath+"\' data-type='image'> x </span>"+
    		              "<li>";
    		     }
    		   });
    		   
    		   uploadResult.append(str);
    		 }
    	      
    	   $(".uploadResult").on("click","span", function(e){
    		   
    			  var targetFile = $(this).data("file");
    			  var type = $(this).data("type");
    			  console.log(targetFile);
    			  
    			  $.ajax({
    			    url: '/deleteFile',
    			    data: {fileName: targetFile, type:type},
    			    dataType:'text',
    			    type: 'POST',
    			      success: function(result){
    			         alert(result);
    			       }
    			  }); //$.ajax
    			  
    			});
    	   
    	   var cloneObj = $(".uploadDiv").clone();//해당 태그의 상태를 시작하자마자 저장해놓는듯.
    	   
    	   $("#uploadBtn").on("click", function(e){ //id가 uploadBtn인 태그에 클릭 이벤트가 일어나면 function 실행
    		   var formData = new FormData(); //가상의 form태그 임 Ajax를 이용한 파일 업로드는 FormData를 이용해 필요하 파라미터를 담아서 전송하는 방식임.
    		   var inputFile = $("input[name='uploadFile']");
    		   var files = inputFile[0].files;
    		   console.log(files);
    		   
    		   for(var i = 0; i < files.length; i++){
    				
    			   if(!checkExtension(files[i].name, files[i].size)){
    				   return false;
    			   }
    			   
    			   formData.append("uploadFile", files[i]);		
    			 }
    		   
    		   $.ajax({
    				 url: '/uploadAjaxAction',
    				 processData: false,
    				 contentType: false,
    				 data: formData,
    				    type: 'POST',
    				    dataType: 'json', //result(서버에서 돌아온 데이터)의 타입을 json으로 설정
    				 success: function(result){
    				      console.log(result);
    				      showUploadedFile(result);
    				      $(".uploadDiv").html(cloneObj.html());
    				 }
    			});
    	   });
     	  
    	  
      });
     </script>        
</body>
</html>