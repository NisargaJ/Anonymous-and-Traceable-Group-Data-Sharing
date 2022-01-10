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
 <%
            if (request.getParameter("msg") != null) {%>
        <script>alert('Message Sent');</script>
        <%}
            if (request.getParameter("msg1") != null) {%>
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
						<a href="memberhome.jsp">home</a></li>
					<li>
						<a href="member_filerequest.jsp">File Key Request</a></li>
					<li>
						<a href="member_fileupload.jsp">Upload File</a></li>
                                        <li>
						<a href="member_download.jsp">Download File</a></li>
                                        <li>
						<a href="member_viewmembers.jsp">View Members</a></li>
                                        <li class="active">
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

	</section><center>   
        <br><br>
 <p><font color="black" size="5"> Send Message to Group </font></p><br/>
	<%
    String user = session.getAttribute("email").toString();
    String groupname = session.getAttribute("groupname").toString();
    
     Connection con = Dbconnection.getConnection();
        PreparedStatement pst=con.prepareStatement("select * from messages where groupname = '"+groupname+"'");
        ResultSet rs=pst.executeQuery();
      
    
    %>	
   
          
              
              
              
      <%
        while(rs.next()){
        
        
        
   
    %>  
    
          
    <td><font color="blue"><%=rs.getString("loginkey")%> </font></td>: &nbsp;&nbsp;&nbsp;&nbsp;
    <td><textarea><%=rs.getString("message")%> </textarea></td>
  <br>
      
      <% }%>
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
       <p align="justify">
   
    
    <form name="myform" action="member_groupchart1.jsp" method="post" onsubmit="return validateform()">
    <table align="center" width="321">
    
        
    <tr>
  
    <td width="218" align="center"><input name="message" required="" placeholder="Type Message Here" /></td>
    <td>OR</td>
    </form>
       <td>  
    <form action="Upload1"  method="post" enctype="multipart/form-data">
        <input type="file" style="width: 90px" name="message" style="color:transparent"></td>
        <td> <input type="image"  src="images/submit.jpg" width="50" height="50" alt="Submit">
    </td>
    </tr>
   
   </form>
   
    

    </table>
   
    </p>     
        
    
        
    
  
    
      
   </center>  
    
    
    
    
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
