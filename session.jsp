<%@page import="Business.User" %>

	<div>
		<%
		User sessionUserobj = (User) session.getAttribute("sessionObj");
		User objUserLogin = (User) session.getAttribute("objUserLogin");
		
		//out.print(sessionUserobj.getFirstName());
		if (sessionUserobj != null ) {
			out.print("Hello" + sessionUserobj.getFirstName());
			%><br>
		<a href="index.jsp"> <%session.invalidate();%>Log Out </a> 
		<br>
		<a href="/Rental/Postregister.jsp?idUser=<% out.print(sessionUserobj.getuserID());%>"><button type="button" class="btn btn-primary">New Post</button></a>
		 <a href="/Rental/Useraccount.jsp?idUser=<% out.print(sessionUserobj.getuserID());%>"><button type="button" class="btn btn-primary">My Account</button></a>
		<%
		} else if (objUserLogin != null) {
			out.print("Hello" + objUserLogin.getFirstName()); 
			%><br>
		<a href="index.jsp"> <%session.invalidate();%>Log Out
		</a><br>
		 <a href="/Rental/Postregister.jsp?idUser=<% out.print(objUserLogin.getuserID());%>"><button type="button" class="btn btn-primary">New Post</button></a>
		 <a href="/Rental/Useraccount.jsp?idUser=<% out.print(objUserLogin.getuserID());%>"><button type="button" class="btn btn-primary">My Account</button></a>
		<%
		}
	%>
	</div>