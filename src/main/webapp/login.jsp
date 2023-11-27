<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AutoReserveHub</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

	<div class="container col-md-5">
                
                <div class="card">
                    <div class="card-body">
                    	<h2>Welcome To AutoReserveHub</h2>
                    <div class = "functions">
                        <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Sign in</a>
                        <a href="https://api.asgardeo.io/t/autoreservehub/oauth2/authorize?response_type=code&client_id=aeafyhTZm8M7w7ibilGtrWTBGgAa&scope=openid email phone profile%20profile&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2FAutoReserveHub%2Fauth.jsp" class="btn btn-success">Log in</a>
                        
                    </div>
                    </div>
                </div>
                
     </div>
                        

</body>
</html>