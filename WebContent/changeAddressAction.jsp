<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String address = request.getParameter("address");
String city = request.getParameter("city");

try{
	Connection conn = ConnectionProvider.getConnection();
	PreparedStatement st = conn.prepareStatement("update users set address=?, city=? where email='"+email+"'");
	st.setString(1, address);
	st.setString(2, city);
	st.executeUpdate();
	response.sendRedirect("addChangeAddress.jsp?msg=done");
}
catch(Exception e){
	response.sendRedirect("addChangeAddress.jsp?msg=undone");
}

%>