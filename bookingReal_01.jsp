<%@page import="web.holiday.reservation.ReservationDTO"%>
<%@page import="web.holiday.reservation.ReservationDAO"%>
<%@page import="java.util.Calendar"%>
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
	ReservationDAO dao = new ReservationDAO();
	int x = 0; // x값이 0일경우 예약가능 // 1일경우 예약완료 // 2일경우 예약진행중	
%>
<%
	Calendar cal = Calendar.getInstance();
	int year = request.getParameter("year") == null ? cal.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("year"));
	int month = request.getParameter("month") == null ? cal.get(Calendar.MONTH) : (Integer.parseInt(request.getParameter("month")) - 1);
	cal.set(year, month, 1);
	int bgnWeek = cal.get(Calendar.DAY_OF_WEEK);	// 빈공간생성할때 필요한 변수(요일을 숫자로 바꿈)
	
	int prevYear = year;
	int prevMonth = (month + 1) - 1;
	int nextYear = year;
	int nextMonth = (month + 1) + 1;
	
	if (prevMonth < 1) {
		prevYear--;
		prevMonth = 12;
	}
	if (nextMonth > 12) {
		nextYear++;
		nextMonth = 1;
	}
%>
<table>
	<tr>
		<td align="center" colspan="7">
		<a href="bookingReal_01.jsp?year=<%=prevYear%>&month=<%=prevMonth%>">prev</a> 
		<%=year%>년 <%=month+1%>월 
		<a href="bookingReal_01.jsp?year=<%=nextYear%>&month=<%=nextMonth%>">next</a>		
		</td>
	</tr>
	<tr>
		<td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td>
	</tr>
	<tr>
	<%	for(int i = 1; i < bgnWeek; i++){ // 앞빈공간생성 %>	
			<td></td>
	<%	}		
		while(cal.get(Calendar.MONTH) == month) { %>
			<td>
			<%=month+1%>월 <%=cal.get(Calendar.DATE) %>일 <br />
			<%
				ReservationDTO dto = null;
				for(int i = 1; i <= 3; i++){
					dto = new ReservationDTO();
					dto.setYear(cal.get(Calendar.YEAR));
					dto.setMonth(month+1);
					dto.setDay(cal.get(Calendar.DATE));
					dto.setRoom_num(i);%>
					* <%=i %>번방
					<% x = dao.check(dto); %>
					<%if(x == 0){%>예약불가<br /><%}else if(x == 1){%><a href="bookingForm.jsp?year=<%=dto.getYear() %>&month=<%=dto.getMonth() %>&day=<%=dto.getDay() %>">예약가능</a><br /><%}else if(x == 2){%>예약완료<br /><%}else if(x == 3){%>예약진행중<br /><%}else{%>전화문의<br /><%}%>
			<% 	} %>
			</td>
		<%	if(cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY){ %>
				</tr><tr>
		<%	}
			cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE)+1);
		}
		for(int i = cal.get(Calendar.DAY_OF_WEEK); i <= 7; i++){ // 뒷빈공간생성 %>
			<td></td>
	<%	} %>
	</tr>
</table>
</body>
</html>