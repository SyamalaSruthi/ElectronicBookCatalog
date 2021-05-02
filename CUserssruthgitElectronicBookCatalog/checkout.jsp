<%@ include file="includes/header.jsp" %>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Shipping Address</h2>
        <form action="payment.jsp" method="post">
          <div>
            <label for="email">Name <span>*</span></label>
            <input type="text" name="email" id="email" value="" size="22" required>
          </div>
          <div>
            <label for="email">Street<span>*</span></label>
            <input type="text" name="email" id="email" value="" size="22" required>
          </div>
          <div>
            <label for="email">House No<span>*</span></label>
            <input type="text" name="email" id="email" value="" size="22" required>
          </div>
          <div>
            <label for="email">City<span>*</span></label>
            <input type="text" name="email" id="email" value="" size="22" required>
          </div>
          <div>
            <label for="email">State<span>*</span></label>
            <input type="text" name="email" id="email" value="" size="22" required>
          </div>
          <div>
            <label for="email">Country<span>*</span></label>
            <input type="text" name="email" id="email" value="" size="22" required>
          </div>
          <div>
            <label for="email">Pincode<span>*</span></label>
            <input type="text" name="email" id="email" value="" size="22" required>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="Proceed to Payment">
            &nbsp;
          </div>
        </form>
        </div>
        <div style="float: right">
        	<div><img src="images/save_1.jpg" style="width: 250px"></div><br>
        	<div><img src="images/save_2.jpg" style="width: 250px"></div>
        </div>
      <div class="clear"></div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
