<%@page import="web.holiday.reservation.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int year = Integer.parseInt(request.getParameter("year")); 
	int month = Integer.parseInt(request.getParameter("month"));
	int day = Integer.parseInt(request.getParameter("day"));
	int room_num = Integer.parseInt(request.getParameter("room_num"));
	int stats = Integer.parseInt(request.getParameter("stats"));
	ReservationDAO dao = new ReservationDAO();
	dao.setStats(year,month,day,room_num,stats);
%>
	<script>
		alert("수정완료");
		location="bookingAdmin.jsp";
	</script>