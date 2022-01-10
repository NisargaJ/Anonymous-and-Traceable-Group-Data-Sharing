/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anonymous;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author java2
 */
public class Upload extends HttpServlet {

    private static java.sql.Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Connection con;
            PreparedStatement pstm = null;
            PreparedStatement pstm1 = null;
             String filename = "";
             String filekey = "";
             String cname = "";
            String budget = "";
            String resource = "";
            String email = (String) request.getSession().getAttribute("email");
            String groupname = (String) request.getSession().getAttribute("groupname");
          
            try {
                boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
                if (!isMultipartContent) {
                    return;
                }
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                try {
    List<FileItem> fields = upload.parseRequest(request);
    Iterator<FileItem> it = fields.iterator();
    if (!it.hasNext()) {
    return;
    }
    while (it.hasNext()) {
    FileItem fileItem = it.next();
    if (fileItem.getFieldName().equals("filename")) {
    filename = fileItem.getString();
    System.out.println("File Name" + filename);
    }
    if (fileItem.getFieldName().equals("filekey")) {
    filekey = fileItem.getString();
    System.out.println("File Key" + filekey);
    }
    
    
    else {

    }
    boolean isFormField = fileItem.isFormField();
    if (isFormField) {
    } else {
    try {
    con = Dbconnection.getConnection();
    pstm = con.prepareStatement("insert into upload (filename, filedate,email,groupname,filekey,cipher)values(?,?,?,?,?,?)");
    
    System.out.println("getD " + fileItem.getName());
    String str = getStringFromInputStream(fileItem.getInputStream());
  
    
     byte[] bs = Base64.decode(filekey);
     SecretKey sec = new SecretKeySpec(bs, "AES");
    
     String cipher = new encryption().encrypt(str, sec);
    
     

     pstm.setString(1, filename);
     pstm.setDate(2, getCurrentDate());
     pstm.setString(3, email);
     pstm.setString(4,groupname);
     pstm.setString(5,filekey);
     pstm.setString(6,cipher);
     
     

     

     /*Cloud Start*/
     File f = new File("C:\\Users\\Nikith1000Projects\\Desktop\\input\\"+fileItem.getName());
     FileWriter fw = new FileWriter(f);
     fw.write(cipher);
     fw.close();
     Ftpcon ftpcon = new Ftpcon();
     ftpcon.upload(f, filename);
     /*Cloud End*/
     int i = pstm.executeUpdate();
    
     if (i == 1) {
         response.sendRedirect("member_fileupload.jsp?msg=success");
     } else {
         response.sendRedirect("member_fileupload.jsp?msg1=failed");
     }
     con.close();
    } catch (Exception e) {
     out.println(e.toString());
    }
    }
    }
    } catch (FileUploadException e) {
    } catch (Exception ex) {
    Logger.getLogger(Upload.class.getName()).log(Level.SEVERE, null, ex);
    }
    } finally {
        out.close();
    }
    }
    }

    private static String getStringFromInputStream(InputStream is) {
        BufferedReader br = null;
        StringBuilder sb = new StringBuilder();
        String line;
        try {
            br = new BufferedReader(new InputStreamReader(is));
            while ((line = br.readLine()) != null) {
                sb.append(line + "\n");
            }
        } catch (IOException e) {
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                }
            }
        }
        return sb.toString();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private long[] splitToNChar(String str, int len) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
