<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<% 
String email = session.getAttribute("email").toString();
String product_id = request.getParameter("id");
int z=0;
int cart_total = 0;
int product_total=0;
int product_price=1;
int quantity=1;


try{
	Connection conn =ConnectionProvider.getConnection();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("select * from product where id='"+product_id+"'");
	while(rs.next()){
		product_price = rs.getInt(4);
		product_total = product_price;
	}
	ResultSet rs1 = st.executeQuery("select * from cart where product_id='"+product_id+"'and email='"+email+"'and address is NULL");
	while(rs1.next()){
		quantity = rs1.getInt(3);
		quantity+=1;
		cart_total = rs1.getInt(5);
		cart_total += product_total; 
		z=1;
	}
	if(z==0){
		PreparedStatement ps = conn.prepareStatement("insert into cart(email,product_id,quality,price,total)values(?,?,?,?,?)");

		System.out.println(email+product_id+quantity+product_price+cart_total);
		ps.setString(1,email);
		ps.setString(2,product_id);
		ps.setInt(3,quantity);
		ps.setInt(4,product_price);
		ps.setInt(5,product_total);
		System.out.println("km cho1");
		ps.executeUpdate();

		System.out.println("km cho");
		response.sendRedirect("home.jsp?msg=added");
	}
	if(z==1){
		st.executeUpdate("update cart set quality='"+quantity+"',total='"+cart_total+"' where email='"+email+"' and product_id = '"+product_id+"' and address is NULL");
		response.sendRedirect("home.jsp?msg=exist");
	}
}
catch(Exception e){
	response.sendRedirect("home.jsp?msg=invalid");
}
%>