<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Product productDetails = new Product();
	int product_id = Integer.parseInt(request.getParameter ("product_id")), productCount = 6;
	HashMap Values =  productDetails.getProductDetails(product_id);	
	int stock = Integer.parseInt(Values.get("product_stock").toString());
	if(stock < 7)
		productCount = stock;
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
        <div id="comments" style="width: 70%; float:left; margin-right:30px">
        <h2>Details of <% out.print(Values.get("product_name")); %></h2>
        <form action="model/cart.jsp" method="post">
        <div>
			<div style="float:left"><img src="productImages/<% out.print(Values.get("product_image")); %>" style="height:320px; width:300px;"></div>
			<div style="float:right; width:345px;">
				<table>
					<thead>
						<tr>
							<th colspan="2">Details of <% out.print(Values.get("product_name")); %></th>
						</tr>
					</thead>
					<tbody>
					<tr>
						<td>Name</td>
						<td><% out.print(Values.get("product_name")); %></td>
					</tr>
					<tr>
						<td>Company</td>
						<td><% out.print(Values.get("product_company")); %></td>
					</tr>
					<tr>
						<td>Type</td>
						<td><% out.print(Values.get("product_type")); %></td>
					</tr>
					<tr>
						<td>Author</td>
						<td><% out.print(Values.get("product_author")); %></td>
					</tr>
					<tr>
						<td>Subject</td>
						<td><% out.print(Values.get("product_subject")); %></td>
					</tr>
					<tr>
						<td>Course</td>
						<td><% out.print(Values.get("product_course")); %></td>
					</tr>	
					<tr>
						<td>Professor</td>
						<td><% out.print(Values.get("product_professor")); %></td>
					</tr>
					<tr>
						<td>ISBN</td>
						<td><% out.print(Values.get("product_isbn")); %></td>
					</tr>
					<tr>
						<td>Price</td>
						<td>&#36; <% out.print(Values.get("product_price")); %></td>
					</tr>
					<tr>
						<td>Quantity</td>
						<td>
							<% if(productCount != 0 ) { %>
								<select style="width:50px;" name="cart_quantity">
								<% for(int c=1; c<=productCount; c++ ) { %>
									<option value="<%=c%>"><%=c%></option>
								<% } %>
								</select>
							<% } %>
							<%
								if(productCount == 0 )
									out.print("<div style='color:#ff0000'>Product Sold Out.</div>");
								else if(productCount < 6)
									out.print("<br><div style='color:#ff0000'>Only "+productCount+" Items in Stock</div>");
							%>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						Description :
						<% out.print(Values.get("product_description")); %>
						</td>
					</tr>
				 </tbody>
				</table>
			</div>
			<% if(productCount != 0 ) { %>
			<div style="clear:both; float:right;">
				<input type="submit" value="Add to Cart">
			</div>
			<% } %>
        </div>
        <input type="hidden" name="product_id" value="<% out.print(Values.get("product_id")); %>">
        <input type="hidden" name="product_price" value="<% out.print(Values.get("product_price")); %>">
        <input type="hidden" name="act" value="save">
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
