<%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="javax.crypto.KeyGenerator"%>
<%@page import="java.sql.*"%>
<%@page import="anonymous.Dbconnection"%>
<%@ page session="true" %>
    <%
        
        
    int id = 0;    
    String groupname = request.getParameter("groupname");
    
    
    KeyGenerator keyGen = KeyGenerator.getInstance("AES");
    keyGen.init(128);
    SecretKey secretKey = keyGen.generateKey();
    System.out.println("secret key:" + secretKey);
    //converting secretkey to String
     byte[] be = secretKey.getEncoded();//encoding secretkey
     String groupkey = Base64.encode(be);
    
    
    
    try{
      
        
        
        
    Connection con=Dbconnection.getConnection();
    PreparedStatement ps=con.prepareStatement("insert into grp values(?,?,?)");

    ps.setInt(1,id);
    ps.setString(2,groupname);
    ps.setString(3,groupkey);
    
    
    int i=ps.executeUpdate();
    if(i>0)
    {
    response.sendRedirect("manager_addgroup.jsp?msg=Success");
    }
    else{
    response.sendRedirect("manager_addgroup.jsp?msg1=Failed");    
    }
    %>
    <%
    }

    catch(Exception e)
    {
            out.println(e.getMessage());
    }
    %>