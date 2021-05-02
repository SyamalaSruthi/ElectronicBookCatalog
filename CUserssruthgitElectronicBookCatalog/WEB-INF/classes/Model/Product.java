package Model;

import java.util.*;

import comBook.*;

import java.sql.*;
import java.io.*;

public class Product extends Connect
{
    /////Function for connect to the MySQL Server Database////////////
	public Product()
    {
		Connect.connect_mysql();
    }
	//////////Save User Details /////
	public String saveProduct(HashMap productData)
	{
		String SQL = "INSERT INTO `product` (`product_name`, `product_type_id`, `product_company_id`, `product_price`, `product_image`, `product_description`,`product_stock`) VALUES (?, ?, ?, ?, ?, ?, ?);";
		int record=0; 
		String error = "";
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) productData.get("product_name"));
			pstmt.setString(2,(String) productData.get("product_type_id"));
			pstmt.setString(3,(String) productData.get("product_company_id"));
			pstmt.setString(4,(String) productData.get("product_price"));
			pstmt.setString(5,(String) productData.get("product_image"));
			pstmt.setString(6,(String) productData.get("product_description"));
			pstmt.setString(7,(String) productData.get("product_stock"));
			
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
    public HashMap getProductDetails(int product_id)
	{
        HashMap results = new HashMap();
        int count=0;
		try
		{
			String SQL = "SELECT * FROM `product`,`company`,`type` WHERE product_company_id = company_id AND product_type_id = type_id AND product_id = "+product_id ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				results.put("product_name",rs.getString("product_name"));
				results.put("product_type_id",Integer.parseInt(rs.getString("product_type_id")));
				results.put("product_company_id",Integer.parseInt(rs.getString("product_company_id")));
				results.put("product_description",rs.getString("product_description"));
				results.put("product_price",rs.getString("product_price"));
				results.put("product_id",rs.getString("product_id"));
				results.put("product_image",rs.getString("product_image"));
				results.put("product_company",rs.getString("company_name"));
				results.put("product_type",rs.getString("type_name"));
				results.put("product_stock",rs.getString("product_stock"));
				results.put("product_author",rs.getString("product_author"));
				results.put("product_subject",rs.getString("product_subject"));
				results.put("product_course",rs.getString("product_course"));
				results.put("product_professor",rs.getString("product_professor"));
				results.put("product_isbn",rs.getString("product_isbn"));
				
				count++;
            }
			if(count==0)
			{
				results.put("product_name","");
				results.put("product_type_id",0);
				results.put("product_company_id",0);
				results.put("product_description","");
				results.put("product_price","");
				results.put("product_image","");
				results.put("product_id","");	
				results.put("product_author","");
				results.put("product_subject","");
				results.put("product_course","");
				results.put("product_professor","");
				results.put("product_isbn","");
				results.put("product_stock","");					
			}
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return results;
    }
    /// Update the Product ////
	public String updateProduct(HashMap productData)
	{
		String SQL = "UPDATE `product` SET `product_name` = ?, `product_type_id` = ?, `product_company_id` = ?, `product_price` = ?, `product_image` = ?, `product_description` = ?, `product_stock` = ? WHERE `product_id` = ?;";
		String error = "";
		
		int record=0;	
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) productData.get("product_name"));
			pstmt.setString(2,(String) productData.get("product_type_id"));
			pstmt.setString(3,(String) productData.get("product_company_id"));
			pstmt.setString(4,(String) productData.get("product_price"));
			pstmt.setString(5,(String) productData.get("product_image"));
			pstmt.setString(6,(String) productData.get("product_description"));
			pstmt.setString(7,(String) productData.get("product_stock"));
			pstmt.setString(8,(String) productData.get("product_id"));
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
    public ArrayList getAllProduct(int typeID)
	{
		int count=0;
		String SQL = "";
		if(typeID != 0)
			SQL = "SELECT * FROM `product`,`company`,`type` WHERE product_company_id = company_id AND product_type_id = type_id AND type_id = "+typeID;
		else 
			SQL = "SELECT * FROM `product`,`company`,`type` WHERE product_company_id = company_id AND product_type_id = type_id";
        ArrayList resultArray = new ArrayList();
        try
		{
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("product_name",rs.getString("product_name"));
				results.put("product_type_id",Integer.parseInt(rs.getString("product_type_id")));
				results.put("product_company_id",Integer.parseInt(rs.getString("product_company_id")));
				results.put("product_description",rs.getString("product_description"));
				results.put("product_price",rs.getString("product_price"));
				results.put("product_id",rs.getString("product_id"));
				results.put("product_image",rs.getString("product_image"));
				results.put("product_company",rs.getString("company_name"));
				results.put("product_type",rs.getString("type_name"));
				results.put("product_stock",rs.getString("product_stock"));
				results.put("product_author",rs.getString("product_author"));
				results.put("product_subject",rs.getString("product_subject"));
				results.put("product_course",rs.getString("product_course"));
				results.put("product_professor",rs.getString("product_professor"));
				results.put("product_isbn",rs.getString("product_isbn"));
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
	////////////////Function for getting all the Airport Details////////////////////  
    public ArrayList searchProduct(int typeID, String search_text)
	{
		int count=0;
		String SQL = "";
		if(typeID != 0)
			SQL = "SELECT * FROM `product`,`company`,`type` WHERE product_company_id = company_id AND product_type_id = type_id AND type_id = "+typeID;
		else 
			SQL = "SELECT * FROM `product`,`company`,`type` WHERE product_company_id = company_id AND product_type_id = type_id AND (product_name LIKE '%"+search_text+"%' OR product_isbn LIKE '%"+search_text+"%' OR product_professor LIKE '%"+search_text+"%' OR product_course LIKE '%"+search_text+"%' OR product_subject LIKE '%"+search_text+"%' OR product_author LIKE '%"+search_text+"%')";
        ArrayList resultArray = new ArrayList();
        try
		{
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("product_name",rs.getString("product_name"));
				results.put("product_type_id",Integer.parseInt(rs.getString("product_type_id")));
				results.put("product_company_id",Integer.parseInt(rs.getString("product_company_id")));
				results.put("product_description",rs.getString("product_description"));
				results.put("product_price",rs.getString("product_price"));
				results.put("product_id",rs.getString("product_id"));
				results.put("product_image",rs.getString("product_image"));
				results.put("product_company",rs.getString("company_name"));
				results.put("product_type",rs.getString("type_name"));
				results.put("product_stock",rs.getString("product_stock"));
				results.put("product_isbn",rs.getString("product_isbn"));
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
	public String getCompanyOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
    	return Connect.getOptionList("company","company_id","company_name","company_id,company_name",selectedID,"1");
    }
    /////Function for Getting the List////////////
	public String getTypeOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
    	return Connect.getOptionList("type","type_id","type_name","type_id,type_name",selectedID,"1");
    }
}
