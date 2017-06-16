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
}); // ready
</script>


<script type="text/javascript"> // popover
$(document).ready(function(){	
	$('[data-toggle="popover"]').popover();
	
	$(document).on("click",".AjaxPop",function(){
		$('[data-toggle="popover"]').popover(); 
	});
	
	$(document).on("click",".doVisit",function(){  // 페이지로 이동 클릭시			
		var selectId = $(":input[type=hidden]").val();			
		var myId = "${sessionScope.mvo.id}";			
		if(selectId==myId){
			if(confirm("마이페이지로 이동하시겠습니까?")){
				location.href="memberpage.do?selectId="+selectId;
			}
			return false;
			
		}else{
		$.ajax({
			type:"get",
			url:"${pageContext.request.contextPath}/getFriendId.do",				
			data:"id=${sessionScope.mvo.id}&selectId="+selectId,				  
			success:function(data){
				if(data!=""){
					if(confirm("친구입니다! "+selectId+" 님 페이지로 이동하시겠습니까?")){
						location.href="memberpage.do?selectId="+selectId;
					}	
				}else{
					if(confirm(selectId+" 님 페이지로 이동하시겠습니까?")){
						location.href="memberpage.do?selectId="+selectId;
					}
				}																	
			} // success
		}); // ajax
		}
	});	// doVisit
});

</script>


