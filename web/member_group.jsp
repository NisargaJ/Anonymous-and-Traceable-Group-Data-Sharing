<%@page import="anonymous.Dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
        <script>alert('Login Success');</script>
        <%}
            if (request.getParameter("key") != null) {%>
        <script>alert('Request Sent');</script> 
        
        <%}
        %>   
    
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
      Connection con;
            Statement st;
            ResultSet rs;
            con = Dbconnection.getConnection();
            st = con.createStatement();
            rs = st.executeQuery("select * from grp ");
                                                      
            %>     
        
   <%
    String user = session.getAttribute("email").toString();
    %>	
    <center><p><font size="5" color="black">Welcome <%=user%> </font></p><br/></center>
     

	<center><p><font size="5" color="black">Select Group </font></p><br/></center>
     
    <form action="member_group1.jsp" method="post">
    <center><table width="281" border="0" >

   
                 <tr>
                          <th height="43"><font color="black">Group</th>
                          <td><select id="s1" name="groupname" style="width:170px;" class="text" required="">
                            <% 
                       while(rs.next())
                       {
                       String groupname = rs.getString("groupname");
                       
                                %>
               
          
                                <option value="<%=groupname%>" ><%=groupname%></option>
                  <% }%>
                          </select></td>
                        </tr>        
            
            
        
            
            
            
    <td rowspan="2">
    <td><br><input type="submit" name="submit" value="Send Request" /></td>
    </td>
    
    <tr></tr>      
    </table></center>
    </form>
    <br/>
   <td><center><a href="member_verify.jsp"><font color="black" style="font-size: 21px">You Have Already Account Login </font></a> </center>  </td>
    

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
