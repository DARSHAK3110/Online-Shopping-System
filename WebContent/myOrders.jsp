<%@include file="header.jsp"%>
<%@include file="footer.jsp" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Orders <i class='fab fa-elementor'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">category</th>
            <th scope="col"><i class="fa fa-inr"></i>  Price</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">Status</th>
              
          </tr>
        </thead>
        <tbody>
<%
try{
	int index=0;
	   Connection conn = ConnectionProvider.getConnection();
	   Statement st = conn.createStatement();
	   ResultSet r1 = st.executeQuery("select * from product inner join cart where cart.product_id=product.id and cart.email='"+email+"' and orderDate is not NULL"); 
       while(r1.next()){
       index=index+1;	
     %>
          <tr>
            <td><%=index %></td>
            <td><%=r1.getString(2) %></td>
            <td><%=r1.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=r1.getString(9) %> </td>
            <td><%=r1.getString(8) %></td>
            <td><i class="fa fa-inr"></i><%=r1.getString(10) %> </td>
             <td><%=r1.getString(14) %></td>
              <td><%=r1.getString(15) %></td>
               <td><%=r1.getString(16) %></td>
               <td><%=r1.getString(18) %></td>
            </tr>
  <%} %>       
        </tbody>
      </table>
      <br>
      <br>
      <br>
<%
}
       catch(Exception e){
       System.out.println(e);
       }%>
</body>
</html>