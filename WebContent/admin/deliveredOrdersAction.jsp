<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<% 
String id = request.getParameter("id");
String email = request.getParameter("email");
String status= "delivered";

try{
	Connection conn = ConnectionProvider.getConnection();
	Statement st = conn.createStatement();
	st.executeUpdate("update cart set status='"+status+"'where product_id='"+id+"' and email='"+email+"' and address is not NULL");
	response.sendRedirect("ordersReceived.jsp?msg=done");
}
catch(Exception e){

	response.sendRedirect("ordersReceived.jsp?msg=wrong");
	System.out.println(e);
}
%>