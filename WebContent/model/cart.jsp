<%@ page import= "Model.Cart" %>
<%@ page import= "java.util.*" %>

<%
	Cart cartObj = new Cart();
	HashMap results = new HashMap();
	if((request.getParameter("act")).equals("delete"))
	{
		int cart_id = Integer.parseInt(request.getParameter("cart_id"));
		if(cartObj.deleteCart(cart_id))
			response.sendRedirect("../report-cart.jsp?msg=Item Deleted Successfully");
	} else {
		int total = Integer.parseInt(request.getParameter("product_price")) * Integer.parseInt(request.getParameter("cart_quantity"));
		results.put("cart_user_id","0");
		results.put("cart_product_id",request.getParameter("product_id"));
		results.put("cart_price_per_unit",request.getParameter("product_price"));
		results.put("cart_quantity",request.getParameter("cart_quantity"));
		results.put("cart_total",""+total);		
		out.println(cartObj.saveCart(results));
		response.sendRedirect("../report-cart.jsp");
	}
%>
