<%@include file="header.jsp"%>
<%@include file="footer.jsp" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<%
     String message = request.getParameter("msg");
     if("added".equals(message)){
    	 %>
	
<h3 class="alert">Product added successfully!</h3>
  <% } %>

<%
if("exist".equals(message)){
	 %>

  
<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
<% } %>
<%      if("invalid".equals(message)){
	 %>
		
<h3 class="alert">Something went Wrong!</h3>
<% } %>


<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
 <% 
 
       try{
    	   session.setAttribute("email",email);
   		
    	   Connection conn = ConnectionProvider.getConnection();
    	   Statement st = conn.createStatement();
    	   ResultSet rs = st.executeQuery("select * from product where active='YES'" );
    	   while(rs.next()){
       %>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i></i><%=rs.getString(4)%></td>
            <td><a href="addToCartAct.jsp?id=<%=rs.getString(1)%>"><i class='fas fa-cart-plus'> Add to cart</i></a></td>
          </tr>
 <%
    	   }
       }
       catch(Exception e){
    	   System.out.println(e);
       }
       %>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>