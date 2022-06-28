<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Home</title>
<style>
.th-style
{ width: 25%;}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Orders Received <i class="fas fa-archive"></i></div>


<%
     String message = request.getParameter("msg");
     if("cancel".equals(message)){
    	 %>

<h3 class="alert">Order Cancel Successfully!</h3>
  <% } %>


<%
     if("wrong".equals(message)){
    	 %>

<h3 class="alert">Some thing went wrong! Try Again!</h3>
  <% } %>

<%
     if("done".equals(message)){
    	 %>

<h3 class="alert">Successfully Updated!</h3>
  <% } %>




<table id="customers">
          <tr>
          <th>Sr.no.</th>
          <th>Mobile Number</th>
            <th scope="col">Product Name</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th>Address</th>
            <th>City</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">T-ID</th>
              <th scope="col">Status</th>
              <th scope="col">Cancel order <i class='fas fa-window-close'></i></th>
              <th scope="col">Order Delivered <i class='fas fa-dolly'></i></i></th>
          </tr>
        
       <%
try{
	int index=0;
	   Connection conn = ConnectionProvider.getConnection();
	   Statement st = conn.createStatement();
	   ResultSet r1 = st.executeQuery("select * from product inner join cart where cart.product_id=product.id and cart.orderDate is not NULL and cart.status='processing'" );

	   while(r1.next()){
		   index=index+1;
	   
 %>
          <tr>
          <td><%=index%></td>
            <td><%=r1.getString(13) %></td>
            <td><%=r1.getString(2) %></td>
            <td><%=r1.getString(8) %></td>
            <td><i class="fa fa-inr"></i><%=r1.getString(10) %>  </td>
                <td><%=r1.getString(11) %></td>
                 <td><%=r1.getString(12) %></td>
             <td><%=r1.getString(14) %></td>
              <td><%=r1.getString(15) %></td>
               <td><%=r1.getString(16) %></td>
               <td><%=r1.getString(17) %></td>
               <td><%=r1.getString(18) %></td>
               <td><a href="cancelOrdersAction.jsp?id=<%=r1.getString(7)%>&email=<%=r1.getString(6) %>">Cancel <i class='fas fa-window-close'></i></a></td>
                <td><a href="deliveredOrdersAction.jsp?id=<%=r1.getString(7)%>&email=<%=r1.getString(6) %>">Delivered <i class='fas fa-dolly'></i></i></a></td>
            </tr>
         <%
        }
        }
catch(Exception e){
}%>
         
        </table>
      <br>
      <br>
      <br>

</body>
</html>