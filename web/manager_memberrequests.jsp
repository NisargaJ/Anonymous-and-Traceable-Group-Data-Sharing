<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="anonymous.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>Anonymous and Traceable</title>
<link href="screen.css" rel="stylesheet" type="text/css" media="screen">
<link href="style.css" rel="stylesheet" type="text/css" media="screen">
<link rel="stylesheet" href="nivo-slider/default/default.css" type="text/css" media="screen" /><link rel="stylesheet" href="nivo-slider/default/nivo-slider.css" type="text/css" media="screen" />
</head>
<%
            if (request.getParameter("message") != null) {%>
        <script>alert('Member Details Sent');</script>
        <%}
            if (request.getParameter("aalogin1") != null) {%>
        <script>alert('Failed ');</script> 
        
        <%}
        %> 
<body>
<center><h1>Anonymous and Traceable Group Data Sharing in Cloud Computing</h1></center>
	<header>
		<span class="container">
			<nav>
				<ul type="none" class="last">
					<li>
						<a href="managerhome.jsp">home</a></li>
					<li>
						<a href="manager_addgroup.jsp">Add Groups</a></li>
					<li>
						<a href="manager_viewgroup.jsp">View Groups</a></li>
                                        
                                        <li>
						<a href="manager_viewrequests.jsp">View Requests</a></li>
                                        <li>
						<a href="manager_filerequests.jsp">File Requests</a></li>
                                        <li class="active">
						<a href="manager_memberrequests.jsp">Member Requests</a></li>
					<li>
						<a href="index.html">Logout</a></li>
                                        
				</ul></nav></span>
	</header>
	<span class="clearfix"></span>
	<section id="slider_wrapper" class="under_header slider-wrapper theme-default container">
		<div id="slider" class="nivoSlider">
			<img src="images/1.png" data-thumb="images/toystory.jpg" alt="" />
			<img src="images/2.png" data-thumb="images/walle.jpg" alt=""  />
			<img src="images/3.png" data-thumb="images/nemo.jpg" alt=""  />
		</div>

	</section>
        <br><br>

	 <p><center><font size="5" color="black">Anonymous Member Details Requests </font></center></p><br/>
    <style>
        th{
            color: #50aac3;
        }
         tr{
            color: black;
        }
        
        td{
            text-align: center;
        }
    </style>
     
    
    <% 
        

try{ 
	
        Connection con = Dbconnection.getConnection();
        PreparedStatement pst=con.prepareStatement("select * from memberrequest");
        ResultSet rs=pst.executeQuery();
        %>
        
        <center>   <table style="width:80%" border="2"></center>
         
       <tr>
        
        <th>ID</th>
        <th>Requested User</th>
        <th>Group Name</th>
        <th>Email</th>
        <th>Login Key</th>
        <th>Response</th>
        
     
     
 </tr>

<%
       
	while(rs.next()){
            %><tr>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%=rs.getString(6)%></td>
               <td><a href="manager_memberrequests1.jsp?id=<%=rs.getInt(1)%>&groupname=<%=rs.getString(3)%>&requestedusrer=<%=rs.getString(2)%>&loginkey=<%=rs.getString(6)%>"><font color="#0d637d" size="3">Response</font></a> </td>
      
         
         
        </tr>
      <%  }
        
        %> </table>

<% }
	catch(Exception e)
	{
		System.out.println(e);
	}
	%>
        
        <br><br><br>
         <hr>      

	<span class="clearfix"></span>
	
 <script type="text/javascript" src="scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="scripts/jquery.nivo.slider.js"></script>
    <script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>
</body>
</html>
