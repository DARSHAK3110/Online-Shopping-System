<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String mobile_number= request.getParameter("mobileNumber");
String password = request.getParameter("password");
int check=0;
try{
	Connection conn = ConnectionProvider.getConnection();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("select * from users where email='"+email+"' and password = '"+password+"'");
	while(rs.next()){
		check=1;
		st.executeUpdate("update users set mobileNumber ='"+mobile_number+"' where email='"+email+"'and password = '"+password+"'");
		response.sendRedirect("changeMobileNumber.jsp?msg=done");	
	}
	if(check==0){	

		response.sendRedirect("changeMobileNumber.jsp?msg=undone");
	}
	}
catch(Exception e){
	System.out.println(e);
}

%>