<script type="text/javascript">
$(document).ready(function(){ 
				
		$("#st").change(function(){ // 역 셀렉터 변경시
			var stSel = $("#st :selected").val();	
				$.ajax({
					type : "get",
					url : "${pageContext.request.contextPath}/getBurnListByStationAjax.do",
					dataType : "json",
					data : "stationName="+stSel,
					success : function(data){						
						// list 출력부 
						var list="";
						list += "<table class='table table-hover'>";
						list += "<tr>";
						list += "<th width='100px'>번호</th> <th>제목</th><th width='100px'>역이름</th><th width='120px'>작성자</th> <th width='200px'>작성시간</th><th width='100px'>조회수</th>";
						list += "</tr>";
												 
						for(var i=0; i<data.list.length; i++){	
							list += "<tr align='center'>";
							list += "<td>"+data.list[i].no+"</td><td style='word-break:break-all;'><a href=${pageContext.request.contextPath}/showBurnDetail.do?no="+data.list[i].no+">"+data.list[i].title+"("+data.list[i].commentCount+")</a></td><td>"+data.list[i].stationName+"</td>";
							list += "<td>";
							list += "<a href='#.' class='AjaxPop' data-html='true' data-toggle='popover' data-trigger='focus' data-content='<ul><li><a href=#. class=message>메세지 보내기</a></li><li><a href=#. class=doVisit><input type=hidden value="+data.list[i].memberId+"> 페이지로 이동</a></li></ul>'>"+data.list[i].memberId+"</a>";
							list += "</td>";		
							list += "<td>"+data.list[i].postedTime+"</td><td>"+data.list[i].hits+"</td>";
							list += "</tr>";
						} // for						
						list += "</table>";
						
						$("#listOutput").empty();						
						$("#listOutput").html(list);
						
						
						// pagingBean 출력부						
						var pb ="";
						// 이전 페이지 존재 하면 ◀
						pb += "<ul class='pagination'>";
						if(data.pagingBean.previousPageGroup){
							pb += "<li><a class='arrowBtn' id='prevBtn'><input type='hidden' value="+parseInt(data.pagingBean.startPageOfPageGroup-1)+">◀</a></li>";
						}
						// 페이지 넘버 버튼 생성
						for(var i=data.pagingBean.startPageOfPageGroup; i<data.pagingBean.endPageOfPageGroup+1; i++){					
							if(data.pagingBean.nowPage!=i){
								pb += "<li><a href='#.' class='pbtn'>"+i+"</a></li>";
							}else{
								pb += "<li class='active'><a href=#.>"+i+"</a></li>";
							}
						}
						
						if(data.pagingBean.nextPageGroup){
							pb += "<li><a class='arrowBtn' id='nextBtn'><input type='hidden' value="+parseInt(data.pagingBean.endPageOfPageGroup+1)+">▶</a></li>";						
						}
						
						pb += "</ul>";						
						
						$("#pageDiv").empty();
						$("#pageDiv").html(pb);	
						
					} //success
				}); // ajax					
		}); // change
		
		$(document).on("click",".pbtn",function(){ // Ajax 페이지 버튼 클릭시
			var stSel = $("#st :selected").val();			
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/getBurnListByStationAjax.do",
				dataType : "json",
				data : "stationName="+stSel+"&pageNo="+$(this).text(),
				success :function(data){
					// list 출력부 
					var list="";
					list += "<table class='table table-hover'>";
					list += "<tr>";
					list += "<th width='100px'>번호</th> <th>제목</th><th width='100px'>역이름</th><th width='120px'>작성자</th> <th width='200px'>작성시간</th><th width='100px'>조회수</th>";
					list += "</tr>";
											 
					for(var i=0; i<data.list.length; i++){	
						list += "<tr align='center'>";
						list += "<td>"+data.list[i].no+"</td><td style='word-break:break-all;'><a href=${pageContext.request.contextPath}/showBurnDetail.do?no="+data.list[i].no+">"+data.list[i].title+"("+data.list[i].commentCount+")</a></td><td>"+data.list[i].stationName+"</td>";
						list += "<td>";
						list += "<a href='#.' class='AjaxPop' data-html='true' data-toggle='popover' data-trigger='focus' data-content='<ul><li><a href=#. class=message>메세지 보내기</a></li><li><a href=#. class=doVisit><input type=hidden value="+data.list[i].memberId+"> 페이지로 이동</a></li></ul>'>"+data.list[i].memberId+"</a>";
						list += "</td>";					
						list += "<td>"+data.list[i].postedTime+"</td><td>"+data.list[i].hits+"</td>";
						list += "</tr>";
					} // for						
					list += "</table>";
					
					$("#listOutput").empty();						
					$("#listOutput").html(list);
					
					
					// pagingBean 출력부						
					var pb ="";
					// 이전 페이지 존재 하면 ◀
					pb += "<ul class='pagination'>";
					if(data.pagingBean.previousPageGroup){
						pb += "<li><a class='arrowBtn' id='prevBtn'><input type='hidden' value="+parseInt(data.pagingBean.startPageOfPageGroup-1)+">◀</a></li>";
					}
					// 페이지 넘버 버튼 생성
					for(var i=data.pagingBean.startPageOfPageGroup; i<data.pagingBean.endPageOfPageGroup+1; i++){					
						if(data.pagingBean.nowPage!=i){
							pb += "<li><a href='#.' class='pbtn'>"+i+"</a></li>";
						}else{
							pb += "<li class='active'><a href=#.>"+i+"</a></li>";
						}
					}
					
					if(data.pagingBean.nextPageGroup){
						pb += "<li><a class='arrowBtn' id='nextBtn'><input type='hidden' value="+parseInt(data.pagingBean.endPageOfPageGroup+1)+">▶</a></li>";						
					}
					
					pb += "</ul>";		
					
					$("#pageDiv").empty();
					$("#pageDiv").html(pb);	
				} // success				
			}); // ajax			
		});
		
		$(document).on("click",".arrowBtn",function(){ // Ajax 화살 버튼 클릭시
			var stSel = $("#st :selected").val();
			var pageNo="";
			if($(this).attr("id")=="prevBtn"){
				pageNo=$(":input[type=hidden]").val();				
			}else{
				pageNo=$(":input[type=hidden]").val();
			}
			
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/getBurnListByStationAjax.do",
				dataType : "json",
				data : "stationName="+stSel+"&pageNo="+pageNo,
				success :function(data){
					// list 출력부 
					var list="";
					list += "<table class='table table-hover'>";
					list += "<tr>";
					list += "<th width='100px'>번호</th> <th>제목</th><th width='100px'>역이름</th><th width='120px'>작성자</th> <th width='200px'>작성시간</th><th width='100px'>조회수</th>";
					list += "</tr>";
											 
					for(var i=0; i<data.list.length; i++){	
						list += "<tr align='center'>";
						list += "<td>"+data.list[i].no+"</td><td style='word-break:break-all;'><a href=${pageContext.request.contextPath}/showBurnDetail.do?no="+data.list[i].no+">"+data.list[i].title+"("+data.list[i].commentCount+")</a></td><td>"+data.list[i].stationName+"</td>";
						list += "<td>";
						list += "<a href='#.' class='AjaxPop' data-html='true' data-toggle='popover' data-trigger='focus' data-content='<ul><li><a href=#. class=message>메세지 보내기</a></li><li><a href=#. class=doVisit><input type=hidden value="+data.list[i].memberId+"> 페이지로 이동</a></li></ul>'>"+data.list[i].memberId+"</a>";
						list += "</td>";					
						list += "<td>"+data.list[i].postedTime+"</td><td>"+data.list[i].hits+"</td>";
						list += "</tr>";
					} // for						
					list += "</table>";
					
					$("#listOutput").empty();						
					$("#listOutput").html(list);
					
					
					// pagingBean 출력부						
					var pb ="";
					// 이전 페이지 존재 하면 ◀
					pb += "<ul class='pagination'>";
					if(data.pagingBean.previousPageGroup){
						pb += "<li><a class='arrowBtn' id='prevBtn'><input type='hidden' value="+parseInt(data.pagingBean.startPageOfPageGroup-1)+">◀</a></li>";
					}
					// 페이지 넘버 버튼 생성
					for(var i=data.pagingBean.startPageOfPageGroup; i<data.pagingBean.endPageOfPageGroup+1; i++){					
						if(data.pagingBean.nowPage!=i){
							pb += "<li><a href='#.' class='pbtn'>"+i+"</a></li>";
						}else{
							pb += "<li class='active'><a href=#.>"+i+"</a></li>";
						}
					}
					
					if(data.pagingBean.nextPageGroup){
						pb += "<li><a class='arrowBtn' id='nextBtn'><input type='hidden' value="+parseInt(data.pagingBean.endPageOfPageGroup+1)+">▶</a></li>";						
					}
					
					pb += "</ul>";		
					
					
					$("#pageDiv").empty();
					$("#pageDiv").html(pb);	
				} // success				
			}); // ajax	
		});
		
	}); 
