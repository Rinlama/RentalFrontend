<!DOCTYPE HTML>
<!--
	Ion by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>Ion by TEMPLATED</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" />

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
<script src="js/jquery.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-layers.min.js"></script>
<script src="js/init.js"></script>
<noscript>
	<link rel="stylesheet" href="css/skel.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/style-xlarge.css" />
</noscript>

</head>
<%@page import="Business.User" %>
<body id="top">

	<!-- Header -->
	<header id="header" class="skel-layers-fixed">
		<h1>
			<a href="lister.jsp">Ion</a>
		</h1>
		<nav id="nav">
			<ul>
			
				<li><a href="lister.jsp">Home</a></li>
	<li><a href="left-sidebar.jsp">About us</a></li>
						<!--	<li><a href="right-sidebar.jsp">Right Sidebar</a></li>
				<li><a href="no-sidebar.jsp">No Sidebar</a></li>-->	
<%
		User sessionUserobj = (User) session.getAttribute("sessionObj");
		User objUserLogin = (User) session.getAttribute("objUserLogin");
		
		
		//out.print(sessionUserobj.getFirstName());
		if (sessionUserobj != null ) {
		
			//request.setAttribute("ses", sessionUserobj);
			//out.print("Hello" + sessionUserobj.getFirstName());
			%>
		
	
		<li><a  href="/Rental/Postregister.jsp?idUser=<% out.print(sessionUserobj.getuserID());%>"><button type="button" class="button special">New Post</button></a>	</li>
		<li> <a   href="/Rental/Useraccount.jsp?idUser=<% out.print(sessionUserobj.getuserID());%>"><button type="button" class="button special">My Account</button></a>  </li>
		<li><a href="index.jsp"> <%session.invalidate();%>Log Out </a> </li>
		<%
		} else if (objUserLogin != null) {
		
			
			//out.print("Hello" + objUserLogin.getFirstName()); 
			%>
	
		<li> <a  href="/Rental/Postregister.jsp?idUser=<% out.print(objUserLogin.getuserID());%>"><button type="button" class="button special">New Post</button></a>	</li>
		<li> <a  href="/Rental/Useraccount.jsp?idUser=<% out.print(objUserLogin.getuserID());%>"><button type="button" class="button special">My Account</button></a>	</li>
		<li><a href="index.jsp"> <%session.invalidate();%>Log Out</a></li>
		<%
		}else {
		%>
				
				<li><a href="signup.jsp" class="button special">Sign Up</a></li>
				<li><a href="index.jsp" class="button special">Sign In</a></li>
				
			</ul>
		</nav>
	<% }
		 %>
	</header>