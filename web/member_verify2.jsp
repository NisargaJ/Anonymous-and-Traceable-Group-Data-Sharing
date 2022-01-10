<%@page import="java.sql.*"%>
<%@page import="anonymous.Dbconnection"%>
<%@ page session="true" %>
<%
    
    String email = session.getAttribute("email").toString();
   // String groupname = session.getAttribute("groupname").toString();
    
    String groupkey = request.getParameter("groupkey");
    String groupname = request.getParameter("groupname");
    session.setAttribute("groupname",groupname);
    String loginkey = null;
    
    
    try{
       
    Connection con=Dbconnection.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from membergroup where email= '"+email+"' and groupname='"+groupname+"' and loginkey = '"+groupkey+"'");
    if(rs.next())
    {
   
    response.sendRedirect("memberhome.jsp?msg=Login_Successfull");               
    }
    
  
    else 
    {
    response.sendRedirect("member.jsp?m1=LoginFail");
    }
    }
    catch(Exception e)
    {
     response.sendRedirect("member.jsp?m2=LoginFail");   
    System.out.println("Error in memberact"+e.getMessage());
    }
%>