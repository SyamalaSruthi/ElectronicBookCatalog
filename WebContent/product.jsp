<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Product productDetails = new Product();
	int product_id = Integer.parseInt(request.getParameter ("product_id"));
	HashMap Values =  productDetails.getProductDetails(product_id);	
%>
<script>
function validImage() {
	var val = $("#product_image").val();
	var id = $("#product_id").val();
	if(id == '' || val != '')
	{
		if(val == '') {
			alert('Choose the Product Image');
			return false;
		}
		if (!val.match(/(?:gif|jpg|png|bmp)$/)) {
			// inputted file path is not an image of one of the above types
			alert("inputted file path is not an image!");
			return false;
		}
	}
	return true;
}
</script>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Product Form</h2>
		<form method="post" action="UploadProduct" enctype="multipart/form-data" onsubmit="return validImage()">
          <div class="half_width">
            <label for="email">Product Name<span>*</span></label>
            <input type="text" name="product_name" id="product_name" value="<% out.print(Values.get("product_name")); %>" size="22" style="width:300px;" required>
          </div>
          <div class="half_width">
            <label for="email">Product Type<span>*</span></label>
            <select style="height: 40px; width:300px" name = "product_type_id" id = "product_type_id" required>
            	<% out.print(productDetails.getTypeOption((Integer) Values.get("product_type_id"))); %>
            </select>
          </div>
          <div class="half_width">
            <label for="email">Product Company<span>*</span></label>
            <select style="height: 40px; width:300px" name = "product_company_id" id = "product_company_id" required>
            	<% out.print(productDetails.getCompanyOption((Integer) Values.get("product_company_id"))); %>
            </select>
          </div>
          <div class="half_width">
            <label for="email">Product Price<span>*</span></label>
            <input type="text" name="product_price" id="product_price" value="<% out.print(Values.get("product_price")); %>" size="22" style="width:300px;" required>
          </div>
          <div style="clear:both">
            <label for="email">Image<span>*</span></label>
            <input type="file" name="product_image" id="product_image" style="width:300px">
          </div>
           <div style="clear:both">
            <label for="email">Number of Products in Stock<span>*</span></label>
            <input type="text" name="product_stock" id="product_stock" value="<% out.print(Values.get("product_stock")); %>" size="22" style="width:300px;" required>
          </div>
          <div style="clear:both">
            <label for="email">Description<span>*</span></label>
			<textarea style="width:300px; height:100px;" name="product_description" required><% out.print(Values.get("product_description")); %></textarea>
          </div>
          <% if(!Values.get("product_image").equals("")) { %>
          <div class="half_width">
			<img src="productImages/<% out.print(Values.get("product_image")); %>" style="height:100px; width:100px;">
          </div>
          <% } %>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="Save Product">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="image_name" value="<% out.print(Values.get("product_image")); %>" />
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="type_id" value="0" />
		  <input type="hidden" id="product_id" name="product_id" value="<% out.print(Values.get("product_id")); %>"/>
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
