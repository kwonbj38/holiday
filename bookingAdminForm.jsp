<%@page import="java.util.List"%>
<%@page import="web.holiday.reservation.ReservationDTO"%>
<%@page import="web.holiday.reservation.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	int year = request.getParameter("year") == null ? 0 : Integer.parseInt(request.getParameter("year"));
	int month = request.getParameter("month") == null ? 0 : Integer.parseInt(request.getParameter("month"));
	int day = request.getParameter("day") == null ? 0 : Integer.parseInt(request.getParameter("day"));
	int room_num = request.getParameter("room_num") == null ? 0 : Integer.parseInt(request.getParameter("room_num"));
	String id = request.getParameter("id");
	ReservationDAO dao = new ReservationDAO();
	ReservationDTO member = null;
	List<ReservationDTO> list = null;
	boolean result = dao.check(year,month,day,room_num);
	boolean result_2 = dao.check(id);
	if(result){
		member = dao.selectAll(year,month,day,room_num);	//년월일방번호 맞는 예약정보 모두 가져오는 메서드	%>
		방이름 : <%=member.getRoom_name()%> <br />
		예약한 시간 : <%=member.getReserved_date()%><br />
		입금액 : <%=member.getMoney()%><br />
		예약일 : <%=member.getYear()%>년 <%=member.getMonth()%>월 <%=member.getDay()%>일<br />
		예약자 id : <%=member.getId()%><br />
		상태번호 : <%=member.getStats()%><br />
		방번호 : <%=member.getRoom_num()%><br />
<%	}else if(result_2){
		list = dao.selectAll(id);%>
		<table>
			<tr>
				<%for(ReservationDTO dto : list){%>
				<td>
					방이름 : <%=dto.getRoom_name()%> <br />
					예약한 시간 : <%=dto.getReserved_date()%><br />
					입금액 : <%=dto.getMoney()%><br />
					예약일 : <%=dto.getYear()%>년 <%=dto.getMonth()%>월 <%=dto.getDay()%>일<br />
					예약자 id : <%=dto.getId()%><br />
					상태번호 : <%=dto.getStats()%><br />
					방번호 : <%=dto.getRoom_num()%><br />
				</td>
				<%}%>
			</tr>
		</table>
<%	}else{ %>
		예약자가없습니다
<%	} %>
<%--
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
--%>