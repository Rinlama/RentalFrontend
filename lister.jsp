<%@page import="org.apache.catalina.connector.OutputBuffer"%>
<%@page import="java.util.*"%>
<%@page import="Business.User"%>
<%@page import="DOA.PostDao"%>
<%@page import="Business.PostAds"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ---------------------Header-->
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
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.10/css/dataTables.bootstrap.min.css "/>
<script src="https://cdn.datatables.net/1.10.10/js/dataTables.bootstrap.min.js "></script>
<script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
      
      <script>
      $(document).ready(function() {
    	    $('#example').DataTable( {
    	        "paging":   true,
    	        "ordering": false,
    	        "info":     true
    	    } );
    	} );
      </script>

</head>
<style type="text/css">
.dataTables_filter{
float: right;
}
.dataTables_length{
display:none;
}
.paginate_button current{
color:red;
}
</style>
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
				<!-- 	<li><a href="right-sidebar.jsp">Right Sidebar</a></li>
				<li><a href="no-sidebar.jsp">No Sidebar</a></li>-->	
<%
		User sessionUserobj = (User) session.getAttribute("sessionObj");
		User objUserLogin = (User) session.getAttribute("objUserLogin");
		String iduser=request.getParameter("idUser");
		String requestservelt=(String)request.getAttribute("useridservelt");
		request.setAttribute("iduser", iduser);
		
		 //out.print(iduser);
		if (sessionUserobj != null) {
			HttpSession set = request.getSession();
			set.setAttribute("secondsession", objUserLogin);
			
			//request.setAttribute("ses", sessionUserobj);
			//out.print("Hello" + sessionUserobj.getFirstName());
			%>
		
	
		<li><a  href="/Rental/Postregister.jsp?idUser=<% out.print(sessionUserobj.getuserID());%>"><button type="button" class="button special">New Post</button></a>	</li>
		<li> <a   href="/Rental/Useraccount.jsp?idUser=<% out.print(sessionUserobj.getuserID());%>"><button type="button" class="button special">My Account</button></a>  </li>
		<li><a href="index.jsp"> <%session.invalidate();%>Log Out </a> </li>
		<%
		
		} else if (objUserLogin != null) {
			HttpSession set = request.getSession();
			set.setAttribute("secondsession", objUserLogin);
			out.print("Hello " + objUserLogin.getFirstName()); 
			
			%>
	
		<li> <a  href="/Rental/Postregister.jsp?idUser=<% out.print(objUserLogin.getuserID());%>"><button type="button" class="button special">New Post</button></a>	</li>
		<li> <a  href="/Rental/Useraccount.jsp?idUser=<% out.print(objUserLogin.getuserID());%>"><button type="button" class="button special">My Account</button></a>	</li>
		<li><a href="index.jsp"> <%session.invalidate();%>Log Out</a></li>
		
		<%
	
		}else if(iduser!=null) {
		%>
		<li> <a  href="/Rental/Postregister.jsp?idUser=<% out.print(iduser);%>"><button type="button" class="button special">New Post</button></a>	</li>
		<li> <a  href="/Rental/Useraccount.jsp?idUser=<% out.print(iduser);%>"><button type="button" class="button special">My Account</button></a>	</li>
		<li><a href="index.jsp"> <%session.invalidate();%>Log Out</a></li>
				
			</ul>
		</nav>
	<% }else if(requestservelt!=null) {
		%>
		<li> <a  href="/Rental/Postregister.jsp?idUser=<% out.print(requestservelt);%>"><button type="button" class="button special">New Post</button></a>	</li>
		<li> <a  href="/Rental/Useraccount.jsp?idUser=<% out.print(requestservelt);%>"><button type="button" class="button special">My Account</button></a>	</li>
		<li><a href="index.jsp"> <%session.invalidate();%>Log Out</a></li>
				
			</ul>
		</nav>
	<% }
		 else {
		%>
				
				<li><a href="signup.jsp" class="button special">Sign Up</a></li>
				<li><a href="index.jsp" class="button special">Sign In</a></li>
				
			</ul>
		</nav>
	<% }
		 %>
	</header>





<!-- ---------------------Body Start -->
<div class="container">
	<h2>Welcome to Housing Content</h2>
	
	<div>

		<!-- PostDao Listing here -->
		<%
	
			
			
			PostDao userdoaobj = new PostDao();
			List posts = userdoaobj.getAllPost();
			//	response.getWriter().append(posts.toString());
			request.setAttribute("posts", posts);
			
		%>

	</div>

	<table id="example"  class="table table-striped" >
	<thead>
	 <tr>
            <th>Date</th>
            <th>Post</th>
           
        </tr>
	</thead>
	<tbody>
		<c:forEach items="${posts}" var="post">
			<tr>
				<td>${post.getTimestamp()}</td>
				<td><a href="/Rental/postdetail.jsp?postid=${post.getPostid()}&idUser=${iduser}"><c:out value="${post.getSubject()}" /></a>
			</tr>
		</c:forEach>
</tbody>
</tbody>


	</table>
	</div>
</body>
<%@ include file="footer.jsp"%>