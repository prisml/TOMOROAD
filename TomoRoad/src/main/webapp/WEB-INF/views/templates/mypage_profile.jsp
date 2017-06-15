<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script>
	$(function(){
  		$("#file").on('change', function(){
    		readURL(this);
		});
  	});
	
	function readURL(input) {
    	if (input.files && input.files[0]) {
    		var reader = new FileReader();
   			reader.onload = function (e) {
           		$('#blah').attr('src', e.target.result);
        	}
      		reader.readAsDataURL(input.files[0]);
    	}
	}

	function upload(){
		document.getElementById('file').click();
	}
	function fileupload(){
		$("#profileUpload").submit();
	}
	function resetprile(){
		 location.href = "${pageContext.request.contextPath}/profileReset.do";
	}
</script>
<div align="right" style="position: absolute; top: 150px; left: 165px;">
<input type= "image" class = "img-thumbnail img-responsive"  width = "50px" height="45px" src = "${pageContext.request.contextPath}/resources/images/upload.png" onclick = "upload()">
</div>
<div>
<input style="border: 1px solid #dddddd; border-radius: 5px; line-height: 1.428571429; padding: 4px;" type = "image" width="200" height="200" src = "${profile}" id = "blah" onclick = "upload()">
</div>
<form id = "profileUpload" enctype ="multipart/form-data" action="${pageContext.request.contextPath}/profileFileUpload.do" method="post">
	<input type = "file"  style="display:none" name = "uploadfile" id = "file">
	<input style = color:black; class="btn btn-default" type = "button" onclick = "fileupload()" value = "변경"> &nbsp;
	<input style = color:black; class="btn btn-default" type = "button" onclick = "resetprile()" value = "기본이미지로 변경">
</form>