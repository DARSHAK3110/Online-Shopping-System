<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<% 
String id = request.getParameter("id");
String name = request.getParameter("name");
String category = request.getParameter("category");
String price = request.getParameter("price");
String active = request.getParameter("active");

try{
	Connection conn = ConnectionProvider.getConnection();
	Statement st = conn.createStatement();
	st.executeUpdate("update product set p_name='"+name+"',category='"+category+"',price='"+price+"',active='"+active+"' where id='"+id+"'");
	if(active.equals("NO")){
		st.executeQuery("delete from cart where product_id='"+id+"' and address is NULL");			
	}
	response.sendRedirect("allProductEditProduct.jsp?msg=done");
}
catch(Exception e){

	response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
	System.out.println(e);
}
%>