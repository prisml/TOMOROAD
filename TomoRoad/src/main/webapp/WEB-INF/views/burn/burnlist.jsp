<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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

<script type="text/javascript">
	$(document).ready(function(){
		$("#st").change(function(){						
				$.ajax({
					type : "get",
					url : "${pageContext.request.contextPath}/getBurnListByStationAjax.do",
					dataType : "json",
					data : "stationName="+$("#st :selected").val(),
					success : function(data){						
						 var list="";
						 list += "<table class='table table-hover'>";
						 list += "<tr>";
						 list += "<th>번호</th> <th colspan='11'>제목</th><th>역이름</th><th>작성자</th> <th>작성시간</th><th>조회수</th>";
						 list += "</tr>";
						 
						 for(var i=0; i<data.list.length; i++){	
							list += "<tr align='center'>";
							list += "<td>"+data.list[i].no+"</td><td colspan='11'>"+data.list[i].title+"("+data.list[i].commentCount+")</td><td>"+data.list[i].stationName+"</td><td><a href='#.'>"+data.list[i].memberId+"</a></td>";
							list += "<td>"+data.list[i].postedTime+"</td><td>"+data.list[i].hits+"</td>";
							list += "</tr>";
													
							} // for
						 list += "</table>";	
						 $("#output").empty();
						 $("#output").html(list);  
					} //success
				}); // ajax
		}); // change		
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
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　


<div class="row"> 
	<div class="col-md-4">
		<a href="#" class="btn btn-small btn-default" id="write">글쓰기</a>
	</div> 
	<div class="col-md-4 col-md-offset-4">
	역별로 게시물 보기 
	<select class="col-sm-4 form-control" name=stationName id="st">
	<option value="">전체보기</option><c:forEach items="${station}" var="sname"><option name="${name}">${sname}</option></c:forEach>
	</select>
	</div> 
</div>

<br>
<div id="output">
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
	<td><a href="${pageContext.request.contextPath}/member/memberpage.do?id=${mvo.id}&selectId=${burn.memberId}">${burn.memberId}</a></td>
	
	<td>${burn.postedTime}</td>
	<td>${burn.hits}</td>
	</tr>
	</c:forEach>  
</table>


<div align="center">

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
			<li class="active"><a href="#.">${page}</a></li>
		</c:otherwise>
	</c:choose>
</c:forEach>
</ul>

<c:if test="${pb.nextPageGroup}">
	<a href="${pageContext.request.contextPath}/getBurnList.do?pageNo=${pb.endPageOfPageGroup+1}">
	▶
	</a>
</c:if>

</div>

</div>