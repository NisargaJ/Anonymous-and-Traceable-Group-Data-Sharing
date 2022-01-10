<%@page import="java.sql.*"%>
<%@page import="anonymous.Dbconnection"%>
<%@ page session="true" %>
    <%
    int id = Integer.parseInt(request.getParameter("id"));    
        
    String user = session.getAttribute("email").toString();
    String groupname = session.getAttribute("groupname").toString();
    String loginkey = request.getParameter("loginkey");
    
    
    try{
    
        
    Connection con=Dbconnection.getConnection();
    PreparedStatement ps=con.prepareStatement("insert into memberrequest values(?,?,?,?,?,?)");

    ps.setInt(1,id);
    ps.setString(2,user);
    ps.setString(3,groupname);
    ps.setString(4,"Pending");
    ps.setString(5,"Pending");
    ps.setString(6,loginkey);
   
    
    int i=ps.executeUpdate();
    if(i>0)
    {
    response.sendRedirect("member_viewmembers.jsp?msg=Success");
    }
    else{
    response.sendRedirect("member_viewmembers.jsp?msg1=Failed");    
    }
    %>
    <%
    }

    catch(Exception e)
    {
            out.println(e.getMessage());
    }
    %>