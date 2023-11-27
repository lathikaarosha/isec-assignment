package entity;

import java.sql.Date;
import java.sql.Time;

public class VehicalService {
	
	
	
	public VehicalService(int id, Date date, Time time, String location, int mileage, String vehicle_no, String message,
			String user_name) {
		super();
		this.id = id;
		this.date = date;
		this.time = time;
		this.location = location;
		this.vehicle_no = vehicle_no;
		this.mileage = mileage;
		this.message = message;
		this.user_name = user_name;
	}
	
	
	
	public VehicalService(Date date, Time time, String location, String vehicle_no, int mileage, String message,
			String user_name) {
		super();
		this.date = date;
		this.time = time;
		this.location = location;
		this.vehicle_no = vehicle_no;
		this.mileage = mileage;
		this.message = message;
		this.user_name = user_name;
	}



	private int id;
	private Date date;
	private Time time;
	private String location;
	private String vehicle_no;
	private int mileage;
	private String message;
	private String user_name;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
		this.time = time;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getvehicle_no() {
		return vehicle_no;
	}
	public void setvehicle_no(String vehicle_no) {
		this.vehicle_no = vehicle_no;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	
	

}
