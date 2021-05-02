<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	/*Bill billDetails = new Bill();
	int bill_id = Integer.parseInt(request.getParameter ("bill_id"));
	HashMap Values =  billDetails.getBillDetails(bill_id);
	*/
	String yearOption = "<option value=''>Year</option>";
	int startYear = 2015;
	for(int i=0;i<=20;i++)
	{
		String sel = "";
		yearOption+="<option value='"+(startYear+i)+"' "+sel+">"+(startYear+i)+"</option>";
	}
	
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Make Payment</h2>
        <form action="model/order.jsp" method="post" id="Form">
          <div>
          <img src="images/visa.jpg" style="width:300px;">
          </div>
		  <div class="half_width">
            <label for="email">Credit Card Number<span>*</span></label>
            <input type="text" name="credit_number" id="credit_number" size="22" style="width:300px;" required onkeypress="return IsNumeric(event);"  maxlength="16">
            <span id="error" style="color: Red; display: none">* Input digits (0 - 9)</span>
          </div>
          <div class="half_width">
            <label for="email">Name on Credit Card<span>*</span></label>
            <input type="text" name="name_credit_card" id="name_credit_card" size="22" style="width:300px;" required >
          </div>
		  <div class="half_width">
            <label for="email">Credit Card Type<span>*</span></label>
            <select style="height: 40px; width:300px" name = "credit_card_type" required>
            	<option value="">Please Select</option>
            	<option>MasterCard</option>
            	<option>Visa Card</option>
            	<option>Discover</option>
            	<option>Maestro</option>
            	<option>American Expresss</option>
            </select>
          </div>
          <div class="half_width">
            <label for="email">Expiry Date<span>*</span></label>
            <select style="height: 40px; width:100px; float:left; margin-right:5px;">
                <option>Month</option>
                <option>January</option>
                <option>February</option>
                <option>March</option>
                <option>April</option>
                <option>May</option>
                <option>June</option>
                <option>July</option>
                <option>August</option>
                <option>September</option>
                <option>October</option>
                <option>November</option>
                <option>December</option>
            </select>
            <select style="height: 40px; width:100px; float:left;" name = "exp_year" required>
            	<% out.print(yearOption); %>
            </select>
          </div>
          <div style="clear:both"></div>
          <div>
            <label for="email">CVV No.<span>*</span></label>
            <input type="text" name="cvv" id="cvv" size="22" style="width:300px;" required maxlength="4">
          </div>
          <div>
            <label for="email">Amount Paid<span>*</span></label>
            <input type="text" name="sal_amount" id="sal_amount" size="22" style="width:300px;" value="<% out.print(session.getAttribute("total_amount"));%>" readonly>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="Make Payment">
            &nbsp;
            <input name="reset" type="reset" value="Cancel Payment">
          </div>
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="sal_id" />
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
