<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
	}
	function resetprile(){
		 $('#blah').attr('src','${pageContext.request.contextPath}/resources/img/profiles/kakao.jpg');
	}
</script>
<input type = "file" style="display:none" name = "uploadfile" id = "file">
<input type = "image" width="200" height="200" src = "${profile}" id = "blah" onclick = "upload()"><br>
<input type = "button" onclick = "fileupload()" value = "변경">
<input type = "button" onclick = "resetprile()" value = "기본이미지">