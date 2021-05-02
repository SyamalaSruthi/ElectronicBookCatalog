package Model;

import java.util.*;

import comBook.*;

import java.sql.*;
import java.io.*;

public class Stock extends Connect
{
    /////Function for connect to the MySQL Server Database////////////
	public Stock()
    {
		Connect.connect_mysql();
    }
	//////////Save User Details /////
	public String saveStock(HashMap stockData)
	{
		String SQL = "INSERT INTO stock (stock_product_id, stock_number) VALUES (?, ?);";
		int record=0; 
		String error = "";
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) stockData.get("stock_product_id"));
			pstmt.setString(2,(String) stockData.get("stock_number"));
		
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
	//////////////////Function for getting Users Details//////////	
    public HashMap getStockDetails(int stock_id)
	{
        HashMap results = new HashMap();
        int count=0;
		try
		{
            String SQL =  "SELECT * FROM `stock`,`product` WHERE stock_id = "+stock_id ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				results.put("stock_product_id",Integer.parseInt(rs.getString("stock_product_id")));
				results.put("stock_number",rs.getString("stock_number"));
				results.put("product_name",rs.getString("product_name"));
				results.put("product_image",rs.getString("product_image"));
				results.put("stock_id",rs.getString("stock_id"));
				count++;
            }
			if(count==0)
			{
				results.put("stock_product_id",0);
				results.put("stock_number","");
				results.put("product_name","");
				results.put("product_image","no-image.jpg");	
				results.put("stock_id","");				
			}
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return results;
    }
    /// Update the Stock ////
	public String updateStock(HashMap stockData)
	{
		String SQL = "UPDATE stock SET stock_product_id = ?, stock_number = ? WHERE stock_id = ?;";
		String error = "";
		
		int record=0;	
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) stockData.get("stock_product_id"));
			pstmt.setString(2,(String) stockData.get("stock_number"));
			pstmt.setString(3,(String) stockData.get("stock_id"));			
			
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
    public ArrayList getAllStock(int product_id)
	{
		String SQL =  "SELECT * FROM `stock`,`product` WHERE product_id = stock_product_id and product_id = "+product_id ;
		int count=0;
        ArrayList resultArray = new ArrayList();
        try
		{
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("stock_product_id",Integer.parseInt(rs.getString("stock_product_id")));
				results.put("stock_number",rs.getString("stock_number"));
				results.put("product_name",rs.getString("product_name"));
				results.put("product_image",rs.getString("product_image"));
				results.put("stock_id",rs.getString("stock_id"));				
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
	public String getProductOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
    	return Connect.getOptionList("product","product_id","product_id","product_id,product_id",selectedID,"1");
    }
}
