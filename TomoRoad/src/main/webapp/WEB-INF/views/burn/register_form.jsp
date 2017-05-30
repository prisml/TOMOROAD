<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<center>


<form method="post" action="${pageContext.request.contextPath}/writeBurn.do">
<table border="1" cellpadding="10">
  <tr>
    <td>제목</td> <td><input type="text" name="title"></td>
    <td>작성자</td><td><input type="text" name="memberId" value="${mvo.id}" readonly></td>
    <td>역이름</td><td><input type="text" name="stationName"></td>
  </tr>
  <tr>
    <td colspan="6"><textarea name="content" placeholder="내용을 입력해주세요"></textarea></td>
  </tr>
</table>
<input type="submit" value="작성하기">
</form>
</center>