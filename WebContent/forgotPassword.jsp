<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
<style>
.signup {
margin: auto;
width: 50%;
padding: auto;
</style>
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form action="forgotPasswordAction.jsp" method = "post">
     <input type="email" placeholder = "Enter Your Email  " name ="email" required/> 
     <input type="number" placeholder = "Enter Your Mobile Number  " name ="mobileNumber" required/> 
     <select name ="securityQuestion">
     <option value="The name of a college you applied to but did not attend">The name of a college you applied to but did not attend</option>
     <option value="The name of your first stuffed toy">The name of your first stuffed toy</option>
     <option value="First name of your driving instructor">Your driving first name of instructor </option>
     <option value="Surname of math teacher  in your 8th year of school">Surname of your math teacher in your 8th year of school</option>
     <option value="The first school you remember attending">The name of the first school you remember attending</option>
     <option value="The destination of your most memorable school field trip">The destination of your most memorable school field trip</option>
     </select>
     <input type="text" placeholder = "Enter answer according choose you menu " name ="answer" required/> 
     <input type="password" placeholder = "Enter Your New Password " name ="newPassword" required/> 
     <input type="submit" value = "submit " />
     </form>

      <h2><a href="login.jsp">Login</a></h2>
      
      <%
     String message = request.getParameter("msg");
     if("done".equals(message)){
    	 %>
     <h3>Password Changed Successfully!</h3>
  <% } %>
     <%if("invalid".equals(message)){
    	 %>
		<h3>Some thing Went Wrong! Try Again !</h3>
  <% } %>
  

  </div>
  </div>
</body>
</html>