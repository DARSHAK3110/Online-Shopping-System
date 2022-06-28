<%@include file="header.jsp"%>
<%@include file="footer.jsp" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<% 
int z=0;
System.out.println("hii");
String product_id = "1";
int quantity = 1;
int product_total=0;
int cart_total=0;
int product_price=0;
System.out.println(email);

try{
	Connection conn =ConnectionProvider.getConnection();

	System.out.println("hii");
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("select * from product where id='"+product_id+"'");
	while(rs.next()){
		System.out.println("hii6");
		product_price = rs.getInt(4);
		product_total = product_total;
	}
	ResultSet c_rs = st.executeQuery("select * from cart where product_id='"+product_id+"'and email='"+email+"'and address is NULL");
	while(c_rs.next()){
		quantity = c_rs.getInt(3);
		System.out.println("hii1");
		quantity+=1;
		cart_total = c_rs.getInt(5);
		cart_total += product_total; 
		z=1;
	}
	if(z==0){
		PreparedStatement ps = conn.prepareStatement("insert into cart(email,product_id,quantity,price,total) values(?,?,?,?,?)");

		System.out.println("hii3");ps.setString(1,email);
		ps.setString(1,product_id);
		ps.setInt(3,quantity);
		ps.setInt(4,product_price);
		ps.setInt(5,cart_total);
		ps.executeUpdate();
		response.sendRedirect("home.jsp?msg=added");
	}
	if(z==1){
		st.executeUpdate("update cart set quantity='"+quantity+"',total='"+cart_total+"' where email='"+email+"' and product_id = '"+product_id+"' and address is NULL");
		response.sendRedirect("home.jsp?msg=exist");
	}
}
catch(Exception e){
	response.sendRedirect("home.jsp?msg=invalid");
}
%>