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
            <center><h2>Change Details<i class="fa fa-edit"></i></h2></center>
            <h2><a href="changeDetails.jsp"><i class='fas fa-arrow-circle-left'>Back</i></a></h2>
            <%String email = session.getAttribute("email").toString(); %>
            <h2><a href=""><i class='fas fa-user-alt'></i>Your Profile(<%=email %>) </a> </h2>
            <a href="changePassword.jsp"><i class='fas fa-key'> Change Password</i></a>
            <a href="addChangeAddress.jsp"><i class='fas fa-map-marker-alt'> Add or change Address</i></a>
            <a href="changeSecurityQuestion.jsp"><i class="fa fa-repeat"></i> Change Security Question </a>
            <a href="changeMobileNumber.jsp"><i class='fas fa-phone'></i> Change Mobile Number </a>
          </div>
           <br>
           <!--table-->
