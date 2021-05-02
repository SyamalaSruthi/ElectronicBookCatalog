package comBook;
import java.sql.*;
import com.mysql.jdbc.Driver;
import java.io.*;

public class Connect
{
    public static Statement statement = null;
    public static Connection connection;
	public static ResultSet rs;
	public static PreparedStatement pstmt;
    /////Function for connect to the MySQL Server Database////////////
	public static void connect_mysql()
    {
    	try  
    	{
    		com.mysql.jdbc.Driver d;
    		System.out.println("com_before classforname");
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("com_after classforname");
    		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_store","root","");
			statement=connection.createStatement();
   		}
   		catch(Exception e)  
    	{
			System.out.println(" Error : "+ e.toString());
    	}
    }
	////////Function for geting the Option/////////////////////
	public static String  getOptionList(String tableName,String idColumn,String valueColumn,String Columns,int selID,String conn)
	{
		String SQL = "SELECT "+Columns+" FROM "+tableName+" where "+conn; 
		String Option="<option value=''>Please Select</option>";
		try
		{
			rs = statement.executeQuery(SQL);
			while(rs.next())
			{
				int selectedID = rs.getInt(idColumn);
				if(selectedID==selID)
					Option+="<option value=\""+selectedID+"\" Selected>"+rs.getString(valueColumn)+"</option>";
				else
					Option+="<option value=\""+selectedID+"\">"+rs.getString(valueColumn)+"</option>";
			}
		}
		catch(Exception e)
		{
			StringWriter writer = new StringWriter();
			PrintWriter printWriter = new PrintWriter( writer );
			e.printStackTrace( printWriter );
			printWriter.flush();
			String stackTrace = writer.toString();
			Option+="Error : "+stackTrace;
			System.out.println("Error : "+e);
		}
		return Option;
	}
}
