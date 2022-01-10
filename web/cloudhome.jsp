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
        <script>alert('Login Success');</script>
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
					<li class="active">
						<a href="cloudhome.jsp">home</a></li>
					<li>
						<a href="cloud_viewgroups.jsp">View Groups</a></li>
                                        <li>
						<a href="cloud_viewfiles.jsp">View Files</a></li>
                                         <li>
						<a href="cloud_viewmembers.jsp">View Members</a></li>
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

	<center><p><font size="5" color="black">Welcome Cloud Home </font></p><br/></center>
     
    

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
