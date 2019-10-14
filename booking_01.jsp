<%@page import="web.holiday.reservation.ReservationDTO"%>
<%@page import="web.holiday.reservation.ReservationDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	ReservationDAO dao = new ReservationDAO();
%>
<%
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(EEE)");
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = request.getParameter("date") == null ? cal.get(Calendar.DAY_OF_MONTH) : Integer.parseInt(request.getParameter("date"));
	cal.set(year, month, date);
	String today = sdf.format(cal.getTime()); // 오늘날짜 7일단위 이동가능
%>
<body>
	<table>
		<tr>
			<td align="center" colspan="8">
			<a href="booking_01.jsp?date=<%=date-7 %>"> prev-7 </a>	
			<%=cal.get(Calendar.YEAR) %>년 <%=cal.get(Calendar.MONTH) + 1 %>월 <%=cal.get(Calendar.DAY_OF_MONTH) %>일 <%=today %>
			<a href="booking_01.jsp?date=<%=date+7 %>"> next+7 </a>
			</td>
		</tr>
		<%	
			ReservationDTO dto = null;
			int x = 0;
			String names[] = {"날짜","1번방","2번방","3번방"};
			for(int i = 0; i <= 3; i++){%>
		<tr>
			<td><%=names[i] %></td>
			<%	for(int j = 0; j < 7; j++){
					cal.set(year, month, date+j);
					if(i == 0){
						%><td><%=sdf.format(cal.getTime()) %></td><%
					}else{
						dto = new ReservationDTO();
						dto.setYear(cal.get(Calendar.YEAR));
						dto.setMonth(cal.get(Calendar.MONTH) + 1);
						dto.setDay(cal.get(Calendar.DAY_OF_MONTH));
						dto.setRoom_num(i);
						x = dao.check(dto);
						if(x == 1){%>
							<td>가능</td><%
						}else{%>
							<td>불가능</td><%
						}
					}
				} %>
		</tr>				
		<%	}
		%>
	</table>
</body>
</html>

		