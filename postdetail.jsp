<%@page import="javax.imageio.ImageIO"%>
<%@page import="org.apache.catalina.connector.OutputBuffer"%>
<%@page import="java.util.*"%>
<%@page import="Business.User"%>
<%@page import="DOA.PostDao"%>
<%@page import="Business.PostAds"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.OutputStream"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@page import="java.io.InputStream"%>
<%@page import="javax.swing.ImageIcon"%>


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
				String userid=request.getParameter("idUser");
				request.setAttribute("idUser", userid);
				if(!userid.equalsIgnoreCase("")){
					%>
				<li><a href="Postregister.jsp?idUser=${idUser}"
					class="button special">New Post</a></li>
				<li><a href="Useraccount.jsp?idUser=${idUser}"
					class="button special">My Account</a></li>

				<%
				}else{
					%>
				<li><a href="signup.jsp" class="button special">Sign up</a></li>
				<li><a href="index.jsp" class="button special">Sign in</a></li>
				<%
					
				}
				%>

			</ul>
		</nav>
	</header>


	<%-- <%
	out.print(session.getSessionContext());
	User a = (User) session.getAttribute("secondsession");
	if (a != null) {
		out.print(a.toString());
	}
%> --%>
<body>
	<%
		PostDao userdoaobj = new PostDao();
		List posts = userdoaobj.getAllPost();
		String unqiueID = request.getParameter("postid");
		request.setAttribute("unqiueID", unqiueID);
		request.setAttribute("posts", posts);
	%>


	<c:forEach var="poster" items="${posts}">
		<c:if test="${poster.getPostid()==unqiueID}">
			<div class="container">
				<div class="iconcontainer">

					<div class="row">

						<div class="featureinfo col-md-12">
							<h2 class="text-center">${poster.getSubject()}</h2>
							<div class="col-md-12">
								<p>${poster.getDescription()}<br> Name:
									${poster.getName()}<br> Phone: ${poster.getPhone()}<br>
									Email: ${poster.getEmail()}<br>
							</div>
							<div class="col-md-8">
								<c:if test="${poster.getImgone()!=null}">
									<img src="images/${poster.getImgone()}" width="100%"
										height="100%" />
								</c:if>
							</div>

						</div>



						<c:set var="test" value="${poster.getImgone()}" />

					</div>
				</div>
			</div>
			</div>
		</c:if>

	</c:forEach>

</body>
<%@ include file="footer.jsp"%>