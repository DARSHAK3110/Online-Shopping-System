<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>

<%
     String message = request.getParameter("msg");
     if("done".equals(message)){
    	 %>
<h3 class="alert">Product Added Successfully!</h3>
  <% } %>
     <%if("wrong".equals(message)){
    	 %>
		<h3 class="alert">Some thing went wrong! Try Again!</h3>
  
  <% } %>
  
<%
int i=1;
try{
Connection conn = ConnectionProvider.getConnection();
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery("select max(id) from product");
while(rs.next()){
	i = rs.getInt(1);
	i=i+1;
}
	
}
catch(Exception e){
	System.out.println(e);
} %>
<form action="addNewProductAction.jsp" method="post">
<h3 style="color: yellow;">Product ID: <%out.println(i);%> </h3>

<input type="hidden" name ="id" value="<%out.println(i);%>"/>
<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="name" placeholder="Enter name" required/>
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 <input class="input-style" type="text" name="category" placeholder="Enter Category" required/>
 
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input class="input-style" type="number" name="price" placeholder="Enter Price" required/>
 
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
 <select class="input-style" name="active" required>
 <option value="YES">YES</option>
  <option value="NO">NO</option>
 </select>
   
<hr>
</div>
 <button class="button">Add<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>