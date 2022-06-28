
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<style>
.signup {
margin: auto;
width: 50%;
padding: auto;
</style>
<title>Login</title>
</head>
<body>
<div id='container' >
  <div class='signup'>
  <form method = "post" action= "loginAction.jsp">
  <input type = "email" name="email" placeholder = "Enter email" required>
  <input type = "password" name="password" placeholder = "Enter password" required>
  <input type = "submit" value="submit"/>
  </form>
  <h2><a href="signup.jsp">SignUp</a></h2>
       <h2><a href="forgotPassword.jsp">Forgot Password?</a></h2>
  
  <%
     String message = request.getParameter("msg");
     if("nonexist".equals(message)){
    	 %>
	<h3>Incorrect Username or Password</h3>
  <% } %>
     <%if("invalid".equals(message)){
    	 %>
	<h3>Some thing Went Wrong! Try Again !</h3>
  <% } %>
  </div>
  </div>
</body>
</html>