<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
   <form action="signupAction.jsp" method = "post" name='myform'>
     <input type="text" placeholder = "Enter Your UserName " name ="name" required/> 
     <input type="email" placeholder = "Enter Your Email  " name ="email" required/> 
     <input type="number" placeholder = "Enter Your Mobile Number  " name ="mobileNumber" min="999999999" max="10000000000" required/> 
     <select name ="securityQuestion">
     <option value="The name of a college you applied to but did not attend">The name of a college you applied to but did not attend</option>
     <option value="The name of your first stuffed toy">The name of your first stuffed toy</option>
     <option value="First name of your driving instructor">Your driving first name of instructor </option>
     <option value="Surname of math teacher  in your 8th year of school">Surname of your math teacher in your 8th year of school</option>
     <option value="The first school you remember attending">The name of the first school you remember attending</option>
     <option value="The destination of your most memorable school field trip">The destination of your most memorable school field trip</option>
     </select>
     
     <input type="text" placeholder = "Enter answer according choose you menu " name ="answer" required/> 
     <input type="password" placeholder = "Enter Your Password " name ="password" required/> 
     <input type="submit" value = "submit " onclick="return validate();" />
     </form>
     <h3><a href="login.jsp">Login</a></h3>
     <%
     String message = request.getParameter("msg");
     if("valid".equals(message)){
    	 %>
	<h4>Successfully Updated</h4>
  <% } %>
     <%if("invalid".equals(message)){
    	 %>
	<h4>Some thing Went Wrong! Try Again !</h4>
  
  <% } %>
     
     
        
	
  </div>
  <div class='whysign'>

    <h2>AJ Project</h2>
    <h3>Online Shopping</h3>
    <h3>Group members</h3>
    <h4>Darshil Patel - 190130107081</h4>
    <h4>Ajay Prajapati - 190130107112</h4>
    <h4>Jeel Viradiya- 190130107145</h4>
    <h4>Darshak Zadafiya - 190130107149</h4>
  </div>
</div>

</body>
</html>