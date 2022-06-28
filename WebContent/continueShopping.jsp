<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<% 
String email = session.getAttribute("email").toString();
String status = "processing";
try{
	   Connection conn = ConnectionProvider.getConnection();
	   Statement st = conn.createStatement();
	   st.executeUpdate("update cart set status='"+status+"' where email = '"+email+"' and status='bill'" );
	   response.sendRedirect("home.jsp");
}
catch(Exception e){
	System.out.println(e);
}
%>