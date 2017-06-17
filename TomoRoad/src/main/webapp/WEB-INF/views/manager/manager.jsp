<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script> 
$(document).ready(function(){
    $("#memberButton").click(function(){
    	/* location.href="${pageContext.request.contextPath}/getMemberList.do"; */
        $("#listOutput").animate({
            height: 'toggle'
            	
        });
    });	
});

$(document).ready(function() {  
	$("#updateMember").click(function() {
						if (confirm("회원정보를 수정하시겠습니까?")){
							location.href = "${pageContext.request.contextPath}/updateMemberByManager.do?id=${mvo.id}";
						}
					});
	$("#deleteMember").click(function() {
		var checked = $('input[type=radio]:checked').val();
						if (confirm("회원을 삭제하시겠습니까?")){
							location.href = "${pageContext.request.contextPath}/deleteMemberByManager.do?id=checked";
						} 
					});
				});

 $(document).ready(function(){
    $('input[type=radio]').prop('checked', false);

    $('input[type=radio]').on('change', function(){
        $('input[type=radio]').not(this).prop('checked', false);
    });
}); 
</script> 

    <div class="col-lg-12 col-sm-12"> 
	
		        <div class="dividerHeading">
            <h4><span>관리자 페이지</span></h4>
        </div>
        
<button id="memberButton" class="btn btn-default btn-lg button" >회원님들</button>

<button id="updateMember" class="btn btn-default btn-lg button" >수정</button>

<button id="deleteMember" class="btn btn-default btn-lg button" >삭제</button>

 <div>
<form  id="listOutput" method="post"  action="${pageContext.request.contextPath}/getMemberList.do" style="display:none">
<table>
	<thead>
		<tr>
		<th width="25px"></th><th width="100px">아이디</th><th width="100px">비밀번호</th>
		<th width="100px">이름</th><th width="100px">성별</th><th width="100px">연락처</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="mvo">
		<tr>
    <td><input type="radio" value="${mvo.id}"></td>
	<td><input type="text" value="${mvo.id}" readonly></td>
	<td><input type="text" value="${mvo.password}"></td>
	<td><input type="text" value="${mvo.name}"></td>
	<td><input type="text" value="${mvo.sex}"></td>
	<td><input type="text" value="${mvo.tel}"></td>
		</tr>
		</c:forEach>
	</tbody>
</table>

</form>
</div>

        </div> 
       