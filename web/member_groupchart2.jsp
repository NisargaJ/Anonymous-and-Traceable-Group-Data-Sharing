<%@page import="java.sql.*"%>
<%@page import="anonymous.Dbconnection"%>
<%@ page session="true" %>
    <%
      
     int id= 0;   
        
    String user = session.getAttribute("email").toString();
    String groupname = session.getAttribute("groupname").toString();    
        
        
    String message = request.getParameter("message");
   
    String loginkey = null;
    
    try{
    
     
        
    Connection con=Dbconnection.getConnection();
    
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from membergroup where email= '"+user+"' and groupname='"+groupname+"'");
    if(rs.next())
    {
    
        loginkey = rs.getString(4);
        
    }
    
    
    PreparedStatement ps=con.prepareStatement("insert into messages values(?,?,?,?)");

    ps.setInt(1,id);
    ps.setString(2,loginkey);
    ps.setString(3,groupname);
    ps.setString(4,message);
  
    
    int i=ps.executeUpdate();
    if(i>0)
    {
    response.sendRedirect("member_groupchart.jsp?msg=Success");
    }
    else{
    response.sendRedirect("member_groupchart.jsp?msg1=Failed");    
    }
    %>
    <%
    }

    catch(Exception e)
    {
            out.println(e.getMessage());
    }
    %>