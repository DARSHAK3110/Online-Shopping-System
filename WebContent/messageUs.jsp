<%@include file="header.jsp"%>
<%@include file="footer.jsp" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="css/messageUs.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>
<%
     String message = request.getParameter("msg");
     if("done".equals(message)){
    	 %>
<h3 style="text-align:center; color:yellow;">Message successfully sent. Our team will contact you soon!</h3>
  <% } %>
<%
     if("undone".equals(message)){
    	 %>
<h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>
  <% } %>

<form action ="messageUsAction.jsp" method="post">
 <input type="text" class="input-style" placeholder = "Enter message title" name ="title" required/> 
 <br>
 <textarea style="border-color: black"class="input-style" placeholder = "Enter message" name ="body" required></textarea>
 <br>
 <button class="button" type="submit">Send<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
 

<br><br><br>
</body>
</html>