</script>

<!--  남준  -->
<!-- <style>
th {
	text-align : center;
}
input {
	margin: 10px;
	
}
</style>　　 -->　　　　　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
<div class="row"> 
	<div class="col-md-4">
		<a href="#" class="btn btn-small btn-default" id="write">글쓰기</a>
	</div> 
	<div class="col-md-4 col-md-offset-4">
	
	<select class="col-sm-4 form-control" name=stationName id="st">
	<option value="all">전체보기</option><c:forEach items="${station}" var="sname"><option value="${sname}">${sname}</option></c:forEach>
	</select>
	</div> 
</div>

<br>
<div id="listOutput">
<table class="table table-hover" >
  <tr>
    <th width="100px">번호</th>
    <th>제목</th>
    <th width="100px">역이름</th>
    <th width="120px">작성자</th>
    <th width="200px">작성시간</th>
    <th width="100px">조회수</th>
  </tr>
  <c:forEach items="${lvo.list}" var="burn">
  	<tr align="center">
	<td>${burn.no}</td>
	<td style="word-break:break-all;"><a href="${pageContext.request.contextPath}/showBurnDetail.do?no=${burn.no}">${burn.title} (${burn.commentCount})</a></td>
	<td>${burn.stationName}</td>	
	<td><a href="#." data-html="true" data-toggle="popover" data-trigger="focus" data-content="<ul><li><a href='#.' class='message'>메세지 보내기</a></li><li><a href='#.' class='doVisit'><input type='hidden' value='${burn.memberId}'> 페이지로 이동</a></li></ul>">${burn.memberId}</a>	
	</td>
	<td>${burn.postedTime}</td>
	<td>${burn.hits}</td>
	</tr>
  </c:forEach>  
</table>
</div>

<div id="pageDiv" align="center">

<c:set value="${lvo.pagingBean}" var="pb"/>

<ul class="pagination">
<c:if test="${pb.previousPageGroup}">
	<li><a href="${pageContext.request.contextPath}/getBurnList.do?pageNo=${pb.startPageOfPageGroup-1}">
	◀
	</a></li>
</c:if>
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
<c:if test="${pb.nextPageGroup}">
	<li><a href="${pageContext.request.contextPath}/getBurnList.do?pageNo=${pb.endPageOfPageGroup+1}">
	▶
	</a></li>
</c:if>
</ul>


</div>



