import java.io.File;
import java.io.IOException;
import Model.*;
import java.util.*;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 
@WebServlet("/UploadProduct")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class UploadProduct extends HttpServlet {
    private static final String SAVE_DIR = "productImages";
     
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//// Logic for Upload the File ////
        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + SAVE_DIR;
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
		long unixTime = System.currentTimeMillis() / 1000L;
	
		Part part;
        part = request.getPart("product_image");
        String fileName = extractFileName(part);
        if(!fileName.equals("")) {
			fileName = unixTime+"_"+extractFileName(part);
			part.write(savePath + File.separator + fileName);
		} else {
			fileName = request.getParameter("image_name");
		}
		//// Upload File Complete///
		
		/////Save the Product Details /////
		Product productObj = new Product();
		String emp_id = "0";
		if((request.getParameter("act")).equals("Save"))
		{
			HashMap results = new HashMap();

			results.put("product_name",request.getParameter("product_name"));
			results.put("product_type_id",request.getParameter("product_type_id"));
			results.put("product_company_id",request.getParameter("product_company_id"));
			results.put("product_description",request.getParameter("product_description"));
			results.put("product_price",request.getParameter("product_price"));
			results.put("product_id",request.getParameter("product_id"));
			results.put("product_stock",request.getParameter("product_stock"));
			results.put("product_image",fileName);
					
			if((request.getParameter("product_id")).equals(""))
			{
				productObj.saveProduct(results);
				request.setAttribute("message", "Product Saved Successfully !!!!");
				getServletContext().getRequestDispatcher("/report-product.jsp").forward(request, response);
			}
			else
			{
				results.put("product_id",request.getParameter("product_id"));
				productObj.updateProduct(results);
				request.setAttribute("message", "Product Updated Successfully !!!!");
				getServletContext().getRequestDispatcher("/report-product.jsp").forward(request, response);
			}
		}
    }
    /**
     * Extracts file name from HTTP header content-disposition
     */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}
