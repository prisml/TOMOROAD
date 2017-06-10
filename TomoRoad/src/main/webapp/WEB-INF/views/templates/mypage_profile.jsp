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
<input style="
border-radius: 7px;
-moz-border-radius: 7px;
-khtml-border-radius: 7px;
-webkit-border-radius: 7px;
" type = "image" width="200" height="200" src = "${profile}" id = "blah" onclick = "upload()"><br>
<form id = "profileUpload" enctype ="multipart/form-data" action="${pageContext.request.contextPath}/profileFileUpload.do" method="post">
<input type = "file"  style="display:none" name = "uploadfile" id = "file">
<input style = color:black; class="btn btn-default" type = "button" onclick = "fileupload()" value = "변경">
<input style = color:black; class="btn btn-default" type = "button" onclick = "resetprile()" value = "기본이미지로 변경">
</form>