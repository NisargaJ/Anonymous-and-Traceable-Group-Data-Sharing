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
            if (request.getParameter("msg") != null) {%>
        <script>alert('Key Verification Failed');</script>
        <%}
            if (request.getParameter("aalogin1") != null) {%>
        <script>alert('AA_Login_Failed ');</script> 
        
        <%}
        %>   
    
<body>
<center><h1>Anonymous and Traceable Group Data Sharing in Cloud Computing</h1></center>
	<header>
		<span class="container">
			<nav>
				<ul type="none" class="last">
					<li>
						<a href="memberhome.jsp">home</a></li>
					<li>
						<a href="member_filerequest.jsp">File Key Request</a></li>
					<li>
						<a href="member_fileupload.jsp">Upload File</a></li>
                                        <li class="active">
						<a href="member_download.jsp">Download File</a></li>
                                        <li>
						<a href="member_viewmembers.jsp">View Members</a></li>
                                        <li>
						<a href="member_groupchart.jsp">Group Chat</a></li>
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

	<%
    String user = session.getAttribute("email").toString();
    String groupname = session.getAttribute("groupname").toString();
    %>	
    <p><center><font size="5" color="black">Download Files </font></center></p><br/>
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
	Connection con = null;
        con = Dbconnection.getConnection();
        PreparedStatement pst=con.prepareStatement("select * from upload where groupname='"+groupname+"'");
        ResultSet rs=pst.executeQuery();
        %>
        
        <center>   <table style="width:80%" border="2"></center>
         
        <tr>
        
        <th>File Name</th>
        <th>Date</th>
        <th>Data Owner</th>
        <th>Group Name</th>
        <th>Download</th>
        
     
     
 </tr>

<%
       
	while(rs.next()){
            %><tr>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><a href="member_download1.jsp?filename=<%=rs.getString(1)%>&owner=<%=rs.getString(3)%>"><font color="#0d637d" size="3">Download</font></a> </td>
      
         
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
