<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function(){
		var fileTarget = $('.filebox .upload-hidden'); 
		fileTarget.on('change', function(){ // 값이 변경되면 
			if(window.FileReader){ // modern browser 
				var filename = $(this)[0].files[0].name; 
			} else { // old IE 
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			} // 추출한 파일명 삽입 
			$(this).siblings('.upload-name').val(filename); 
		});
		$("#addPicture").click(function(){
			var count = $("#fileDiv > input").size();
			var temp = '<input name="files['+count;
			temp+=']" class="form-control"';
			temp+='maxlength="100" data-msg-required="Please input your picture."';
			temp+='value="" placeholder="사진등록" type="file">';
			$("#fileDiv").append(temp);
		});
		$(".star_rating a").click(function() {
		    $(this).parent().children("a").removeClass("on");
		    $(this).addClass("on").prevAll("a").addClass("on");
		    $("#star").val($(".on").length);
		    return false;
		});
		$("#stationName").change(function(){
			var name = "name="+$(this).val();
			$.ajax({
				type : "GET",
				url : "getPlaceList.do",
				data : name,
				success : function(data) {
					$("select[name='placeNo'] option").remove();
					for(var i=0;i<data.length;i++){
						$("<option></option>")
						  .attr("selected", "selected")
						  .text(data[i].name)
						  .attr("value", data[i].no)
						  .appendTo("select[name='placeNo']");
					}
				}
			});
		});
		var name = "name="+$("#stationName").val();
		$.ajax({
			type : "GET",
			url : "getPlaceList.do",
			data : name,
			success : function(data) {
				for(var i=0;i<data.length;i++){
					$("<option></option>")
					  .attr("selected", "selected")
					  .text(data[i].name)
					  .attr("value", data[i].no)
					  .appendTo("select[name='placeNo']");
				}
			}
		});
	});
