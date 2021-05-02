<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Order order = new Order();
	String orderID = "";
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap results = new HashMap();
		Date date = new Date();
		results.put("order_user_id",session.getAttribute("customer_id"));
		results.put("order_date",date.toString());
		results.put("order_status","2");
		results.put("order_total",session.getAttribute("total_amount"));
		session.setAttribute("total_amount","");						
		orderID = order.saveOrder(results);
		response.sendRedirect("../payment-receipt.jsp?order_id="+orderID);
	}
	if((request.getParameter("act")).equals("Update"))
	{
		HashMap results = new HashMap();
		results.put("order_status",request.getParameter("order_status"));
		results.put("order_id",request.getParameter("order_id"));
		order.updateOrder(results);
		response.sendRedirect("../report-order.jsp?msg=Order Status Updated Successfully");
	}
%>
