
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String oldpass = request.getParameter("oldpass");
String newpass = request.getParameter("newpass");
String confpass = request.getParameter("confpass");

if(!newpass.equals(confpass)){
	response.sendRedirect("changePassword.jsp?msg=noMatch");
}
else{
	int z=0;
	try{
		Connection conn = ConnectionProvider.getConnection();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("select * from users where email='"+email+"' and password = '"+oldpass+"'");
		while(rs.next()){
				z=1;
				st.executeUpdate("update users set password='"+newpass+"' where email='"+email+"'");
				response.sendRedirect("changePassword.jsp?msg=done");
			}
		if(z==0){
				response.sendRedirect("changePassword.jsp?msg=wrong");
		}
	}
	catch(Exception e){
		response.sendRedirect("changePassAction.jsp?msg=undone");
	}

%>