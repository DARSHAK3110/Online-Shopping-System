<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<% 
String id = request.getParameter("id");
String email = request.getParameter("email");
String status= "cancel";

try{
	Connection conn = ConnectionProvider.getConnection();
	Statement st = conn.createStatement();
	st.executeUpdate("update cart set status='"+status+"'where product_id='"+id+"' and email='"+email+"' and address is not NULL");
	response.sendRedirect("ordersReceived.jsp?msg=cancel");
}
catch(Exception e){

	response.sendRedirect("ordersReceived.jsp?msg=wrong");
	System.out.println(e);
}
%>