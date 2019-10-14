<%@page import="web.holiday.reservation.ReservationDTO"%>
<%@page import="web.holiday.reservation.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	int year = Integer.parseInt(request.getParameter("year")); 
	int month = Integer.parseInt(request.getParameter("month"));
	int day = Integer.parseInt(request.getParameter("day"));
	int room_num = Integer.parseInt(request.getParameter("room_num"));
	ReservationDAO dao = new ReservationDAO();
	ReservationDTO member = dao.selectAll(year,month,day,room_num);
%>
	방이름 : <%=member.getRoom_name()%> <br />
	예약한 시간 : <%=member.getReserved_date()%><br />
	입금액 : <%=member.getMoney()%><br />
	예약일 : <%=member.getYear()%>년 <%=member.getMonth()%>월 <%=member.getDay()%>일<br />
	예약자 id : <%=member.getId()%><br />
	상태번호 : <%=member.getStats()%><br />
	방번호 : <%=member.getRoom_num()%><br />
<form action="bookingAdminPro.jsp" method="post">
	<input type="hidden" name="year" value="<%=year %>" />
	<input type="hidden" name="month" value="<%=month %>" />
	<input type="hidden" name="day" value="<%=day %>" />
	<input type="hidden" name="room_num" value="<%=room_num %>" />
	<select name="stats">
		<option value="0">예약불가</option>
		<option value="1">예약가능</option>
		<option value="2">예약완료</option>
		<option value="3">전화문의</option>
	</select>
	<input type="submit" value="전송" />
</form>