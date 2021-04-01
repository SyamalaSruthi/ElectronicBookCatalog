<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Order orderDetails = new Order();
	ArrayList allOrder = orderDetails.getAllOrderItems(request.getParameter("order_id"));
	int total = 0;
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 98%; float:left; margin-right:30px">
      <h2>Order Confirmation Receipt</h2>
        <div style="font-size:20px; color:#000000; line-height:25px;">
			Order ID : <% out.print(request.getParameter("order_id")); %> <br>
			Order details are as below :
        </div> 
        </div>
		 <table>
          <thead>
            <tr>
              <th>Sr. No</th>
              <th>Image</th>
              <th>Title</th>
              <th>Price Per Unit</th>
              <th>No. of Items</th>
              <th>Total</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allOrder.size();i++) 
			{ 
				HashMap OrderDetails = new HashMap();
				OrderDetails = (HashMap)allOrder.get(i);
				total = total + Integer.parseInt(OrderDetails.get("oi_total").toString());
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(i+1); %></td>
				  <td style="text-align:center;">
				  <a href="product-details.jsp?product_id=<% out.print(OrderDetails.get("oi_product_id")); %>">
					<img src="productImages/<% out.print(OrderDetails.get("product_image")); %>" style="height:80px; width:80px;">
				  </a>
				  </td>
				  <td style="text-align:center"> <% out.print(OrderDetails.get("product_name")); %></td>
				  <td>&#36; <% out.print(OrderDetails.get("oi_price_per_unit")); %>.00</td>
				  <td><% out.print(OrderDetails.get("oi_cart_quantity")); %></td>
				  <td>&#36; <% out.print(OrderDetails.get("oi_total")); %>.00</td>
				</tr>
			<%
			}
			%>
			<tr style="background-color:#ffffff; border:1px solid #D7D7D7">
				<td colspan = "4" style="text-align:right"> Total Amount </td>
				<td colspan = "2">&#36; <% out.print(total); %>.00</td>
			</tr>
        </tbody>
        </table>
      <div class="clear"></div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
