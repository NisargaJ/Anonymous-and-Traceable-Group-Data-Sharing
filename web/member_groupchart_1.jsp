<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="anonymous.Dbconnection"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>Anonymous and Traceable</title>
<link href="screen.css" rel="stylesheet" type="text/css" media="screen">
<link href="style.css" rel="stylesheet" type="text/css" media="screen">
<link rel="stylesheet" href="nivo-slider/default/default.css" type="text/css" media="screen" /><link rel="stylesheet" href="nivo-slider/default/nivo-slider.css" type="text/css" media="screen" />
</head>

<body>
<center><h1>Anonymous and Traceable Group Data Sharing in Cloud Computing</h1></center>
	<header>
		<span class="container">
			<nav>
				<ul type="none" class="last">
					<li class="active">
						<a href="memberhome.jsp">home</a></li>
					<li>
						<a href="member_filerequest.jsp">File Key Request</a></li>
					<li>
						<a href="member_fileupload.jsp">Upload File</a></li>
                                        <li>
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
   
          <center>   
       <p align="justify">
    <p><font color="black" size="5"> Send Message to Group </font></p><br/>
    
    <form name="myform" action="member_groupchart1.jsp" method="post" onsubmit="return validateform()">
    <table align="center" width="321">
    
        
    <tr>
    <td width="191" height="43"><font color="black">Message </td>
    <td width="218"><input name="message" required="" placeholder="Message" /></td>
    </tr>
   
   
   

    <tr>
    <td height="43" rowspan="3">
    <p>&nbsp;</p></td>
    <td align="left" valign="middle"> <p>&nbsp;
    </p>
    <p>
    <input name="submit" type="submit" value="Send Message" />
    </p>
    <div align="right">
    </div></td>
    </tr>
    </table>
    </form>
    </p>     
        
     </center>   
        
    
    <p><center><font size="5" color="black">View <%=groupname%> Messages</font></center></p><br/>
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
        PreparedStatement pst=con.prepareStatement("select * from messages where groupname = '"+groupname+"'");
        ResultSet rs=pst.executeQuery();
        %>
        
        <center>   <table style="width:80%" border="2"></center>
         
        <tr>
        
        <th>User Key</th>
        <th>Message</th>
        
     
     
 </tr>

<%
       
	while(rs.next()){
            %><tr>
                <td><%=rs.getString(2)%></td>
                <td><textarea><%=rs.getString(4)%></textarea></td>
          
         
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
