<%@include file="footer.jsp" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
</head>
<body>
<%
String email = session.getAttribute("email").toString();
int cart_total=0;
int index=0;
try{
Connection conn = ConnectionProvider.getConnection();
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery("select sum(total) from cart where email = '"+email+"' and status='bill'" );
while(rs.next()){
	   cart_total = rs.getInt(1);
}
%>
<h3>Online shopping Bill</h3>
<hr>
<%
ResultSet rs1 = st.executeQuery("select * from users inner join cart where cart.email = '"+email+"' and cart.status='bill'" );
while(rs1.next()){ %>
<div class="left-div"><h3>Name: <%=rs1.getString(1) %> </h3></div>
<div class="right-div-right"><h3>Email: <%=email %></h3></div>
<div class="right-div"><h3>Mobile Number:  <%=rs1.getString(3) %>   </h3></div>  

<div class="left-div"><h3>Order Date: <%=rs1.getString(17) %>  </h3></div>
<div class="right-div-right"><h3>Payment Method:<%=rs1.getString(19) %>   </h3></div>
<div class="right-div"><h3>Expected Delivery: <%=rs1.getString(18) %>  </h3></div> 

<div class="left-div"><h3>Transaction Id: <%=rs1.getString(20) %>  </h3></div>
<div class="right-div-right"><h3>City: <%=rs1.getString(15) %>  </h3></div> 
<div class="right-div"><h3>Address: <%=rs1.getString(14) %>  </h3></div> 

<hr>
<% break;} %>
		
	<br>
	

<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>category</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  <%index=index+1;
  ResultSet rs2 = st.executeQuery("select * from product inner join cart where cart.product_id=product.id and cart.email='"+email+"' and cart.status='bill'"  );
  while(rs2.next()){

  %>
  <tr>
    <td><%=index %></td>
    <td><%=rs2.getString(2) %></td>
    <td><%=rs2.getString(3) %></td> 
    <td><i class="fa fa-inr"></i><%=rs2.getString(4) %> </td>
    <td><%=rs2.getString(8)%></td>
	<td><i class="fa fa-inr"></i><%=rs2.getString(10)  %> </td>
         <%} %>   
  </tr>
  <tr>

</table>
<h3>Total: <%= cart_total %></h3>
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
<%
	
}
catch(Exception e){
System.out.println(e);
}%>
</body>
</html>