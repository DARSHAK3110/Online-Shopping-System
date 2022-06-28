<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String product_id = request.getParameter("id");
String status = request.getParameter("quantity");
int product_total=0;
int price=0;
int quantity=1;
try{
	Connection conn = ConnectionProvider.getConnection();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("select * from cart where email = '"+email+"' and product_id = '"+product_id+"' and address is NULL ");
	while(rs.next()){
		quantity = rs.getInt(3); 
		price=rs.getInt(4); 
		product_total=rs.getInt(5);
	}
	if( quantity==1 && status.equals("dec")){
		response.sendRedirect("myCart.jsp?msg=noMore");
	}
	else if( quantity!=1 && status.equals("dec")){
		quantity-=1;
		product_total-=price;
		st.executeUpdate("update cart set quality='"+quantity+"', total='"+product_total+"' where email = '"+email+"' and product_id = '"+product_id+"' and address is NULL ");
		response.sendRedirect("myCart.jsp?msg=dec");
		
	}
	else{
		quantity+=1;
		product_total+=price;
		st.executeUpdate("update cart set quality='"+quantity+"', total='"+product_total+"' where email = '"+email+"' and product_id = '"+product_id+"' and address is NULL ");
		response.sendRedirect("myCart.jsp?msg=inr");
		}
	
}
catch(Exception e){
	System.out.println(e);
}
%>