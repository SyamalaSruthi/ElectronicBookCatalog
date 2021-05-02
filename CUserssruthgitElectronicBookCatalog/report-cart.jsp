<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Cart cartDetails = new Cart();
	ArrayList allCart = cartDetails.getAllCart();
	int total = 0;
%>
<script>
function redirect_to_shop() {
	window.location.href= "list-product.jsp?type_id=0";
}
</script>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>All Cart Items</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>Sr. No</th>
              <th>Image</th>
              <th>Title</th>
              <th>Price Per Unit</th>
              <th>No. of Items</th>
              <th>Total</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allCart.size();i++) 
			{ 
				HashMap CartDetails = new HashMap();
				CartDetails = (HashMap)allCart.get(i);
				total = total + Integer.parseInt(CartDetails.get("cart_total").toString());
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(i+1); %></td>
				  <td style="text-align:center;">
				  <a href="product-details.jsp?product_id=<% out.print(CartDetails.get("cart_product_id")); %>">
					<img src="productImages/<% out.print(CartDetails.get("product_image")); %>" style="height:80px; width:80px;">
				  </a>
				  </td>
				  <td style="font-weight:bold; text-align:center; text-decoration:underline;"> <% out.print(CartDetails.get("product_name")); %></td>
				  <td>&#36; <% out.print(CartDetails.get("cart_price_per_unit")); %>.00</td>
				  <td><% out.print(CartDetails.get("cart_quantity")); %></td>
				  <td>&#36; <% out.print(CartDetails.get("cart_total")); %>.00</td>
				  <td style="text-align:center; width:40px; vertical-align:middle"> 
					<a href="model/cart.jsp?act=delete&cart_id=<% out.print(CartDetails.get("cart_id")); %>">
						<img src="images/delete.png" style="height:30px">
					</a> 
				  </td>
				</tr>
			<%
			}
			%>
			<tr style="background-color:#ffffff; border:1px solid #D7D7D7">
				<td colspan = "5" style="text-align:right"> Total Amount </td>
				<td colspan = "2">&#36; <% out.print(total); %>.00</td>
			</tr>
        </tbody>
        </table>
        <div id = "comments" style="text-align:right">
			<form action="model/customer.jsp">
				<input type="button" value="Continue Shopping" onclick="redirect_to_shop()">
				<input type="submit" value="Proceed to Checkout">
				<input type="hidden" name="total_amount" value="<% out.print(total); %>">
				<input type="hidden" name="act" value="login_status">
			</form>
        </div>
        </div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
