<%@page import="web.holiday.reservation.ReservationDAO"%>
<%@page import="web.holiday.reservation.ReservationDTO"%>
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
	ReservationDTO dto = null;
	int x = 0; // x값이 0일경우 예약불가 // 1일경우 예약가능 // 2일경우 예약완료 // 3일경우 예약진행중
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
		<a href="bookingAdmin_01.jsp?year=<%=prevYear%>&month=<%=prevMonth%>">prev</a> 
		<%=year%>년 <%=month+1%>월 
		<a href="bookingAdmin_01.jsp?year=<%=nextYear%>&month=<%=nextMonth%>">next</a>		
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
				for(int i = 1; i <= 3; i++){
					dto = new ReservationDTO();
					dto.setYear(cal.get(Calendar.YEAR));
					dto.setMonth(month+1);
					dto.setDay(cal.get(Calendar.DATE));
					dto.setRoom_num(i);%>
					<a href="bookingAdminForm.jsp?year=<%=dto.getYear() %>&month=<%=dto.getMonth() %>&day=<%=dto.getDay() %>&room_num=<%=dto.getRoom_num() %>">* <%=i %>번방</a>
			<% 	} // 관리자페이지로 년월일방번호보냄%>
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
or
<form action="bookingAdminForm.jsp" method="post">
	예약자아이디입력
	<input type="text" name="id" />
	<input type="submit" value="전송"/>
</form>
</body>
</html>