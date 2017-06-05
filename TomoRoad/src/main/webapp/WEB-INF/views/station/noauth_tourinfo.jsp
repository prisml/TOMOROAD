<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
역 정보 및 역 주변 관광지를 보여주는 페이지

<div class="col-lg-12 isotope">
	<!--begin portfolio filter -->
	<ul id="filter">
		<li data-filter="*" class="selected"><a href="#">All</a></li>
		<li data-filter=".Capital"><a href="#">수도권</a></li>
		<li data-filter=".Gwandong"><a href="#">관동 지방</a></li>
		<li data-filter=".Chungcheong"><a href="#">충청 지방</a></li>
		<li data-filter=".Honam"><a href="#">호남 지방</a></li>
		<li data-filter=".Youngnam"><a href="#">영남 지방</a></li>
	</ul>

	<!--begin portfolio_list -->
	<ul id="list" class="portfolio_list clearfix isotope" style="position: relative; overflow: hidden; height: 894.563px;">
		<!--begin List Item -->
		<li class="list_item col-lg-4 col-md-6 col-sm-6 Capital isotope-item" style="position: absolute; left: 0px; top: 0px;">
			<figure class="touching effect-bubba">
				<img src="${pageContext.request.contextPath}/resources/images/symbol/seoul.png" alt="">

				<div class="option">
					<a href="${pageContext.request.contextPath}/station/info.do" class="fa fa-link"></a>
					<a href="${pageContext.request.contextPath}/resources/images/symbol/seoul.png"	class="fa fa-search mfp-image"></a>
				</div>
				
				<figcaption>
					<h5>S e o u l</h5>
					<p>하나의 특별시,<br>
					대한민국의 중심</p>
				</figcaption>
			</figure>
		</li>

		<!--begin List Item -->
		<li class="list_item col-lg-4 col-md-6 col-sm-6 Youngnam isotope-item"  style="position: absolute; left: 380px; top: 0px;">
			<figure class="touching effect-bubba">
				<img src="${pageContext.request.contextPath}/resources/images/symbol/busan.png" alt="">

				<div class="option">
					<a href="portfolio_single.html" class="fa fa-link"></a>
					<a href="${pageContext.request.contextPath}/resources/images/symbol/busan.png" class="fa fa-search mfp-image"></a>
				</div>
				
				<figcaption>
					<h5>B u s a n</h5>
					<p> 제2의 도시, 부산</p>
				</figcaption>
				
			</figure>
		</li>

		<!--begin List Item -->
		<li	class="list_item col-lg-4 col-md-6 col-sm-6 Youngnam isotope-item" style="position: absolute; left: 760px; top: 0px;">
			<figure class="touching effect-bubba">
				<img src="${pageContext.request.contextPath}/resources/images/symbol/daegu.png" alt="">

				<div class="option">
					<a href="portfolio_single.html" class="fa fa-link"></a>
					<a href="${pageContext.request.contextPath}/resources/images/symbol/daegu.png"	class="fa fa-search mfp-image"></a>
				</div>
				
				<figcaption>
					<h5>D a e g u</h5>
					<p>다채로운 도시, 대구</p>
				</figcaption>
			</figure>
		</li>

		<!--begin List Item -->
		<li class="list_item col-lg-4 col-md-6 col-sm-6 Youngnam isotope-item" style="position: absolute; left: 0px; top: 298px;">
			<figure class="touching effect-bubba">
				<img src="${pageContext.request.contextPath}/resources/images/symbol/ulsan.png" alt="">

				<div class="option">
                                    <a href="portfolio_single.html" class="fa fa-link"></a>
                                    <a href="${pageContext.request.contextPath}/resources/images/symbol/ulsan.png" class="fa fa-search mfp-image"></a>
                                </div>
				<figcaption>
					<h5>U l s a n</h5>
					<p>창조도시, 울산</p>
				</figcaption>
			</figure>
		</li>

		<!--begin List Item -->
		<li class="list_item col-lg-4 col-md-6 col-sm-6 Honam isotope-item" style="position: absolute; left: 380px; top: 298px;">
			<figure class="touching effect-bubba">
				<img src="${pageContext.request.contextPath}/resources/images/symbol/gwangju.png" alt="">

				<div class="option">
					<a href="portfolio_single.html" class="fa fa-link"></a>
					<a href="${pageContext.request.contextPath}/resources/images/symbol/gwangju.png" class="fa fa-search mfp-image"></a>
				</div>
				
				<figcaption>
					<h5>G w a n g J u</h5>
					<p>민주주의 횃불을 밝힌 도시, 광주</p>
				</figcaption>
			</figure>
		</li>

		<!--begin List Item -->
		<li class="list_item col-lg-4 col-md-6 col-sm-6 Chungcheong isotope-item" style="position: absolute; left: 760px; top: 298px;">
			<figure class="touching effect-bubba">
				<img src="${pageContext.request.contextPath}/resources/images/symbol/daejeon.png" alt="">

				<div class="option">
					<a href="portfolio_single.html" class="fa fa-link"></a>
					<a href="${pageContext.request.contextPath}/resources/images/symbol/daejeon.png"	class="fa fa-search mfp-image"></a>
				</div>
				
				<figcaption>
					<h5>Daejeon</h5>
					<p>대전</p>
				</figcaption>
			</figure>
		</li>

		<!--begin List Item -->
		<li class="list_item col-lg-4 col-md-6 col-sm-6 Honam isotope-item" style="position: absolute; left: 0px; top: 596px;">
			<figure class="touching effect-bubba">
				<img src="${pageContext.request.contextPath}/resources/images/symbol/yeosu.jpg" alt="">

				<div class="option">
					<a href="portfolio_single.html" class="fa fa-link"></a>
					<a href="${pageContext.request.contextPath}/resources/images/symbol/yeosu.jpg"	class="fa fa-search mfp-image"></a>
				</div>
				
				<figcaption>
					<h5>YEOSU</h5>
					<p>여수</p>
				</figcaption>
			</figure>
		</li>

		<!--begin List Item -->
		<li class="list_item col-lg-4 col-md-6 col-sm-6 Gwandong isotope-item" style="position: absolute; left: 380px; top: 596px;">
			<figure class="touching effect-bubba">
				<img src="${pageContext.request.contextPath}/resources/images/symbol/donghae.png" alt="">

				<div class="option">
					<a href="portfolio_single.html" class="fa fa-link"></a>
					<a href="${pageContext.request.contextPath}/resources/images/symbol/donghae.png"	class="fa fa-search mfp-image"></a>
				</div>
				
				<figcaption>
					<h5>DongHAE</h5>
					<p>해볼 땐 동해가 최고</p>
				</figcaption>
			</figure>
		</li>

		<!--begin List Item -->
		<li class="list_item col-lg-4 col-md-6 col-sm-6 Youngnam isotope-item" style="position: absolute; left: 760px; top: 596px;">
			<figure class="touching effect-bubba">
				<img src="${pageContext.request.contextPath}/resources/images/symbol/gumi.png" alt="">

				<div class="option">
					<a href="portfolio_single.html" class="fa fa-link"></a>
					<a href="${pageContext.request.contextPath}/resources/images/symbol/gumi.png" class="fa fa-search mfp-image"></a>
				</div>
				
				<figcaption>
					<h5>GUMI</h5>
					<p>전자도시, 구미</p>
				</figcaption>
			</figure>
		</li>
		
	</ul>
</div>