<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
try{
	Connection conn = ConnectionProvider.getConnection();
	Statement statement = conn.createStatement();
	//String q1 = "create table student (name varchar(30), enroll_no int primary key, mobileNumber varchar(15), address varchar(100))";
	//String q1 = "create table users (name varchar(100), email varchar(100) primary key, mobileNumber varchar(15), securityQuestions varchar(200), answer varchar(100), password varchar(100), address varchar(100), city varchar(100), state varchar(100), country varchar(100))";
	//String q2 = "create table product (id int,p_name varchar(200), category varchar(200), price int, active varchar(10))";
	//String q3 = "create table cart(email varchar(100), product_id int, quality int, price int, total int, address varchar(100), city varchar(20),mobileNumber bigInt, orderDate varchar(20), deliveryDate varchar(20), paymentMethod varchar(20), transactionId varchar(20), status varchar(10) )";
	String q4 = "create table message(id int AUTO_INCREMENT primary key,email varchar(100), subject varchar(50),body varchar(100))";	
	//statement.execute(q1);
	//statement.execute(q2);
	//statement.execute(q3);
	statement.execute(q4);
	System.out.print("Table Created!");
	conn.close();
}
catch(Exception e){
	System.out.println(e);
}

%>