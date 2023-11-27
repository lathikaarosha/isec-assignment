<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <html>

        <head>
        
            <title>AutoReserveHub</title>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        	<!-- <link rel="stylesheet" href="<c:url value='/css/Style.css' />"> -->
        	
        	<style>
        	body {
    			background-color: wite
			}

			.userProfile
			{
    			text-align: center;
    			font-size: 30px;
    			align-items: center;
    			justify-content: center;
    			
			}
			
			
			.user-profile
			{ 
    			float: left;  
			}
			.details
			{
    			float: left;
			}
			.card
			{
				margin-bottom: 50px
			}
        	
        	</style>
        	
        	
        	
        	
        </head>

        <body>
        
      
      <script type="text/javascript">
      
        function getUserInfo() {
            var access_token = localStorage.getItem('access_token'); // Retrieve the access token from localStorage

            // Make the GET request to the userinfo endpoint
            $.ajax({
                url: 'https://api.asgardeo.io/t/autoreservehub/oauth2/userinfo',
                method: 'GET',
                headers: {
                    'Authorization': 'Bearer ' + access_token
                },
                success: function (response) {
                    // Handle the userinfo response here
                    console.log('Userinfo:', response);

                    var userName = response.name;
                    var email = response.email;
                    var number = response.phone_number;
                    
                     // Update HTML content with user information
                $('#userName').text(userName);
                $('#email').text(email);
                $('#phoneNumber').text(number);
                
             // Send the email to the server to set in the session
                $.ajax({
                    url: 'http://localhost:8080/AutoReserveHub/',
                    method: 'POST',
                    data: { email: email },
                    success: function () {
                        console.log('Email sent to server successfully.');
                    },
                    error: function (error) {
                        console.error('Error sending email to server:', error);
                    }
                });
                
                
                document.getElementById('submit').addEventListener('click', function () {
                    // Set the username as a hidden field value in the form
                    document.getElementById('usernameField').value = email;
                 });
                
                    
                },
                error: function (error) {
                    // Handle errors here
                    console.error('Error:', error);
                }
            });
        }

        // Call the getUserInfo function when the page loads or wherever it's appropriate in your application
        getUserInfo();
        
        </script>
        
        
        
        
         
        

            <header>
                <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
                    <div>
                        <a href="https://www.javaguides.net" class="navbar-brand"> AutoReserveHub </a>
                    </div>

                    <ul class="navbar-nav">
                        <div class="actions">
    						<form id="logout-form" action="https://api.asgardeo.io/t/autoreservehub/oidc/logout" method="POST">
    							<input type="hidden" id="client-id" name="client_id" value="aeafyhTZm8M7w7ibilGtrWTBGgAa">
    							<input type="hidden" id="post-logout-redirect-uri" name="post_logout_redirect_uri" value="http://localhost:8080/AutoReserveHub/login.jsp">
    							<input type="hidden" id="state" name="state" value="">
    							<button type="button" onclick="performLogout()">Logout</button>
							</form>
						</div>
                    </ul>
                </nav>
            </header>
            <br>
            
            <script>
				function performLogout() {
    				// Your code to destroy session attributes
    				var xhr = new XMLHttpRequest();
    				xhr.open("GET", "logout.jsp", true); // Create a logout.jsp page to handle session cleanup
    				xhr.send();

    				// Continue with the form submission
    				document.getElementById("logout-form").submit();
}
			</script>
            
           
            
            <!-- User Profile -->
               <div class="container col-md-5">
                
                <div class="card">
                    <div class="card-body">
                    <h2>User Profile</h2>
                    <div class = "userProfile">
                        <div class="col-4 bg-c-lite-green user-profile split left">
                            <div class="card-block text-center">
                              <div class="m-b-25">
                              
                              <img src="https://img.icons8.com/bubbles/100/000000/user.png" class="img-radius" alt="User-Profile-Image">
                              <h5 id="userName"></h5>
                              </div>
                                                               
                            </div>
                        </div>
                        
                        <div class="col-8 details split right" >
                        	<h6 class="m-b-20 p-b-5 b-b-default f-w-600">Information</h6>
                             <div class="row">
                              <div class="col-sm-6">
                              <p class="m-b-10 f-w-600">Email</p>
                              <h6 id="email" class="text-muted f-w-400"></h6>
                              </div>
                             <div class="col-sm-6">
                               <p class="m-b-10 f-w-600">Phone</p>
                               <h6 id="phoneNumber" class="text-muted f-w-400"></h6>
                             </div>
                         	</div>
                        </div>
                        
                        </div>
                    </div>
                </div>
                
            </div>
                        
            <!-- User Profile -->
            
            <div class="container col-md-5">
                <div class="card">
                    <div class="card-body">
                        
                        <c>
                            <form action="insert" method="post">
                        </c>

                        <caption>
                            <h2>
                                <c>
                                    Book a Service
                                </c>
                            </h2>
                        </caption>
                        
                        

                        

                        <fieldset class="form-group">
                            <label>Date</label> <input type="date" class="form-control" name="date" >
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Time</label> <input type="time"  class="form-control" name="time">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Location</label> 
                            <select class="form-control" name="location" >
                            	<option value="" disabled selected hidden>Select your option</option>
    							<option value="Ampara">Ampara</option>
    							<option value="Anuradhapura">Anuradhapura</option>
    							<option value="Badulla">Badulla</option>
    							<option value="Batticaloa">Batticaloa</option>
    							<option value="Colombo">Colombo</option>
    							<option value="Galle">Galle</option>
    							<option value="Gampaha">Gampaha</option>
    							<option value="Hambantota">Hambantota</option>
    							<option value="Jaffna">Jaffna</option>
    							<option value="Kalutara">Kalutara</option>
    							<option value="Kandy">Kandy</option>
    							<option value="Kegalle">Kegalle</option>
    							<option value="Kilinochchi">Kilinochchi</option>
    							<option value="Kurunegala">Kurunegala</option>
    							<option value="Mannar">Mannar</option>
    							<option value="Matale">Matale</option>
    							<option value="Matara">Matara</option>
    							<option value="Monaragala">Monaragala</option>
    							<option value="Mullaitivu">Mullaitivu</option>
    							<option value="Nuwara Eliya">Nuwara Eliya</option>
    							<option value="Polonaruwa">Polonaruwa</option>
    							<option value="Puttalama">Puttalama</option>
    							<option value="Ratnapura">Ratnapura</option>
    							<option value="Trincomalee">Trincomalee</option>
    							<option value="Vavuniya">Vavuniya</option>
  							</select>
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <label>Vehicle Registration Number</label> <input type="text"  class="form-control" name="vehicleNo">
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <label>Mileage</label> <input type="text"  class="form-control" name="mileage">
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <label>Message</label> <input type="text"  class="form-control" name="message">
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <input type="hidden" id="usernameField" name="usernameField" value="">
                        </fieldset>

                        <button id="submit" type="submit" class="btn btn-success">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center">Upcomin Events</h3>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                
                                <th>Date</th>
                                <th>Time</th>
                                <th>Location</th>
                                <th>Vehicle Registration Number</th>
                                <th>Mileage</th>
                                <th>Message</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--   for (Todo todo: todos) {  -->
                            <c:forEach var="user" items="${eventList}">

                                <tr>
                                    <td>
                                        <c:out value="${user.date}" />
                                    </td>
                                    <td>
                                        <c:out value="${user.time}" />
                                    </td>
                                    <td>
                                        <c:out value="${user.location}" />
                                    </td>
                                    <td>
                                        <c:out value="${user.vehicle_no}" />
                                    </td>
                                    <td>
                                        <c:out value="${user.mileage}" />
                                    </td>
                                    <td>
                                        <c:out value="${user.message}" />
                                    </td>
                                    <td><a href="edit?id=<c:out value='${user.id}' />">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="delete?id=<c:out value='${user.id}' />">Delete</a></td>
                                </tr>
                            </c:forEach>
                            <!-- } -->
                        </tbody>

                    </table>
                </div>
            </div>
            
        </body>

        </html>
        
