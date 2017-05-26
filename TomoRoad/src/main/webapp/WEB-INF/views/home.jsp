<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	function layer_open(test) {
		$("#station").text(
				document.getElementById(test.getAttribute('id')).getAttribute(
						'id')
						+ "역");
		var temp = $('#layer1'); //레이어의 id를 temp변수에 저장
		var bg = temp.prev().hasClass('bg'); //dimmed 레이어를 감지하기 위한 boolean 변수
		if (bg) {
			$('.layer').fadeIn();
		} else {
			temp.fadeIn(); //bg 클래스가 없으면 일반레이어로 실행한다.
		}
		// 화면의 중앙에 레이어를 띄운다.
		if (temp.outerHeight() < $(document).height())
			temp.css('margin-top', '-' + temp.outerHeight() / 2 + 'px');
		else
			temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width())
			temp.css('margin-left', '-' + temp.outerWidth() / 2 + 'px');
		else
			temp.css('left', '0px');
		temp.find('a.cbtn').click(function(e) {
			if (bg) {
				$('.layer').fadeOut();
			} else {
				temp.fadeOut(); //'닫기'버튼을 클릭하면 레이어가 사라진다.
			}
			e.preventDefault();
		});
		$('.layer .bg').click(function(e) {
			$('.layer').fadeOut();
			e.preventDefault();
		});
	}
</script>
<style type="text/css">
.pop-layer {
	display: none;
	position: absolute;
	top: 50%;
	left: 50%;
	height: auto;
	z-index: 10;
}

.pop-layer .btn-r {
	width: 100%;
	margin: 10px 0 20px;
	padding-top: 10px;
	border-top: 1px solid #DDD;
	text-align: right;
}

a.cbtn {
	display: inline-block;
}

#exam {
	display: block;
	float: left;
}
</style>
<div>
	<div style="position: absolute;">
		<img src="${pageContext.request.contextPath}/resources/img/map.png">
	</div>
	<div style="position: absolute;">
		<div style="position: absolute; top: 289px; left: 238px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="서울">
		</div>
		<div style="position: absolute; top: 305px; left: 238px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="용산">
		</div>
		<div style="position: absolute; top: 398px; left: 250px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="수원">
		</div>
		<div style="position: absolute; top: 215px; left: 377px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="가평">
		</div>
		<div style="position: absolute; top: 184px; left: 176px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="도라산">
		</div>
		<div style="position: absolute; top: 497px; left: 605px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="단양">
		</div>
		<div style="position: absolute; top: 447px; left: 575px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="제천">
		</div>
		<div style="position: absolute; top: 762px; left: 268px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="논산">
		</div>
		<div style="position: absolute; top: 887px; left: 295px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="전주">
		</div>
		<div style="position: absolute; top: 837px; left: 187px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="군산">
		</div>
		<div style="position: absolute; top: 851px; left: 230px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="익산">
		</div>
		<div style="position: absolute; top: 1189px; left: 384px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="순천">
		</div>
		<div style="position: absolute; top: 1254px; left: 456px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="여수">
		</div>
		<div style="position: absolute; top: 1236px; left: 75px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="목포">
		</div>
		<div style="position: absolute; top: 1152px; left: 166px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="나주">
		</div>
		<div style="position: absolute; top: 1246px; left: 269px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="보성">
		</div>
		<div style="position: absolute; top: 1076px; left: 334px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="곡성">
		</div>
		<div style="position: absolute; top: 186px; left: 437px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="춘천">
		</div>
		<div style="position: absolute; top: 251px; left: 792px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="정동진">
		</div>
		<div style="position: absolute; top: 311px; left: 819px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="동해">
		</div>
		<div style="position: absolute; top: 361px; left: 697px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="정선">
		</div>
		<div style="position: absolute; top: 429px; left: 779px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="태백">
		</div>
		<div style="position: absolute; top: 211px; left: 759px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="강릉">
		</div>
		<div style="position: absolute; top: 637px; left: 714px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="안동">
		</div>
		<div style="position: absolute; top: 808px; left: 881px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="포항">
		</div>
		<div style="position: absolute; top: 884px; left: 861px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="경주">
		</div>
		<div style="position: absolute; top: 995px; left: 730px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="밀양">
		</div>
		<div style="position: absolute; top: 1086px; left: 675px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="마산">
		</div>
		<div style="position: absolute; top: 1108px; left: 546px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="진주">
		</div>
		<div style="position: absolute; top: 1109px; left: 232px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="광주">
		</div>
		<div style="position: absolute; top: 722px; left: 360px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="대전">
		</div>
		<div style="position: absolute; top: 1132px; left: 808px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="부산">
		</div>
		<div style="position: absolute; top: 863px; left: 671px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="대구">
		</div>
	</div>
</div>
<div class="pop-layer" id="layer1">
	<div class="pop-container">
		<div class="pop-conts">
			<!--content //-->
			<div>
					<p style="font-size: 25" align="center" id="station">
					<a href="#"><img id="exam" src="${pageContext.request.contextPath}/resources/img/1-1.png"></a>
					<a href="#"><img id="exam" src="${pageContext.request.contextPath}/resources/img/2.jpg"></a>
					<a href="#"><img src="${pageContext.request.contextPath}/resources/img/3-1.png"></a>
			</div>
			<div>
				<a href="#"><img id="exam" src="${pageContext.request.contextPath}/resources/img/4-1.png"></a>
				<a href="#"><img id="exam" src="${pageContext.request.contextPath}/resources/img/5.jpg"></a>
				<a class="cbtn" href="#"><img src="${pageContext.request.contextPath}/resources/img/6-1.png"></a>
			</div>
		</div>
	</div>
</div>