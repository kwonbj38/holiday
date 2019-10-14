<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="bookingAdminForm.jsp" method="post">
	날짜입력<br /> 
	<input type="text" name="year" />년 
	<input type="text" name="month" />월 
	<input type="text" name="day" />일<br />
	방번호<br />
	<select name="room_num">
		<option value="1">1번방</option>
		<option value="2">2번방</option>
		<option value="3">3번방</option>
	</select>
	<input type="submit" value="전송" />
</form>