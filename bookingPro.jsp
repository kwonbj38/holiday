<%@page import="web.holiday.reservation.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="dto" class="web.holiday.reservation.ReservationDTO" />
<jsp:setProperty property="*" name="dto"/>
<%
	ReservationDAO dao = new ReservationDAO();
	dao.reserv(dto);
%>
<body>
	<script type="text/javascript">
		alert("예약완료");
		location="bookingCheck.jsp";
	</script>
</body>
</html>