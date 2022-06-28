<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
    <% String email = session.getAttribute("email").toString();%>
            <center><h2>Online shopping</h2></center>
            <h2><a href=""> <i class='fas fa-user-alt'></i><%=email %></a></h2>
            <a href="home.jsp"><i class="fa fa-institution"></i>Home</a>
            <a href="myCart.jsp"><i class='fas fa-cart-arrow-down'></i>My Cart</a>
            <a href="myOrders.jsp"><i class='fab fa-elementor'></i>My Orders  </a>
            <a href="changeDetails.jsp"><i class="fa fa-edit">Change Details </i></a>
            <a href="messageUs.jsp"><i class='fas fa-comment-alt'></i>Message Us </a>
            <a href="about.jsp"><i class="fa fa-address-book"></i>About </a>
            <a href="logout.jsp"><i class='fas fa-share-square'></i>Logout </a>
            <div class="search-container">
             <form action="searchHome.jsp" method="post">
             
             <input type="text" name ="search" placeholder="search"/>
             <button type="submit"/>
             </form>
               
                <i class="fa fa-search"></i>
             
            </div>
          </div>
           <br>
           <!--table-->
