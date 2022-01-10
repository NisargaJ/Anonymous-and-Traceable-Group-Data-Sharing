<%@page import="anonymous.decryption"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="anonymous.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%
    
    String user = session.getAttribute("email").toString();
    String groupname = session.getAttribute("groupname").toString();
    String filename = request.getParameter("filename");
    String owner = request.getParameter("owner");
    String skey = request.getParameter("skey");

    try {
        Connection con = Dbconnection.getConnection();
        Statement st = con.createStatement();
        Statement st1 = con.createStatement();
        ResultSet rs = st.executeQuery("select * from upload where filename='" + filename + "' and email='"+owner+"' and filekey = '"+skey+"' and groupname = '"+groupname+"' ");
         if (rs.next()) {
        
         String chiper = rs.getString(6);
             
           String tcontent = new decryption().decrypt(chiper, skey);
            
           
            response.setHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");
            out.write(tcontent);   
             
             
         }
           else 
            {
                response.sendRedirect("member_download.jsp?msg=download failed   key not matched");
            }
     } catch (Exception ex) {
      ex.printStackTrace();
         response.sendRedirect("member_download.jsp?msg=download failed   key not matched");
    }

%>