</script>
<div class="col-lg-8 col-md-8 col-sm-8">
	<div class="dividerHeading">
		<h4>
			<span>글 쓰기</span>
		</h4>
	</div>

	<!-- <div class="alert alert-success hidden alert-dismissable"
		id="contactSuccess">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true">×</button>
		<strong>Success!</strong> Your message has been sent to us.
	</div>

	<div class="alert alert-error hidden" id="contactError">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true">×</button>
		<strong>Error!</strong> There was an error sending your message.
	</div> -->

	<form method="post" id="contactForm" enctype="multipart/form-data"
		action="${pageContext.request.contextPath}/review/register.do"
		novalidate="novalidate">
		<div class="row">
			<div class="form-group">
				<div class="col-lg-6 ">
					<input id="name" name="title" class="form-control" maxlength="100"
						data-msg-required="Please enter title." value=""
						placeholder="Title" type="text" required="required">
				</div>
				<div class="col-lg-3 ">
					<select id="stationName" name="stationName" class="review-selete-box">
						<c:forEach items="${stationList}" var="svo">
							<option value="${svo.name }">${svo.name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-lg-3 ">
					<select id="placeNo" name="placeNo" class="review-selete-box">
						<%-- <c:forEach items="${placeList}" var="pvo">
							<option value="${pvo.name }">${pvo.name }</option>
						</c:forEach> --%>
					</select>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="filebox col-md-6" id="fileDiv">
					<input class="upload-name" value="파일선택" disabled="disabled"> 
					<label for="ex_filename">업로드</label> 
					<input name="files[0]" class="upload-hidden" id="ex_filename"
						maxlength="100" data-msg-required="Please input your picture."
						value="" placeholder="사진등록" type="file">
				</div>
				<div class="col-md-2">
					<!-- <input id="addPicture" class="btn btn-default btn-lg"
					value="사진추가" type="button"> -->
				</div>
				<div class="col-md-4">
					<input id="star" name="star" value="5" type="hidden">
					<p class="star_rating">
					    <a href="#." class="on">★</a>
					    <a href="#." class="on">★</a>
					    <a href="#." class="on">★</a>
					    <a href="#." class="on">★</a>
					    <a href="#." class="on">★</a>
					</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-md-12">
					<textarea id="message" class="form-control" name="content"
						rows="10" cols="50" data-msg-required="Please enter your content."
						maxlength="5000" placeholder="Content" required="required"></textarea>

				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<input data-loading-text="Loading..." class="btn btn-default btn-lg"
					value="일지 작성" type="submit" onsubmit="starCount()">
			</div>
		</div>
	</form>
</div>
<div class="col-lg-4 col-md-4 col-sm-4">
	<div class="sidebar">
		<div class="widget_info">
			<div class="dividerHeading">
				<h4>
					<span>Info</span>
				</h4>
			</div>
			<p>방문한 역을 선택하세요. 역을 선택하시면 해당 역의 관광지 정보가 오른쪽에 생기게 됩니다.
			방문한 관광지를 선택하신 후 리뷰를 작성해 주세요. 방문한 관광지의 사진을 찍어보세요!
			 나만의 추억이 담긴 사진을 등록할 수 있습니다. </p>
			<ul class="widget_info_contact">
				<li><i class="fa fa-map-marker"></i>
					<p>
						<strong>Address</strong>: 오리역 3번출구
					</p></li>
				<li><i class="fa fa-user"></i>
					<p>
						<strong>Phone</strong>:010-2369-4284
					</p></li>
				<li><i class="fa fa-envelope"></i>
					<p>
						<strong>Email</strong>: <a href="#">prisml091292@gmail.com</a>
					</p></li>
				<li><i class="fa fa-globe"></i>
					<p>
						<strong>Web</strong>: <a href="#" data-placement="bottom"
							data-toggle="tooltip" title="www.example.com">www.example.com</a>
					</p></li>
			</ul>

		</div>

		<div class="widget_social">
			<div class="dividerHeading">
				<h4>
					<span>Get Social</span>
				</h4>
			</div>
			<ul class="widget_social">
				<li><a class="fb" href="#." data-placement="bottom"
					data-toggle="tooltip" title="Facbook"><i class="fa fa-facebook"></i></a></li>
				<li><a class="twtr" href="#." data-placement="bottom"
					data-toggle="tooltip" title="Twitter"><i class="fa fa-twitter"></i></a></li>
				<li><a class="gmail" href="#." data-placement="bottom"
					data-toggle="tooltip" title="Google"><i
						class="fa fa-google-plus"></i></a></li>
				<li><a class="dribbble" href="#." data-placement="bottom"
					data-toggle="tooltip" title="Dribbble"><i
						class="fa fa-dribbble"></i></a></li>
				<li><a class="skype" href="#." data-placement="bottom"
					data-toggle="tooltip" title="Skype"><i class="fa fa-skype"></i></a></li>
				<li><a class="pinterest" href="#." data-placement="bottom"
					data-toggle="tooltip" title="Pinterest"><i
						class="fa fa-pinterest"></i></a></li>
				<li><a class="instagram" href="#." data-placement="bottom"
					data-toggle="tooltip" title="Instagram"><i
						class="fa fa-instagram"></i></a></li>
				<li><a class="youtube" href="#." data-placement="bottom"
					data-toggle="tooltip" title="Youtube"><i class="fa fa-youtube"></i></a></li>
				<li><a class="linkedin" href="#." data-placement="bottom"
					data-toggle="tooltip" title="Linkedin"><i
						class="fa fa-linkedin"></i></a></li>
				<li><a class="flickrs" href="#." data-placement="bottom"
					data-toggle="tooltip" title="Flickr"><i class="fa fa-flickr"></i></a></li>
				<li><a class="rss" href="#." data-placement="bottom"
					data-toggle="tooltip" title="RSS"><i class="fa fa-rss"></i></a></li>
			</ul>
		</div>
	</div>
</div>