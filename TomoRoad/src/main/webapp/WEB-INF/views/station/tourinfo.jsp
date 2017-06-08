<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

역 정보 및 역 주변 관광지를 보여주는 페이지

<script>
$( function() {
	//자동완성
	$( "#searchkeyword" ).autocomplete({
		source : function( request, response){
			//alert(reviewFilter);
			$.ajax({
				url: "${pageContext.request.contextPath}/station/getKeyword.do",
				dataType:"json",
				data:"keyword="+request.term, //사용자가 최근 입력한 단어를 보냄
				success: function(data){
					response(data);
				}//success
			});//ajax
		}//source:function
	}); //autocomplete
});

function keywordSearch() {
    	alert("에러");
    if ($("#searchkeyword").val()=="") {
		return false;
    } else {
    	$("#hiddenName").val($("#searchkeyword").val());
    	alert($("#hiddenName").val());
		$("#keywordSearchForm").submit();
    }
}
</script>

<form id="keywordSearchForm" action="${pageContext.request.contextPath}/station/getDetailInfo.do">
	<div class="ui-widget">
		<label for="searchkeyword"><img src="${pageContext.request.contextPath}/resources/images/SearchIcon.png" style="width:20px; height:20px;"></label>
		<input id="searchkeyword" name="name" type="text">
		<!-- <input id="hiddenName" type="hidden" value=""> -->
		<input type="submit" onsubmit="return keywordSearch()" style="display:none;">
		<!-- <input type="submit" onsubmit="return keywordSearch()" value="검색"> -->
	</div>
</form>

<div class="col-lg-12 isotope">
	<!--검색 필터 -->
	<ul id="filter">
		<li data-filter="*" class="selected"><a href="#">All</a></li>
		<li data-filter=".Capital"><a href="#">수도권</a></li>
		<li data-filter=".Gwandong"><a href="#">관동 지방</a></li>
		<li data-filter=".Chungcheong"><a href="#">충청 지방</a></li>
		<li data-filter=".Honam"><a href="#">호남 지방</a></li>
		<li data-filter=".Youngnam"><a href="#">영남 지방</a></li>
	</ul>

	<!--지역 목록 -->
	<ul id="list" class="portfolio_list clearfix isotope" style="position: relative; overflow: hidden; height: 894.563px;">
	 	<c:forEach items="${getTourInfoList}" var="vo">
			<!--begin List Item -->
			<li class="list_item col-lg-4 col-md-6 col-sm-6 ${vo.section} isotope-item" style="">
				<figure class="touching effect-bubba">
					<img src="${pageContext.request.contextPath}/resources/images/symbol/${vo.img}.png" alt="">
	
					<div class="option">
						<a href="${pageContext.request.contextPath}/station/getDetailInfo.do?name=${vo.name}" class="fa fa-link"></a>
					</div>
					
					<figcaption>
						<h5>${vo.name}</h5>
						<p>${vo.simpleDetail}</p>
					</figcaption>
				</figure>
			</li>
		</c:forEach>
	</ul>
</div>