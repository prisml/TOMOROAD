<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	var stationInfo; // 역이름 정보

	var img; // 역 아이콘 이미지경로

	// 레이어팝업 영역 이외 클릭시 레이어팝업 닫기
	$(document)
			.ready(
					function() {
						$(document)
								.mousedown(
										function(e) {
											$('#layer1')
													.each(
															function() {
																if ($(this)
																		.css(
																				'display') == 'block') {
																	var l_position = $(
																			this)
																			.offset();
																	l_position.right = parseInt(l_position.left)
																			+ ($(this)
																					.width());
																	l_position.bottom = parseInt(l_position.top)
																			+ parseInt($(
																					this)
																					.height());
																	if ((l_position.left <= e.pageX && e.pageX <= l_position.right)
																			&& (l_position.top <= e.pageY && e.pageY <= l_position.bottom)) {
																	} else {
																		$(this)
																				.fadeOut(
																						"fast");
																	}
																}
															});
										});
					})

	// 레이어팝업 열기
	function layer_open(test) {
		img = document.getElementById(document.getElementById(
				test.getAttribute('id')).getAttribute('id'));

		$("#station").text(
				document.getElementById(test.getAttribute('id')).getAttribute(
						'id')
						+ "역"); // 레이어팝업 역이름

		stationInfo = document.getElementById(test.getAttribute('id'))
				.getAttribute('id'); // 역이름 정보

		var obj = $(
				"#"
						+ document.getElementById(test.getAttribute('id'))
								.getAttribute('id')).offset(); // 클릭한 아이콘 좌표정보

		var temp = $('#layer1'); //레이어의 id를 temp변수에 저장

		var bg = temp.prev().hasClass('bg'); //dimmed 레이어를 감지하기 위한 boolean 변수

		var divTop = obj.top - 110; //상단 좌표

		var divLeft; // 좌측 좌표

		// 좌측 좌표가 일정수치를 넘으면 레이어팝업이 깨지므로 일정수치가 넘을 경우 레이어팝업이 우측이 아닌 좌측에 뜨도록
		if (obj.left > 850) {
			divLeft = obj.left - 290;
		} else {
			divLeft = obj.left - 90;
		}

		if (bg) {
			$('.layer').fadeIn();
		} else {
			temp.fadeIn(); //bg 클래스가 없으면 일반레이어로 실행한다.
		}

		temp.css("left", divLeft + "px");
		temp.css("top", divTop + "px");

		// 닫기버튼 클릭시
		temp.find('a.cbtn').click(function(e) {
			if (bg) {
				$('.layer').fadeOut();
			} else {
				temp.fadeOut(); //'닫기'버튼을 클릭하면 레이어가 사라진다.
			}
			e.prthisDefault();
		});
	}

	// 레이어팝업 기능
	function move(flag) {
		if (flag == "f") {
			$("#layer1").fadeOut();
		} else if (flag == "a") {
			if (img.src == "http://localhost:8888/tomoroad/resources/img/1.png") {
				img.src = "${pageContext.request.contextPath}/resources/img/22.png";
				$("#layer1").fadeOut();
			} else {
				img.src = "${pageContext.request.contextPath}/resources/img/1.png";
				$("#layer1").fadeOut();
			}
		} else if (flag == "b") {
			location.href = "getStationInfo.do?id=" + stationInfo;
		} else if (flag == "d") {
			location.href = "${pageContext.request.contextPath}/getBurnListByStation.do?pageNo=1&stationName="
					+ stationInfo + "역";
		}

		else {
			alert(stationInfo);
		}
	}
</script>
<style type="text/css">
.pop-layer {
	display: none;
	position: absolute;
	top: 50%;
	left: 50%;
	height: auto; /*  background-color:#fff; */
	/* border: 5px solid #3571B5; */
	z-index: 10;
}
/* .pop-layer .pop-container {padding: 20px 25px;}
.pop-layer p.ctxt {color: #666; line-height: 25px;} */
.pop-layer .btn-r {
	width: 100%;
	margin: 10px 0 20px;
	padding-top: 10px;
	border-top: 1px solid #DDD;
	text-align: right;
}

