<%@page import="java.sql.*"%>
<%@page import="anonymous.Dbconnection"%>
<%@ page session="true" %>
    <%
   
    int id = 0;    
       
    String user = session.getAttribute("email").toString();
    String groupname = request.getParameter("groupname");
    session.setAttribute("groupname",groupname);
    
    
    try{
    
        
    Connection con=Dbconnection.getConnection();
    PreparedStatement ps=con.prepareStatement("insert into membergroup values(?,?,?,?,?)");

    ps.setInt(1,id);
    ps.setString(2,user);
    ps.setString(3,groupname);
    ps.setString(4,"Pending");
    ps.setString(5,"Pending");
  
    
    
    int i=ps.executeUpdate();
    if(i>0)
    {
    response.sendRedirect("member_verify.jsp?key=Success");
    }
    else{
    response.sendRedirect("member.jsp?msg1=Failed");    
    }
    %>
    <%
    }

    catch(Exception e)
    {
            out.println(e.getMessage());
    }
    %>