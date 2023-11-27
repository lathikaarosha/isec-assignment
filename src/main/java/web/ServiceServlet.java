package web;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;

import java.sql.Date;
import java.sql.Time;

import java.io.IOException;
import java.sql.SQLException;

import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.Base64;
import java.util.List;

import dao.ServiceDao;
import entity.VehicalService;


@WebServlet("/")
public class ServiceServlet extends HttpServlet{
	private ServiceDao servicedao;
	
	public void init() {
		servicedao = new ServiceDao();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		        doGet(request, response);
		    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		        String action = request.getServletPath();

		        try {
		            switch (action) {
		                
		                case "/insert":
		                    insertService(request, response);
		                    break;
		                
		                default:
		                	// Check if the user is logged in
		                    if (isValidUser(request)) {
		                        listUpcomingEvents(request, response);
		                    } else {
		                        // Redirect to login if the user is not logged in
		                        response.sendRedirect(request.getContextPath() + "/login.jsp");
		                    }
		                    break;
		            }
		        } catch (SQLException ex) {
		            throw new ServletException(ex);
		        }
		    }
	
	private void insertService(HttpServletRequest request, HttpServletResponse response)
		    throws SQLException, IOException {
				
		
		        String datestr = request.getParameter("date");
		        String timestr = request.getParameter("time");
		        String location = request.getParameter("location");
		        String vehicleNo = request.getParameter("vehicleNo");
		        String mileagestr = request.getParameter("mileage");
		        String message = request.getParameter("message");
		        String userName = request.getParameter("usernameField");
		        
		        try {
		            SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		            SimpleDateFormat inputTimeFormat = new SimpleDateFormat("hh:mm");
		            
		            // Parse the date and time strings into Date and Time objects
		            Date sqldate = new Date(inputDateFormat.parse(datestr).getTime());
		            Time sqltime = new Time(inputTimeFormat.parse(timestr).getTime());
		            
		            int mileage = Integer.parseInt(mileagestr);

		            VehicalService newService = new VehicalService(sqldate, sqltime, location, vehicleNo, mileage, message, userName);
		            servicedao.bookService(newService);
		            response.sendRedirect(request.getContextPath() + "/");
		        } catch (ParseException e) {
		            // Handle the case where date or time strings are not in the expected format
		            e.printStackTrace();
		        }
		    }
	
	private void listUpcomingEvents(HttpServletRequest request, HttpServletResponse response)
		    throws SQLException, IOException, ServletException {
				
				String userName = request.getParameter("email");
				
				System.out.println(userName);
			
		        List < VehicalService > eventList = servicedao.AllServiceDetails(userName);
		        request.setAttribute("eventList", eventList);
		        
		        System.out.println("Event List Size: " + eventList.size());
		        
				RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
				dispatcher.forward(request, response);
		    }
	
	private boolean isValidUser(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");

        return isLoggedIn != null && isLoggedIn;
    }
	

	
	
	
}