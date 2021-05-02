package Model;

import java.util.*;

import comBook.*;

import java.sql.*;
import java.io.*;

public class Cart extends Connect
{
    /////Function for connect to the MySQL Server Database////////////
	public Cart()
    {
		Connect.connect_mysql();
    }
	//////////Save User Details /////
	public String saveCart(HashMap cartData)
	{
		String SQL = "";
		String error = "";
		int count = 0;
		/// Check the Item exits in the cart or not ////
		try
		{
			SQL = "SELECT * FROM `cart` WHERE cart_product_id = "+cartData.get("cart_product_id");
			statement = connection.createStatement();
			rs = statement.executeQuery(SQL);
			while(rs.next())
			{	
				count++;
			}
			if(count != 0) {
				SQL="DELETE FROM cart WHERE cart_product_id = "+cartData.get("cart_product_id");
				statement.executeUpdate(SQL);
			}
			
			//// Insert Item into cart ////
			SQL = "INSERT INTO `cart` (`cart_user_id`, `cart_product_id`, `cart_quantity`, `cart_total`, `cart_price_per_unit`) VALUES (?, ?, ?, ?, ?);";
			int record=0; 
		
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) cartData.get("cart_user_id"));
			pstmt.setString(2,(String) cartData.get("cart_product_id"));
			pstmt.setString(3,(String) cartData.get("cart_quantity"));
			pstmt.setString(4,(String) cartData.get("cart_total"));
			pstmt.setString(5,(String) cartData.get("cart_price_per_unit"));
			
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
	////////////////Function for getting all the Airport Details////////////////////  
    public ArrayList getAllCart()
	{
		String SQL = "SELECT * FROM `cart`,`product` WHERE product_id = cart_product_id";
		int count=0;
        ArrayList resultArray = new ArrayList();
        try
		{
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("cart_id",rs.getString("cart_id"));
				results.put("cart_product_id",Integer.parseInt(rs.getString("cart_product_id")));
				results.put("cart_quantity",rs.getString("cart_quantity"));
				results.put("cart_total",rs.getString("cart_total"));
				results.put("cart_price_per_unit",rs.getString("cart_price_per_unit"));
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
    //////////////////Funtion for delete the record//////////////////////////
	public boolean deleteCart(int cart_id)
	{
		String SQL="DELETE FROM cart WHERE cart_id = "+cart_id;
		int is_deleted=0;
		try
		{
			is_deleted = statement.executeUpdate(SQL);
		}
		catch(Exception e)
		{
			System.out.println("Error : "+e);
		}
		if(is_deleted==1)
				return true;
		return false;
	}
}
