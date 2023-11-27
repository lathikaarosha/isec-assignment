<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String code = request.getParameter("code");
    String sessionState = request.getParameter("session_state");

    HttpSession loginSession = request.getSession();
    loginSession.setAttribute("isLoggedIn", true);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <script type="text/javascript">
        function exchangeAuthorizationCode() {
            var code = '<%= code %>'; 
            var client_id = 'aeafyhTZm8M7w7ibilGtrWTBGgAa';
            var client_secret = 'KtZZDaqgB235bcveUozy_IF_MDmlsg4ftjtgKLS_W0oa';
            var redirect_uri = 'http://localhost:8080/AutoReserveHub/auth.jsp';

            // Construct the token request data
            var requestData = {
                code: code,
                grant_type: 'authorization_code',
                client_id: client_id,
                client_secret: client_secret,
                redirect_uri: redirect_uri
            };

            // Make the POST request to the token endpoint
            $.ajax({
                url: 'https://api.asgardeo.io/t/autoreservehub/oauth2/token',
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                data: requestData,
                success: function(response) {
                    // Handle the response here
                    console.log('Access Token:', response.access_token);
                    console.log('ID Token:', response.id_token);

                    // Store the tokens in local storage
                    localStorage.setItem('access_token', response.access_token);
                    localStorage.setItem('id_token', response.id_token);
                    
                    // Create an HTTP-only cookie named 'access_token'
                    document.cookie = "access_token=" + response.access_token + "; SameSite=Lax; HttpOnly; Secure";
                    
                    // Redirect to the desired URL
                    window.location.href = "http://localhost:8080/AutoReserveHub/";
                },
                error: function(error) {
                    // Handle errors here
                    console.error('Error:', error);
                }
            });
        }

        exchangeAuthorizationCode();
    </script>
</body>
</html>