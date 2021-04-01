<%@ page import= "java.util.*" %>
<%@ page import= "Model.Type" %>
<%
	Type typeDetails = new Type();
	ArrayList allCategory = typeDetails.getAllType();
%>
<html>
<head>
<title>Online Book Store</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/jquery.validate.js"></script>
<style>
.ui-datepicker {
	font-family: "Trebuchet MS", "Helvetica", "Arial",  "Verdana", "sans-serif";
	font-size: 12px;
}
.ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year {
	float:left;
}
</style>
<script>
jQuery('document').ready(function() {
	jQuery("#Form").validate();
});
</script>
</head>
<body id="top">
<div class="wrapper row0">
  <div id="topbar" class="clear"> 
    <nav>
      <ul>
		<% if(session.getAttribute("login_id")!=null) { %>
		<li>Welcome <% out.print(session.getAttribute("login_name")); %></li>
        <li><a href="report-cart.jsp">cart</a></li>
        <li><a href="model/login.jsp?act=logout">Logout</a></li>
		<% } else { %>
		<li><a href="index.jsp">Home</a></li>
        <li><a href="about-us.jsp">About Us</a></li>
        <li><a href="contact-us.jsp">Contact Us</a></li>
		<li><a href="customer-login.jsp">Customer Login</a></li>
		<% } %>
      </ul>
    </nav>
  </div>
</div>
<div class="wrapper row1">
  <header id="header" class="clear"> 
    <div id="logo" class="fl_left">
       <div style="float:left; margin-top:-11px;"><h1 style="font-size:36px;"><a href="index.jsp">Texas State Book Store</a></h1>
      <p style="color:#ffffff">Free delivery, great discounts, variety of Products</p>
      </div>
    </div>
  </header>
</div>
<div class="wrapper row2">
  <div class="rounded">
    <nav id="mainav" class="clear"> 
      <ul class="clear">
        <li class="active"><a href="index.jsp">Home</a></li>
        <li class="active"><a href="about-us.jsp">About</a></li>
		<!-- Menu System for Customer Login -->
		<% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("4")) { %>		
		<li><a href="login-home.jsp">Dashboard</a></li>
		<li><a href="#" class="drop" >Shopping More</a>
			<ul>
				<% for(int i=0;i<allCategory.size();i++) 
				{ 
					HashMap CategoryDetails = new HashMap();
					CategoryDetails = (HashMap)allCategory.get(i);
				%>
				<li><a href="list-product.jsp?type_id=<% out.print(CategoryDetails.get("type_id")); %>"><% out.print(CategoryDetails.get("type_name")); %></a></li>
				<% } %>      
			</ul>
		</li>
		<li><a href="report-order.jsp?customer_id=<%=session.getAttribute("customer_id")%>">My Orders</a></li>
		<li><a href="customer.jsp?customer_id=<%=session.getAttribute("customer_id")%>">My Account</a></li>
		<li><a href="contact-us.jsp">Contact Us</a></li>
        <li><a href="model/customer.jsp?act=logout">Logout</a></li>
		<% } %>
		<!-- End of Employee Menu Section -->
		
		<% if(session.getAttribute("login_level") == null) { %>
			<li><a href="list-product.jsp?type_id=0&search_text=">All Books</a></li>
			<li><a href="#" class="drop" >Shop by Category</a>
			<ul>
				<% for(int i=0;i<allCategory.size();i++) 
				{ 
					HashMap CategoryDetails = new HashMap();
					CategoryDetails = (HashMap)allCategory.get(i);
				%>
				<li><a href="list-product.jsp?type_id=<% out.print(CategoryDetails.get("type_id")); %>"><% out.print(CategoryDetails.get("type_name")); %></a></li>
					<% } %>
				</ul>
			</li>
			<li><a href="customer.jsp?customer_id=0">Register</a></li>
			<li><a href="customer-login.jsp">Login</a></li>
	        <li><a href="contact-us.jsp">Contact Us</a></li>

		<% } %>
      </ul>
    </nav>
  </div>
</div>
