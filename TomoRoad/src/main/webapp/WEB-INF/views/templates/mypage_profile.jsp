<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var flag = false;
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
		flag = true;
	}
	
	function fileupload(){
		if(flag == true){
			$("#profileUpload").submit();
		}else{
			alert("변경할 프로필을 선택하세요");
			return false;
		}
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
	<input style = "color:#333;background-color:#fff;border-color:#8c8c8c;" class="btn" type = "button" onclick = "fileupload()" value = "변경">
	<input style = "color:#333;background-color:#fff;border-color:#8c8c8c;" class="btn" type = "button" onclick = "resetprile()" value = "기본이미지로 변경">
</form>