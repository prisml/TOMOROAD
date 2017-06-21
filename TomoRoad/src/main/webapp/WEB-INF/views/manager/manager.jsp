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
			            		 confirm("회원정보를 수정하시겠습니까?"); 					
							 location.href = "${pageContext.request.contextPath}/updateMemberByManagerForm.do?id="+radioValue; 
						}
			        });			        
			    });
			    $(document).ready(function(){
			        $("#deleteMember").click(function(){
			            var radioValue = $("input[name='radio']:checked").val();
			            if(radioValue){
			            	 confirm("회원을 삭제하시겠습니까?"); 
						location.href = "${pageContext.request.contextPath}/deleteMemberByManager.do?id="+radioValue;
			            }
			        });			        
			    });
			    $(document).ready(function(){
			        $("#managerStation").click(function(){		
			        	var optionValue = $("#st").val();
						location.href = "${pageContext.request.contextPath}/getStationListManager.do?name="+optionValue;
			        });			        
			    });
			    $(document).ready(function(){
			       /*  $("#listStation").click(function(){		
						location.href = "${pageContext.request.contextPath}/getStationNameListManager.do";
			        });		 */	        
			    });
</script>
<script type="text/javascript">
$(document).ready(function(){
     $("#showStation").click(function(){
    	// location.href="${pageContext.request.contextPath}/getMemberList.do"; 
         $("#listStation").animate({
            height: 'toggle'
            	
        });
    });	 
});
</script>


    <div class="col-lg-12 col-sm-12"> 
	
		        <div class="dividerHeading">
            <h4><span>관리자 화면</span></h4>
        </div>
        <br>

<button id="showStation" class="btn btn-default btn-lg button" >역정보 보기</button>

    	     <div id="listStation" class="col-sm-4" style="display:none;">
              <%--  	 역이름<select class="col-lg-4 col-md-4 form-control" name="name" id="name">
               	 <option value="">---------</option><c:forEach items="${station}" var="sname"><option name="${sname.name}">${sname.name}
               	 </option></c:forEach></select> --%>
               	 <select class="col-sm-4 form-control" name=stationName id="st">
	<option value="all">전체보기</option>
	<c:forEach items="${station}" var="sname">
	<option value="${sname.name}">${sname.name}</option>
	</c:forEach>
	</select>
             </div>

<button id="managerStation" class="btn btn-default btn-lg button" >역정보 수정</button>
<label>원하시는 역을 선택 해주세요</label>
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
	<td><input type="password" value="${mvo.password}" readonly></td>
	<td><input type="text" value="${mvo.name}" readonly></td>
	<td><input type="text" value="${mvo.sex}" readonly></td>
	<td><input type="text" value="${mvo.tel}" readonly></td>
		</tr>
		</c:forEach>
	</tbody>
</table>

</form>

<button id="updateMember" class="btn btn-default btn-lg button" >회원수정</button>

<button id="deleteMember" class="btn btn-default btn-lg button" >회원삭제</button>
<label>원하시는 회원을 선택 해주세요</label>
<%--  <a href="${pageContext.request.contextPath}/home.do" class="btn btn-default btn-lg button">시작화면</a>  --%>
</div>
<br>
</div>
    
        

        
       