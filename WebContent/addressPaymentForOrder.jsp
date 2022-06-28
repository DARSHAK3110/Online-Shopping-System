<%@include file="footer.jsp" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script>
if(window.history.forward(1)!= null)
	window.history.forward(1);
</script>
</head>
<body>
<br>
<table>
<thead>
<%
String email = session.getAttribute("email").toString();

int cart_total=0;
int index=0;

try{
	   Connection conn = ConnectionProvider.getConnection();
	   Statement st = conn.createStatement();
	   ResultSet rs = st.executeQuery("select sum(total) from cart where email = '"+email+"' and address is NULL" );
	   while(rs.next()){
		   cart_total = rs.getInt(1);
	   }
%>
          <tr>
          <th scope="col"><a href=""><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(cart_total); %></th>
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
            <td><i class="fa fa-inr"></i><%=r1.getString(4) %></td>
            <td><%=r1.getString(8)%>   </td>
            <td><i class="fa fa-inr"></i> <%=r1.getString(10)%>  </td>
            </tr>
        <%}
        ResultSet rs1 = st.executeQuery("select * from users where email='"+email+"' ");
        while(rs1.next()){ %>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form method="post" action="addressPaymentForOrderAction.jsp">
 <div class="left-div">
 <h3>Enter Address</h3>
<input class="input-style" type="text" name="address" value="<%rs1.getString(7); %>" placeholder="Enter Address" required/>
 </div>

<div class="right-div">
<h3>Enter city</h3>
<input class="input-style" type="text" name="city" value="<%rs1.getString(8); %>" placeholder="Enter City" required/>
</div> 
<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
<select class="input-style" name="paymentMethod" required>
<option value="cod">COD</option>
<option value="online">ONLINE</option>
</select> 
</div>

<div class="right-div">
<h3>Pay online on this ajproject@paykardo</h3>

<input class="input-style" type="text" name="transactionId" placeholder="Enter Transaction Id" />
<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input class="input-style" type="number" name="mobileNumber" value="<%rs1.getString(3); %>"placeholder="Enter Mobile No." required/>

<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>
<button class="button" type="submit">Generate bill!<i class='far fa-arrow-alt-circle-right'></i></button>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>

<%
}
}
catch(Exception e){
	System.out.println(e);
}
%>
      <br>
      <br>
      <br>

</body>
</html>