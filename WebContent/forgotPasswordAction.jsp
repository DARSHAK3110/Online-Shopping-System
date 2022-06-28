<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String newPassword = request.getParameter("newPassword");

	int check = 0;
	try{

		Connection conn = ConnectionProvider.getConnection();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("select * from users where email='"+email+"' and mobileNumber='"+mobileNumber+"' and securityQuestions='"+securityQuestion+"'and answer='"+answer+"'" );
		while(rs.next()){
		System.out.print("hii");		
		check=1;
		st.executeUpdate("update users set password= '"+newPassword+"' where email = '"+ email +"'");
		response.sendRedirect("forgotPassword.jsp?msg=done");
	}
		if(check==0){
			response.sendRedirect("forgotPassword.jsp?msg=invalid");
		}
	}
	catch(Exception e){
		System.out.println(e);
	}

%>