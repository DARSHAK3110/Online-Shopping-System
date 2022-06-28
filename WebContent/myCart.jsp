<%@include file="header.jsp"%>
<%@include file="footer.jsp" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>

<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
     String message = request.getParameter("msg");
     if("noMore".equals(message)){
    	 %>
	
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
  <% } %>

<%
     if("inr".equals(message)){
    	 %>
	
<h3 class="alert">Quantity  Increased Successfully!</h3>
  <% } %>

<%
     if("dec".equals(message)){
    	 %>
<h3 class="alert">Quantity  Decreased Successfully!</h3>	
  <% } %>

<%
     if("rem".equals(message)){
    	 %>
	
<h3 class="alert">Product Successfully Removed!</h3>
	<% } %>
<table>
<thead>
<%
try{
	int cart_total=0;
	int index=0;
	   Connection conn = ConnectionProvider.getConnection();
	   Statement st = conn.createStatement();
	   ResultSet rs = st.executeQuery("select sum(total) from cart where email = '"+email+"' and address is NULL" );
	   while(rs.next()){
		   cart_total = rs.getInt(1);
	   }
 %>

          <tr>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(cart_total);%></th>
            <%if(cart_total>0){ %><th scope="col"><a href="addressPaymentForOrder.jsp" method="post">Proceed to order</a></th><%} %>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
        <% ResultSet r1 = st.executeQuery("select * from product inner join cart where cart.product_id=product.id and cart.email='"+email+"' and address is NULL"); 
        while(r1.next()){
        index=index+1;	
      %>
          <tr>
		
           <td><%=index %></td>
            <td><%=r1.getString(2) %></td>
            <td><%=r1.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=r1.getString(4) %> </td>
            <td><a href="updateQuantity.jsp?id=<%=r1.getString(1) %>&quantity=inr"><i class='fas fa-plus-circle'></i></a> <%=r1.getString(8)%><a href="updateQuantity.jsp?id=<%=r1.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i><%=r1.getString(10)  %> </td>
            <td><a href="removeProduct.jsp?id=<%=r1.getString(1)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>
<%
        }
        }
catch(Exception e){
}%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>