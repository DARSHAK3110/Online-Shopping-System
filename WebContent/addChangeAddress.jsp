<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="../footer.jsp" %>

<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Action</title>
</head>
<body>
<%
     String message = request.getParameter("msg");
     if("done".equals(message)){
    	 %>

<h3 class="alert">Address Successfully Updated !</h3>
  <% } %>

<%
     if("undone".equals(message)){
    	 %>

<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
  <% } %>

<form action="changeAddressAction.jsp" method="post">


<h3>Enter Address</h3>
<input class="input-style" type="text" name="address" placeholder="Enter Address" required/>
 
 <hr>
 <h3>Enter city</h3>
 <input class="input-style" type="text" name="city" placeholder="Enter City" required/>
 
<hr><button class="button" type="submit">Change Address<i class='far fa-arrow-alt-circle-right'></i></button>
 

</form>

</body>
<br><br><br>
</html>