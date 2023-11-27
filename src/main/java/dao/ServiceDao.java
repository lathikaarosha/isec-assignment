package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
import java.sql.Time;

import entity.VehicalService;

public class ServiceDao {
	
	private String jdbcURL = "jdbc:mysql://172.187.178.153:3306/isec_assessment2";
	private String jdbcUsername = "isec";
    private String jdbcPassword = "EUHHaYAmtzbv";
    
    private static final String INSERT_SERVICE_SQL = "INSERT INTO vehicle_service" + 
    "  (date, time, location, vehicle_no, mileage, message, username) VALUES " + 
    		" (?, ?, ?, ?, ?, ?, ?);";
    
    private static final String SELECT_SERVICE_BY_USERNAME = "select * from vehicle_service where username = ?";
    
    private static final String SELECT_SERVICE_BY_DATE = "select * from vehicle_service where username = ? and date>= CURDATE()";
    
    
    protected Connection getConnection() {
    	Connection connection = null;
    	
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		connection = DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
    		System.out.println("Connected");
    	}catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Error 2");
        }
    	
    	return connection;
    }
    
    public void bookService(VehicalService service) {
    	try(Connection connection = getConnection();PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SERVICE_SQL) ){
    		preparedStatement.setDate(1, service.getDate());
    		preparedStatement.setTime(2, service.getTime());
    		preparedStatement.setString(3, service.getLocation());
    		preparedStatement.setString(4, service.getvehicle_no());
    		preparedStatement.setInt(5, service.getMileage());
    		preparedStatement.setString(6, service.getMessage());
    		preparedStatement.setString(7, service.getUser_name());
    		System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
    	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    public List <VehicalService> AllServiceDetails(String username){
    	List <VehicalService> services = new ArrayList <> ();
    	
    	try (Connection connection = getConnection();
                // Step 2:Create a statement using connection object
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SERVICE_BY_USERNAME);){
    		preparedStatement.setString(1, username);
    		
    		ResultSet resultSet = preparedStatement.executeQuery();
    		
    		while (resultSet.next()) {
    			int bookingId = resultSet.getInt("booking_id");
                Date date = resultSet.getDate("date");
                Time time = resultSet.getTime("time");
                String location = resultSet.getString("location");
                int mileage = resultSet.getInt("mileage");
                String vehicleNo = resultSet.getString("vehicle_no");
                String message = resultSet.getString("message");
                
                services.add(new VehicalService(bookingId,date,time,location,mileage,vehicleNo,message,username));
                
    		}
    		
    		
    		
    	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return services;
    }
    
    public List <VehicalService> UpcomingServiceDetails(String username){
    	List <VehicalService> services = new ArrayList <> ();
    	
    	try (Connection connection = getConnection();
                // Step 2:Create a statement using connection object
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SERVICE_BY_USERNAME);){
    		preparedStatement.setString(1, username);
    		
    		ResultSet resultSet = preparedStatement.executeQuery();
    		
    		while (resultSet.next()) {
    			int bookingId = resultSet.getInt("booking_id");
                Date date = resultSet.getDate("date");
                Time time = resultSet.getTime("time");
                String location = resultSet.getString("location");
                int mileage = resultSet.getInt("mileage");
                String vehicleNo = resultSet.getString("vehicle_no");
                String message = resultSet.getString("message");
                
                services.add(new VehicalService(bookingId,date,time,location,mileage,vehicleNo,message,username));
                
    		}
    		
    		
    		
    	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return services;
    }
    
    

}
