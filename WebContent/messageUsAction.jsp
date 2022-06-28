<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String title= request.getParameter("title");
String body = request.getParameter("body");
int check=0;
try{
	Connection conn = ConnectionProvider.getConnection();
	PreparedStatement ps = conn.prepareStatement("insert into message (email,subject,body)values(?,?,?)");
	ps.setString(1,email);
	ps.setString(2,title);
	ps.setString(3,body);
	ps.executeUpdate();
	response.sendRedirect("messageUs.jsp?msg=done");
	
}
catch(Exception e){
	response.sendRedirect("messageUs.jsp?msg=undone");

}

%>