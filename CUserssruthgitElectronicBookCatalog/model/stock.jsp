<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Stock stock = new Stock();
	String emp_id = "0";
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap results = new HashMap();
		
		results.put("stock_product_id",request.getParameter("stock_product_id"));
		results.put("stock_number",request.getParameter("stock_number"));
						
		if((request.getParameter("stock_id")).equals(""))
		{
			out.println(stock.saveStock(results));
			response.sendRedirect("../report-stock.jsp?msg=Stock Saved Successfully");
		}
		else
		{
			results.put("stock_id",request.getParameter("stock_id"));
			out.println(stock.updateStock(results));
			response.sendRedirect("../report-stock.jsp?msg=Stock Updated Successfully");
		}
	}
%>
