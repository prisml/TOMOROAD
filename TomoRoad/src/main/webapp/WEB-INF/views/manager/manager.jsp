<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script> 
 $(document).ready(function(){
    $('input[type=radio]').prop('checked', false);

    $('input[type=radio]').on('change', function(){
        $('input[type=radio]').not(this).prop('checked', false);
    });
}); 
</script> 
<script>
			    $(document).ready(function(){
			        $("#updateMember").click(function(){
			            var radioValue = $("input[name='radio']:checked").val();
			            if(radioValue){
			            	/* alert(radioValue); */
			            		/* confirm("회원정보를 수정하시겠습니까?"); */
							/*  location.href = "${pageContext.request.contextPath}/updateMemberByManagerForm.do?id="+radioValue;  */
							 location.href = "${pageContext.request.contextPath}/updateMemberByManagerForm.do?id="+radioValue; 
						}
			        });			        
			    });
			    $(document).ready(function(){
			        $("#deleteMember").click(function(){
			            var radioValue = $("input[name='radio']:checked").val();
			            if(radioValue){
			            	/* confirm("회원을 삭제하시겠습니까?"); */
						location.href = "${pageContext.request.contextPath}/deleteMemberByManager.do?id="+radioValue;
			            }
			        });			        
			    });
</script>

    <div class="col-lg-12 col-sm-12"> 
	
		        <div class="dividerHeading">
            <h4><span>관리자 페이지</span></h4>
        </div>
        <br>

<button id="updateMember" class="btn btn-default btn-lg button" >수정</button>

<button id="deleteMember" class="btn btn-default btn-lg button" >삭제</button>
<br>
 <div id="listOutput" >
<form id="myForm" style="width: 100%; height: 250px; overflow-y: scroll; display: block;">
<table style="width:100px; height:200px;">
	<thead>
		<tr>
		<th width="25px"></th><th width="100px">아이디</th><th width="100px">비밀번호</th>
		<th width="100px">이름</th><th width="100px">성별</th><th width="100px">연락처</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="mvo">
		<tr>
    <td><input type="radio" name="radio" value="${mvo.id}" required="required"/></td>
	<td><input type="text" value="${mvo.id}" readonly></td>
	<td><input type="password" value="${mvo.password}"></td>
	<td><input type="text" value="${mvo.name}"></td>
	<td><input type="text" value="${mvo.sex}"></td>
	<td><input type="text" value="${mvo.tel}"></td>
		</tr>
		</c:forEach>
	</tbody>
</table>

</form>
<a href="${pageContext.request.contextPath}/home.do" class="btn btn-default btn-lg button">시작화면</a>
</div>
<br>
</div>
    
        

        
       