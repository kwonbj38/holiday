package web.holiday.reservation;

import java.sql.Timestamp;

public class ReservationDTO {
	private String room_name;
	private Timestamp reserved_date;
	private int money;
	private int year;
	private int month;
	private int day;
	private String id;
	private int stats;
	private int room_num;
	
	
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public Timestamp getReserved_date() {
		return reserved_date;
	}
	public void setReserved_date(Timestamp reserved_date) {
		this.reserved_date = reserved_date;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getStats() {
		return stats;
	}
	public void setStats(int stats) {
		this.stats = stats;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}	
}
