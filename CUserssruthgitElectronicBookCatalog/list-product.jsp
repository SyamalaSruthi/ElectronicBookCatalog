<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Product productDetails = new Product();
	ArrayList allProduct = productDetails.searchProduct(Integer.parseInt(request.getParameter("type_id")),request.getParameter("search_text"));
	Type catDetails = new Type();
	ArrayList allType = catDetails.getAllType();
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <!-- ################################################################################################ -->
      <div class="group btmspace-30"> 
        <!-- Left Column -->
        <div class="one_quarter first"> 
          <!-- ################################################################################################ -->
          <ul class="nospace">
			<li class="btmspace-15"><a href="#"><em class="heading">CHOOSE YOUR CATEGORY</em> 
			
			<ul>
			<li><a href="list-product.jsp?type_id=0">All Books</a></li>
			<% for(int i=0;i<allType.size();i++) 
			{ 
				HashMap TypeDetails = new HashMap();
				TypeDetails = (HashMap)allType.get(i);
			%>
				<li><a href="list-product.jsp?type_id=<% out.print(TypeDetails.get("type_id")); %>"><% out.print(TypeDetails.get("type_name")); %></a></li>
			<%
			}
			%>
			</ul>
		</li>
		</li>
          </ul>
          <!-- ################################################################################################ --> 
        </div>
        <!-- / Left Column --> 
        <!-- Middle Column -->
        <div class="one_half" style="width:70%"> 
          <!-- ################################################################################################ -->
		  <h2>Online Book Store</h2>        
		  <div id="comments">
			<form action="#">
				<table>
					<tr>
						<td>Search Book : </td>
						<td><input type="text" style="padding:4px;" name="search_text"></td>
						<td><input type="submit" value="Search Book" style="padding:4px;"></td>
					</tr>
				</table>
				<input type="hidden" value="0" name="type_id">
			</form>
		  </div>  
          <ul class="nospace listing">
          <% for(int i=0;i<allProduct.size();i++) 
			{ 
				HashMap ProductDetails = new HashMap();
				ProductDetails = (HashMap)allProduct.get(i);
			%>
				<li class="product-listing">
					<div class="myimage">
					<a href="product-details.jsp?product_id=<% out.print(ProductDetails.get("product_id")); %>">
						<img src="productImages/<% out.print(ProductDetails.get("product_image")); %>" style="height:120px; width:120px;">
					</a>
					</div>
					<div class="product-price">
						<b style="text-decoration:underline" id="<% out.print(ProductDetails.get("product_name")); %>"><% out.print(ProductDetails.get("product_name")); %> 
						</b> <br>
						&#36; <% out.print(ProductDetails.get("product_price")); %><br>
						<i style="color:#555">Available : <% out.print(ProductDetails.get("product_stock")); %></i><br>
						<i style="color:#554;font-size:10px;">ISBN : <% out.print(ProductDetails.get("product_isbn")); %></i>
						<p style="display:none">
						<% out.print(ProductDetails.get("product_name"));%>
						<% out.print(ProductDetails.get("product_price"));%>
						<% out.print(ProductDetails.get("product_isbn"));%>
						</p>
					</div>
				</li>
			<%
			}
			%>
          </ul>
          
       <!-- ################################################################################################ --> 
        </div>
        <!-- / Middle Column --> 
      </div>
      
      <!-- ################################################################################################ --> 
      <!-- ################################################################################################ -->
      
      <!-- ################################################################################################ --> 
      <!-- / main body -->
      <div class="clear"></div>
    </main>
  </div>
</div>

<%@ include file="includes/footer.jsp" %>
