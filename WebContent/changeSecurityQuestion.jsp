<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="../footer.jsp" %>

<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
</head>
<body>
<%
     String message = request.getParameter("msg");
     if("done".equals(message)){
    	 %>

<h3 class="alert">Your security Question successfully changed !</h3>
  <% } %>
<%
     if("undone".equals(message)){
    	 %>

<h3 class="alert">Your Password is wrong!</h3>
  <% } %>



<form action="changeSecurityQuestionAction.jsp" method="post">

<h3>Select Your New Securtiy Question</h3>
<select class="input-style" name ="securityQuestion">
     <option value="The name of a college you applied to but did not attend">The name of a college you applied to but did not attend</option>
     <option value="The name of your first stuffed toy">The name of your first stuffed toy</option>
     <option value="First name of your driving instructor">Your driving first name of instructor </option>
     <option value="Surname of math teacher  in your 8th year of school">Surname of your math teacher in your 8th year of school</option>
     <option value="The first school you remember attending">The name of the first school you remember attending</option>
     <option value="The destination of your most memorable school field trip">The destination of your most memorable school field trip</option>
     </select>
       
 <hr>
 <h3>Enter Your New Answer</h3>
 <input type="text" class="input-style" placeholder = "Enter answer according choose you menu " name ="new_answer" required/> 
     
<hr>
<h3>Enter Password (For Security)</h3>
<input type="password" class="input-style" placeholder = "Enter Your Password " name ="password" required/> 
     
<hr>
<button class="button" type="submit">Change Security Question <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>