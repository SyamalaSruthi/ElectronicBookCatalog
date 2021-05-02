<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Order orderDetails = new Order();
	int order_id = Integer.parseInt(request.getParameter ("order_id"));
	HashMap Values =  orderDetails.getOrderDetails(order_id);	
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Order Details</h2>
		<form method="post" action="model/order.jsp">
          <div class="half_width">
            <label for="email">Order ID<span>*</span></label>
            <input type="text" name="order_id" id="order_id" value="<% out.print(Values.get("order_id")); %>" size="22" style="width:300px;" disabled>
          </div>
          <div class="half_width">
            <label for="email">User ID<span>*</span></label>
            <input type="text" name="order_user_id" id="order_user_id" value="<% out.print(Values.get("order_user_id")); %>" size="22" style="width:300px;" disabled>
          </div>
          <div class="half_width">
            <label for="email">Order Date<span>*</span></label>
            <input type="text" name="order_date" id="order_date" value="<% out.print(Values.get("order_date")); %>" size="22" style="width:300px;" disabled>
          </div>
          <div class="half_width">
            <label for="email">Order Total<span>*</span></label>
            <input type="text" name="order_total" id="order_total" value="<% out.print(Values.get("order_total")); %>" size="22" style="width:300px;" disabled>
          </div>
          <div class="half_width">
            <label for="email">Order Status<span>*</span></label>
            <select style="height: 40px; width:200px" name="order_status" required>
            	<% out.print(orderDetails.getStatusOption((Integer) Values.get("order_status"))); %>
            </select>
          </div>
		  <div style="clear:both">
            <input name="submit" type="submit" value="Update Order">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="image_name" value="<% out.print(Values.get("order_image")); %>" />
		  <input type="hidden" name="act" value="Update" />
		  <input type="hidden" id="order_id" name="order_id" value="<% out.print(Values.get("order_id")); %>"/>
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
<%@ include file="includes/footer.jsp" %>
