<%@page import="anonymous.Mail"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="anonymous.Dbconnection"%>
<%@ page session="true" %>
<%

int id = Integer.parseInt(request.getParameter("id"));
String requestedusrer = request.getParameter("requestedusrer");
String groupname = request.getParameter("groupname");
String loginkey = request.getParameter("loginkey");

  String user = null;
    Connection con=Dbconnection.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from membergroup where loginkey= '"+loginkey+"' ");
    if(rs.next())
    {
        
   user = rs.getString(2);
   
    }


    PreparedStatement ps = con.prepareStatement("update memberrequest set email = '"+user+"' where user ='"+requestedusrer+"' and groupname='"+groupname+"' and id = "+id+" ");
    ps.executeUpdate();   

response.sendRedirect("manager_memberrequests.jsp?message=success");

%>