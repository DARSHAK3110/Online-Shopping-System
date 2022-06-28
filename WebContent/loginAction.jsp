<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String password = request.getParameter("password");
String email = request.getParameter("email");

if("admin@gmail.com".equals(email) && "123456789".equals(password) ){
	session.setAttribute("email",email);
	response.sendRedirect("admin/adminHome.jsp");
}
else{
	int x = 0;
	try{

		Connection conn = ConnectionProvider.getConnection();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("select * from users where email = '"+email+"' and password = '"+password+"'");
		while(rs.next()){
				
		x=1;
		session.setAttribute("email",email);
		response.sendRedirect("home.jsp");
	}
		if(x==0){
			response.sendRedirect("login.jsp?msg=nonexist");
		}
	}
	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("login.jsp?msg=invalid");
	}
}
%>