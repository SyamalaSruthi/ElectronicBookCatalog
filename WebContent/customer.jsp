<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Customer customerDetails = new Customer();
	int customer_id = Integer.parseInt(request.getParameter ("customer_id"));
	String titlename = "Submit Registration";
	if(customer_id != 0 ){
		titlename = "Update Account";
	}
	HashMap Values =  customerDetails.getCustomerDetails(customer_id);	
%>
<div class="wrapper row3">
  <div class="rounded">
    <% if(request.getParameter("msg") != null) { %>
	<div class="msg"><%=request.getParameter("msg") %></div>
	<% } %>
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Registration Form</h2>
		<h4>Personal Details</h4>
		<form method="post" action="model/customer.jsp">
          <div class="half_width">
            <label for="email">Name<span>*</span></label>
            <input type="text" name="customer_name" id="customer_name" value="<% out.print(Values.get("customer_name")); %>" size="22" style="width:300px;" required>
          </div>
          <div class="half_width">
            <label for="email">Mobile<span>*</span></label>
            <input type="text" name="customer_mobile" id="customer_mobile" value="<% out.print(Values.get("customer_mobile")); %>" size="22" style="width:300px;" required>
          </div>
          <div id="password_row">
			  <div class="half_width">
				<label for="email">Password<span>*</span></label>
				<input type="password" name="customer_password" id="customer_password" value="<% out.print(Values.get("customer_password")); %>" size="22" style="width:300px;" required>
			  </div>
			  <div class="half_width">
				<label for="email">Confirm Password<span>*</span></label>
				<input type="password" name="customer_confirm_password" id="customer_confirm_password" value="<% out.print(Values.get("customer_password")); %>" size="22" style="width:300px;" required>
			  </div>
		  </div>
          <div class="half_width">
            <label for="email">Email<span>*</span></label>
            <input type="text" name="customer_email" id="customer_email" value="<% out.print(Values.get("customer_email")); %>" size="22" style="width:300px;" required>
          </div>
          <div style="clear:both"></div>
          <h4>Address Details</h4>
          <div class="half_width">
            <label for="email">City<span>*</span></label>
            <input type="text" name="customer_city" id="customer_city" value="<% out.print(Values.get("customer_city")); %>" size="22" style="width:300px;" required>
          </div>
          <div class="half_width	">
            <label for="url">State</label>
            <select style="height: 40px; width:300px" name="customer_state" required>
				<% out.print(customerDetails.getStateOption((Integer) Values.get("customer_state"))); %>
            </select>
          </div>
          <div class="half_width">
            <label for="email">Pincode<span>*</span></label>
            <input type="text" name="customer_pincode" id="customer_pincode" value="<% out.print(Values.get("customer_pincode")); %>" size="22" style="width:300px;" required>
          </div>
           <div class="half_width">
            <label for="email">Full Address<span>*</span></label>
            <textarea style="width:300px; height:100px;" name="customer_address" required><% out.print(Values.get("customer_address")); %></textarea>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="<%=titlename%>">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="image_name" value="<% out.print(Values.get("customer_image")); %>" />
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" id="customer_id" name="customer_id" value="<% out.print(Values.get("customer_id")); %>"/>
        </form>
        </div>
        <div style="float: left">
        	<div><img src="images/save_1.jpg" style="width: 250px"></div><br>
        	<div><img src="images/save_2.jpg" style="width: 250px"></div>
        </div>
      <div class="clear"></div>
    </main>
  </div>
</div>
<% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("1")) { %>		
	<script>
		 jQuery('#password_row').hide();
	</script>
<% } %>
<%@ include file="includes/footer.jsp" %>
