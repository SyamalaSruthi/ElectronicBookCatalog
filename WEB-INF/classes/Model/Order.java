package Model;

import java.util.*;

import comBook.*;

import java.sql.*;
import java.io.*;

public class Order extends Connect
{
    /////Function for connect to the MySQL Server Database////////////
	public Order()
    {
		Connect.connect_mysql();
    }
	//////////Save User Details /////
	public String saveOrder(HashMap orderData)
	{
		String SQL = "INSERT INTO `order` (`order_user_id`, `order_date`, `order_status`, `order_total`) VALUES (?, ?, ?, ?);";
		int record = 0,last_inserted_id = 0; 
		String error = "";
		
		try
		{
			pstmt = connection.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1,(String) orderData.get("order_user_id"));
			pstmt.setString(2,(String) orderData.get("order_date"));
			pstmt.setString(3,(String) orderData.get("order_status"));
			pstmt.setString(4,(String) orderData.get("order_total"));
			
			record = pstmt.executeUpdate();
			//// Get the Order ID ////
			rs = pstmt.getGeneratedKeys();
			if(rs.next())
			{
				last_inserted_id = rs.getInt(1);
			}
			
			//// Get all the Items of cart and save it into the order Item ///
			SQL = "SELECT * FROM cart";
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				///// Update the Product Stock //////
				SQL = "UPDATE product SET product_stock = (product_stock - "+rs.getString("cart_quantity")+") WHERE product_id = "+rs.getString("cart_product_id");
				pstmt = connection.prepareStatement(SQL);
				pstmt.executeUpdate();
				
				///// Insert Into Order Items //////
				SQL = "INSERT INTO `order_item` (`oi_order_id`, `oi_product_id`, `oi_price_per_unit`, `oi_cart_quantity`, `oi_total`) VALUES (?, ?, ?, ?, ?);";
				pstmt = connection.prepareStatement(SQL);
				pstmt.setString(1, String.valueOf(last_inserted_id));
				pstmt.setString(2, rs.getString("cart_product_id"));
				pstmt.setString(3, rs.getString("cart_price_per_unit"));
				pstmt.setString(4, rs.getString("cart_quantity"));
				pstmt.setString(5, rs.getString("cart_total"));
				record = pstmt.executeUpdate();
			}
			
			//// Delete all the cart Item //////
			SQL="DELETE FROM cart WHERE 1";
			statement.executeUpdate(SQL);
			
			pstmt.close();
			connection.close();
			error = last_inserted_id+"";
		}
		catch(Exception e)
		{
			StringWriter writer = new StringWriter();
			PrintWriter printWriter = new PrintWriter( writer );
			e.printStackTrace( printWriter );
			printWriter.flush();
			String stackTrace = writer.toString();
			error+="Error : "+stackTrace;
			System.out.println(" Error : "+ e.toString());
		}
		return error;
	}
	//////////////////Function for getting Users Details//////////	
    public HashMap getOrderDetails(int order_id)
	{
        HashMap results = new HashMap();
        int count=0;
		try
		{
			String SQL = "SELECT * FROM `order` WHERE order_id ="+order_id;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				results.put("order_user_id",rs.getString("order_user_id"));
				results.put("order_date",rs.getString("order_date"));
				results.put("order_status",Integer.parseInt(rs.getString("order_status")));
				results.put("order_total",rs.getString("order_total"));
				results.put("order_id",rs.getString("order_id"));
			
				count++;
            }
			if(count==0)
			{
				results.put("order_user_id","");
				results.put("order_date","");
				results.put("order_status",0);
				results.put("order_total","");
				results.put("order_id","");
			}
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return results;
    }
    /// Update the Order ////
	public String updateOrder(HashMap orderData)
	{
		String SQL = "UPDATE `order` SET `order_status` = ? WHERE `order_id` = ?;";
		String error = "";
		
		int record=0;	
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) orderData.get("order_status"));
			pstmt.setString(2,(String) orderData.get("order_id"));
			record = pstmt.executeUpdate();
			pstmt.close();
			connection.close();
		}
		catch(Exception e)
		{
			StringWriter writer = new StringWriter();
			PrintWriter printWriter = new PrintWriter( writer );
			e.printStackTrace( printWriter );
			printWriter.flush();
			String stackTrace = writer.toString();
			error+="Error : "+stackTrace;
			System.out.println(" Error : "+ e.toString());
		}
		return error;
	}
	
	////////////////Function for getting all the Order Details////////////////////  
    public ArrayList getAllOrder(int userID)
	{
		int count=0;
		String SQL = "";
		if(userID != 0)
			SQL = "SELECT * FROM `order`, `order_status` WHERE order_status = os_id AND order_user_id = "+userID;
		else 
			SQL = "SELECT * FROM `order`, `order_status` WHERE order_status = os_id";
        ArrayList resultArray = new ArrayList();
        try
		{
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("order_user_id",rs.getString("order_user_id"));
				results.put("order_date",rs.getString("order_date"));
				results.put("order_status",rs.getString("os_title"));
				results.put("order_total",rs.getString("order_total"));
				results.put("order_id",rs.getString("order_id"));
				count++;
                resultArray.add(results);
            }
         }
		catch(Exception e)
		{
            System.out.println("Error is: "+ e);
        }
        return resultArray;
    }
    ////////////////Function for getting all the Order Details////////////////////  
    public ArrayList getAllOrderItems(String orderID)
	{
		int count=0;
		String SQL = "";
		SQL = "SELECT * FROM `order_item`,`product` WHERE oi_product_id = product_id AND oi_order_id = "+orderID;
        ArrayList resultArray = new ArrayList();
        try
		{
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("oi_product_id",rs.getString("oi_product_id"));
				results.put("oi_price_per_unit",rs.getString("oi_price_per_unit"));
				results.put("oi_cart_quantity",rs.getString("oi_cart_quantity"));
				results.put("oi_total",rs.getString("oi_total"));
				results.put("product_name",rs.getString("product_name"));
				results.put("product_image",rs.getString("product_image"));
				count++;
                resultArray.add(results);
            }
         }
		catch(Exception e)
		{
            System.out.println("Error is: "+ e);
        }
        return resultArray;
    }
    /////Function for Getting the List////////////
	public String getStatusOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
    	return Connect.getOptionList("order_status","os_id","os_title","os_id,os_title",selectedID,"1");
    }
}
