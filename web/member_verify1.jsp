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
						<a href="index.html">home</a></li>
					<li class="active">
						<a href="member.jsp">Member</a></li>
					<li>
						<a href="manager.jsp">Group Manager</a></li>
					<li>
						<a href="cloud.jsp">Cloud</a></li>
                                        
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
	
<%

String email = session.getAttribute("email").toString();

String groupname = request.getParameter("groupname");
//String groupname = session.getAttribute("groupname").toString();


System.out.println("groupname : "+groupname);

%>
	<center><p><font size="5" color="black">Verify Group Key </font></p><br/></center>
     
    <form action="member_verify2.jsp" method="post">
    <center><table width="281" border="0" >

            <tr><td><font color="black"> Group Name :</td><td><input type="text" name="groupname" value="<%=groupname%>" required="" /></td></tr>        
            
   <tr><td><font color="black"> Group Key :</td><td><input type="password" name="groupkey" required="" /></td></tr>
    
    <td rowspan="2">
    <td><br><input type="submit" name="submit" value="Login" /></td>
   
    </td>
    <tr></tr>      
    </table></center>
    </form>
    <br/>
   
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
