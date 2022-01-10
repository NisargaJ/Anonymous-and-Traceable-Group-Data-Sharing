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
    String filename = request.getParameter("filename");
String owner = request.getParameter("owner");
    %>	
    <br> 
   <center>
	
           <form name="f" action="member_download2.jsp" method="post" >  <center>
<table>
   
     
    
    
        <tr>
            <th><font color="black" size="4">File Name :</th>
              <th><input type="text" name="filename" value="<%=filename%>"  style="height:30px; width:170px"></input>
              </th>
        </tr>

              
              
        <tr>
              <th><font color="black" size="4">Data Owner: </th>
              <th><input type="text" name="owner" value="<%=owner%>"  style="height:30px; width:170px"></input>
              </th>
        </tr>
              
     
              
           
              
         <tr>
              <th><font color="black" size="4">Secret Key :</th>
              <th><textarea type="text" name="skey"  style="height:30px; width:170px"></textarea>
              </th>
        </tr>    
    
         
	</table>
                    </center>
     
           <br> 
              
	  <tr>
              <td>
                    <input type="submit" value="DOWNLOAD"  style="height:30px; width:85px" />
             
              </td>
            </tr>
 
       </form>
  <br> 
         <hr>   
         <br> <br><br> 

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
