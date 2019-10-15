package web.holiday.reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReservationDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/xe");
		return ds.getConnection();
	}
	
	
	public int checkStats(ReservationDTO dto) { // 년월일, 방번호로 stats 검색 해서 x값으로 돌려줌
		int x = 1; // x값이 0일경우 예약불가능 // 1일경우 예약가능 // 2일경우 예약진행중
		try {
			conn = getConnection();
			String sql = "select stats from reservation where year=? and month=? and day=? and room_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getYear());
			pstmt.setInt(2, dto.getMonth());
			pstmt.setInt(3, dto.getDay());
			pstmt.setInt(4, dto.getRoom_num());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt("stats");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null){try{rs.close();}catch(SQLException e){e.printStackTrace();}}
			if(pstmt!=null){try{pstmt.close();}catch(SQLException e){e.printStackTrace();}}
			if(conn!=null){try{conn.close();}catch(SQLException e){e.printStackTrace();}}
		}
		return x;
	}
	public ReservationDTO selectAll(int year, int month, int day, int room_num) { //년월일,방번호로 정보검색
		ReservationDTO member = null;
		try {
			conn = getConnection();
			String sql = "select * from reservation where year=? and month=? and day=? and room_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			pstmt.setInt(2, month);
			pstmt.setInt(3, day);
			pstmt.setInt(4, room_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new ReservationDTO();
				member.setRoom_name(rs.getString("room_name"));
				member.setReserved_date(rs.getTimestamp("reserved_date"));
				member.setMoney(rs.getInt("money"));
				member.setYear(rs.getInt("year"));
				member.setMonth(rs.getInt("month"));
				member.setDay(rs.getInt("day"));
				member.setId(rs.getString("id"));
				member.setStats(rs.getInt("stats"));
				member.setRoom_num(rs.getInt("room_num"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null){try{rs.close();}catch(SQLException e){e.printStackTrace();}}
			if(pstmt!=null){try{pstmt.close();}catch(SQLException e){e.printStackTrace();}}
			if(conn!=null){try{conn.close();}catch(SQLException e){e.printStackTrace();}}			
		}
		return member;
	}
	public List<ReservationDTO> selectAll(String id) { //id로 모든정보 검색
		List<ReservationDTO> list = null;
		try {
			conn = getConnection();
			String sql = "select * from reservation where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			list = new ArrayList<ReservationDTO>();
			while(rs.next()) {
				ReservationDTO member = new ReservationDTO();
				member.setRoom_name(rs.getString("room_name"));
				member.setReserved_date(rs.getTimestamp("reserved_date"));
				member.setMoney(rs.getInt("money"));
				member.setYear(rs.getInt("year"));
				member.setMonth(rs.getInt("month"));
				member.setDay(rs.getInt("day"));
				member.setId(rs.getString("id"));
				member.setStats(rs.getInt("stats"));
				member.setRoom_num(rs.getInt("room_num"));
				list.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null){try{rs.close();}catch(SQLException e){e.printStackTrace();}}
			if(pstmt!=null){try{pstmt.close();}catch(SQLException e){e.printStackTrace();}}
			if(conn!=null){try{conn.close();}catch(SQLException e){e.printStackTrace();}}			
		}
		return list;
	}
	public void setStats(int year, int month, int day, int room_num, int stats) { //stats 변경하는 메서드
		try {
			conn = getConnection();
			String sql = "update reservation set stats=? where year=? and month=? and day=? and room_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, stats);
			pstmt.setInt(2, year);
			pstmt.setInt(3, month);
			pstmt.setInt(4, day);
			pstmt.setInt(5, room_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {			
			if(rs!=null){try{rs.close();}catch(SQLException e){e.printStackTrace();}}
			if(pstmt!=null){try{pstmt.close();}catch(SQLException e){e.printStackTrace();}}
			if(conn!=null){try{conn.close();}catch(SQLException e){e.printStackTrace();}}			
		}
	}
	public boolean check(int year, int month, int day, int room_num) {	//년월일,방번호로 검색했을때 예약확인
		boolean result = false;
		try {
			conn = getConnection();
			String sql = "select * from reservation where year=? and month=? and day=? and room_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			pstmt.setInt(2, month);
			pstmt.setInt(3, day);
			pstmt.setInt(4, room_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {			
			if(rs!=null){try{rs.close();}catch(SQLException e){e.printStackTrace();}}
			if(pstmt!=null){try{pstmt.close();}catch(SQLException e){e.printStackTrace();}}
			if(conn!=null){try{conn.close();}catch(SQLException e){e.printStackTrace();}}			
		}
		return result;
	}
	public boolean check(String id) { //id로 검색했을때 예약확인
		boolean result = false;
		try {
			conn = getConnection();
			String sql = "select * from reservation where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {			
			if(rs!=null){try{rs.close();}catch(SQLException e){e.printStackTrace();}}
			if(pstmt!=null){try{pstmt.close();}catch(SQLException e){e.printStackTrace();}}
			if(conn!=null){try{conn.close();}catch(SQLException e){e.printStackTrace();}}			
		}
		return result;
	}
	public void reserv(ReservationDTO dto) { //예약메서드
		try {
			conn = getConnection();
			String sql = "insert into reservation values(sysdate,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setInt(2, dto.getYear());
			pstmt.setInt(3, dto.getMonth());
			pstmt.setInt(4, dto.getDay());
			pstmt.setString(5, dto.getId());
			pstmt.setInt(6, 0);
			pstmt.setInt(7, dto.getRoom_num());
			pstmt.setString(8, dto.getRoom_name());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {			
			if(rs!=null){try{rs.close();}catch(SQLException e){e.printStackTrace();}}
			if(pstmt!=null){try{pstmt.close();}catch(SQLException e){e.printStackTrace();}}
			if(conn!=null){try{conn.close();}catch(SQLException e){e.printStackTrace();}}			
		}
	}
}
