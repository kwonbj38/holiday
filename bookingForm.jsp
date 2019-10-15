<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String room_num = request.getParameter("room_num");
	String id = null;
	String room_name = null;
%>
</body>
<h1><%=year %>년 <%=month %>월 <%=day %>일 <%=room_num %>번방 예약 페이지 입니다.</h1>
<form action="bookingPro.jsp" method="post">
	<input type="text" name="year" value="<%=year %>"/>년
	<input type="text" name="month" value="<%=month %>"/>월
	<input type="text" name="day" value="<%=day %>"/>일<br />
	아이디 : <input type="text" name="id" value="<%=id %>"/><br />
	방번호 : <input type="text" name="room_num" value="<%=room_num %>"/><br />
	방이름 : <input type="text" name="room_name" value="<%=room_name %>"/><br />
	<input type="submit" value="예약"/>
</form>
</html>