a.cbtn {
	display: inline-block;
	/* height:25px; padding:0 14px 0; border:1px solid #304a8a; background-color:#3f5a9d; font-size:13px; color:#fff; line-height:25px; */
}
/* a.cbtn:hover {border: 1px solid #091940; background-color:#1f326a; color:#fff;} */
#exam {
	display: block;
	float: left;
}
</style>
<!-- <div style="width:500px; height:700px;"></div> -->
		<!-- 해당 역 아이콘 -->
		<%-- <div style="position: absolute; top: 289px; left: 238px;"><input type="image" src="${pageContext.request.contextPath}/resources/img/1.png" onclick="layer_open(this);return false;" id="서울"></div> --%>
		<div style="position: absolute; top: 379px; left: 262px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="서울">
		</div>

		<div style="position: absolute; top: 395px; left: 262px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="용산">
		</div>
		<div style="position: absolute; top: 490px; left: 275px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="수원">
		</div>
		<div style="position: absolute; top: 302px; left: 406px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="가평">
		</div>

		<!-- 
		<div style="position: absolute; top: 265px; left: 205px;">
		<input type="image"
			src="${pageContext.request.contextPath}/resources/img/1.png"
			onclick="layer_open(this);return false;" id="도라산">
		</div>
	 -->
		<div style="position: absolute; top: 270px; left: 198px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="도라산">
		</div>
		<div style="position: absolute; top: 590px; left: 644px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="단양">
		</div>
		<div style="position: absolute; top: 542px; left: 612px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="제천">
		</div>
		<div style="position: absolute; top: 863px; left: 293px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="논산">
		</div>
		<div style="position: absolute; top: 993px; left: 320px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="전주">
		</div>
		<div style="position: absolute; top: 943px; left: 208px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="군산">
		</div>
		<div style="position: absolute; top: 958px; left: 254px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="익산">
		</div>
		<div style="position: absolute; top: 1302px; left: 413px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="순천">
		</div>
		<div style="position: absolute; top: 1370px; left: 488px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="여수">
		</div>
		<div style="position: absolute; top: 1351px; left: 93px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="목포">
		</div>
		<div style="position: absolute; top: 1266px; left: 188px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="나주">
		</div>
		<div style="position: absolute; top: 1363px; left: 295px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="보성">
		</div>
		<div style="position: absolute; top: 1187px; left: 362px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="곡성">
		</div>
		<div style="position: absolute; top: 271px; left: 467px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="춘천">
		</div>
		<div style="position: absolute; top: 339px; left: 835px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="정동진">
		</div>
		<div style="position: absolute; top: 400px; left: 863px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="동해">
		</div>
		<div style="position: absolute; top: 453px; left: 738px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="정선">
		</div>
		<div style="position: absolute; top: 523px; left: 823px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="태백">
		</div>
		<div style="position: absolute; top: 318px; left: 802px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="강릉">
		</div>
		<div style="position: absolute; top: 737px; left: 756px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="안동">
		</div>
		<div style="position: absolute; top: 913px; left: 928px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="포항">
		</div>
		<div style="position: absolute; top: 990px; left: 907px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="경주">
		</div>
		<div style="position: absolute; top: 1104px; left: 772px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="밀양">
		</div>
		<div style="position: absolute; top: 1198px; left: 715px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="마산">
		</div>
		<div style="position: absolute; top: 1221px; left: 582px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="진주">
		</div>
		<div style="position: absolute; top: 1220px; left: 255px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="광주">
		</div>
		<div style="position: absolute; top: 823px; left: 389px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="대전">
		</div>
		<div style="position: absolute; top: 1246px; left: 853px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="부산">
		</div>
		<div style="position: absolute; top: 968px; left: 710px;">
			<input type="image"
				src="${pageContext.request.contextPath}/resources/img/1.png"
				onclick="layer_open(this);return false;" id="대구">
		</div>
		<img src="${pageContext.request.contextPath}/resources/img/map.png">
	</div>
	<!-- 레이어팝업 -->
	<div class="pop-layer" id="layer1">
		<div class="pop-container">
			<div class="pop-conts">
				<div>
					<!-- 역이름 -->
					<p style="font-size: 40" align="center" id="station"></p>
					<input type="image" id="exam"
						src="${pageContext.request.contextPath}/resources/img/1-1.png"
						onclick="return move('a')"> <input type="image" id="exam"
						src="${pageContext.request.contextPath}/resources/img/2.png"
						onclick="return move('b')"> <input type="image"
						src="${pageContext.request.contextPath}/resources/img/3-1.png"
						onclick="return move('c')">
				</div>
				<div>
					<input type="image" id="exam"
						src="${pageContext.request.contextPath}/resources/img/4-1.png"
						onclick="return move('d')"> <input type="image" id="exam"
						src="${pageContext.request.contextPath}/resources/img/5.png"
						onclick="return move('e')"> <input type="image"
						src="${pageContext.request.contextPath}/resources/img/6-1.png"
						onclick="return move('f')">
				</div>
			</div>
		</div>