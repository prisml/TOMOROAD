<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<script>
	$(document).ready(function(){
		$("#write").click(function(){
			if(${empty mvo}){
				alert("로그인을 해주세요");
				return false;
			}
			location.href="${pageContext.request.contextPath}/writeBurnForm.do";
		});
		
		$(".show").click(function(){
			var selectId = $(this).text();
			var myId = "${sessionScope.mvo.id}";
			if(selectId==myId){
				return false;
			}
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/getFriendId.do",				
				data:"id=${sessionScope.mvo.id}&selectId="+selectId,				  
				success:function(result){
					if(result!=""){
						$(".popcon").empty();
						$(".popcon").html("<li><a href='#'>리뷰 모아보기</a></li>");					
					}else{
						$(".popcon").empty();
						$(".popcon").html("<li><a href='#'>리뷰 모아보기</a></li><li><a href='#'>친구신청</a></li>");
					}
				}
			})						
			
			$(this).next().toggle();
		});
	});
</script>

<style>
th {
	text-align : center;
}
input {
	margin: 10px;
	
}
</style>　　　　　　　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
<a href="#" class="btn btn-small btn-default" id="write">글쓰기</a>

<br><br>
<table class="table table-hover" >
  <tr>
    <th>번호</th>
    <th colspan="11">제목</th>
    <th>역이름</th>
    <th>작성자</th>
    <th>작성시간</th>
    <th>조회수</th>
  </tr>
  <c:forEach items="${lvo.list}" var="burn">
  	<tr align="center">
	<td>${burn.no}</td>
	<td  colspan="11"><a href="${pageContext.request.contextPath}/showBurnDetail.do?no=${burn.no}">${burn.title} (${burn.commentCount})</a></td>
	<td>${burn.stationName}</td>
	<td style="position: relative;"><a href="#" class="show">${burn.memberId}</a>
	<span class="pop" style="background-color:pink; display: none; position: absolute; width: 109px; z-index: 1000; bottom:-30px; right:30;">
    <ul class="popcon">
      <li><a href="#">리뷰 모아보기</a></li>
      <li><a href="#">친구신청</a></li>      
    </ul>
  	</span>
  	</td>
	
	<td>${burn.postedTime}</td>
	<td>${burn.hits}</td>
	</tr>
	</c:forEach>  
</table>


<center>

<c:set value="${lvo.pagingBean}" var="pb"/>

<c:if test="${pb.previousPageGroup}">
	<a href="${pageContext.request.contextPath}/getBurnList.do?pageNo=${pb.startPageOfPageGroup-1}">
	◀
	</a>
</c:if>
<ul class="pagination">

<c:forEach begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}" var="page">
	<c:choose>
		<c:when test="${pb.nowPage!=page}">
			<li><a href="${pageContext.request.contextPath}/getBurnList.do?pageNo=${page}">${page}</a></li> 
		</c:when>
		<c:otherwise>
			<li class="active"><a href="#">${page}</a></li>
		</c:otherwise>
	</c:choose>
</c:forEach>
</ul>

<c:if test="${pb.nextPageGroup}">
	<a href="${pageContext.request.contextPath}/getBurnList.do?pageNo=${pb.endPageOfPageGroup+1}">
	▶
	</a>
</c:if>

</center>


