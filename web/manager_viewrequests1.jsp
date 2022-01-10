<%@page import="anonymous.Mail"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="anonymous.Dbconnection"%>
<%@ page session="true" %>
<%

//int id = Integer.parseInt(request.getParameter("id"));
String email = request.getParameter("email");
String groupname = request.getParameter("groupname");
String loginkey = null;
String filekey = null;

    Random r = new Random();
    int j = r.nextInt(10000 - 5000) + 5000;
    String skey = groupname+j+"";
     //String groupname = null; 
    
    
    Connection con=Dbconnection.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from grp where groupname= '"+groupname+"' ");
    if(rs.next())
    {
        
    filekey = rs.getString(3);
   // groupname = rs.getString(2);
    }
System.out.println("name"+groupname);
    
    
 String msg ="Login Key: "+skey;
  
    PreparedStatement ps = con.prepareStatement("update membergroup set loginkey = '"+skey+"', filekey = '"+filekey+"' where email ='"+email+"' and groupname='"+groupname+"' ");
      
       Mail m= new Mail();
       m.secretMail(msg, email, email);
       
       ps.executeUpdate();   

response.sendRedirect("manager_viewrequests.jsp?message=success");

%>