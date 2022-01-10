<%@page import="anonymous.Mail"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="anonymous.Dbconnection"%>
<%@ page session="true" %>
<%

int id = Integer.parseInt(request.getParameter("id"));
String email = request.getParameter("email");
String groupname = request.getParameter("groupname");
String loginkey = null;
String filekey = null;

   
    
    
    Connection con=Dbconnection.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from grp where groupname= '"+groupname+"' ");
    if(rs.next())
    {
        
    filekey = rs.getString(3);
   // groupname = rs.getString(2);
    }
System.out.println("name"+groupname);
    
    
 String msg ="File Key: "+filekey;
  
    PreparedStatement ps = con.prepareStatement("update memberfile set filekey = '"+filekey+"', status = 'File Key sent' where user ='"+email+"' and groupname='"+groupname+"' and id = "+id+" ");
      
       Mail m= new Mail();
       m.secretMail(msg, email, email);
       
       ps.executeUpdate();   

response.sendRedirect("manager_filerequests.jsp?message=success");

%>