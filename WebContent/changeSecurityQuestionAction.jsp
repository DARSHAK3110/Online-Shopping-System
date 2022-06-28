<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String new_answer= request.getParameter("new_answer");
String securityQuestion= request.getParameter("securityQuestion");
String password = request.getParameter("password");
int check=0;
try{
	Connection conn = ConnectionProvider.getConnection();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("select * from users where email='"+email+"' and password = '"+password+"'");
	while(rs.next()){
		check=1;
		st.executeUpdate("update users set securityQuestions = '"+securityQuestion+"',answer ='"+new_answer+"' where email='"+email+"'and password = '"+password+"'");
		response.sendRedirect("changeSecurityQuestion.jsp?msg=done");	
	}
	if(check==0){	

		response.sendRedirect("changeSecurityQuestion.jsp?msg=undone");
	}
	}
catch(Exception e){
	System.out.println(e);
}

%>