<%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="javax.crypto.KeyGenerator"%>
<%@page import="java.sql.*"%>
<%@page import="anonymous.Dbconnection"%>
<%@ page session="true" %>
    <%
        
        
    int id = Integer.parseInt(request.getParameter("id"));    
    String groupname = request.getParameter("groupname");
    
     
    try{
      
        
    Connection con=Dbconnection.getConnection();
    PreparedStatement ps=con.prepareStatement("delete from grp where id = "+id+" and groupname = '"+groupname+"'");

    
    int i=ps.executeUpdate();
    if(i>0)
    {
    response.sendRedirect("cloud_viewgroups.jsp?msg=Success");
    }
    else{
    response.sendRedirect("cloud_viewgroups.jsp?msg1=Failed");    
    }
    %>
    <%
    }

    catch(Exception e)
    {
            out.println(e.getMessage());
    }
    %>