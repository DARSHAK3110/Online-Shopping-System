<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Password</title>
</head>
<body>
<%
     String message = request.getParameter("msg");
     if("noMatch".equals(message)){
    	 %>

<h3 class="alert">New password and Confirm password does not match!</h3>
  <% } %>
<%
     if("wrong".equals(message)){
    	 %>

<h3 class="alert">Your old Password is wrong!</h3>
  <% } %>
<%
     if("done".equals(message)){
    	 %>

<h3 class="alert">Password change successfully!</h3>
  <% } %>

<form action="changePassAction.jsp" method="post">
<h3>Enter Old Password</h3>
<input class="input-style" type="password" name="oldpass" placeholder="Enter Old Password" required/>
  
  <hr>
 <h3>Enter New Password</h3>
<input class="input-style" type="password" name="newpass" placeholder="Enter New Password" required/>
 
 <hr>
<h3>Enter Confirm Password</h3>
<input class="input-style" type="password" name="confpass" placeholder="Enter Confirm Password" required/>

<hr>
<button class="button" type="submit" required>Save
 <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>