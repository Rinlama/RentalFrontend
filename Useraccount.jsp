<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="Business.User"%>
<%@page import="Business.PostAds"%>
<%@page import="java.util.List"%>
<%@page import="DOA.UserDoa"%>
<%@page import="DOA.PostDao"%>

<%@include file="headersessionUserAccount.jsp" %>
<%
	String id = request.getParameter("idUser");
	request.setAttribute("id", id);
	UserDoa user = new UserDoa();
	List userlist = user.getAllUser();
	request.setAttribute("listUser", userlist);
%>




<c:forEach var="user" items="${listUser}">
	<c:if test="${user.getuserID()==id}">
		

 <div class="container">
			<div class="container">
				<div class="row centered-form">
					<h2>Sign up Page Classified Site</h2>
					<div
						class="col-xs-12 col-sm-8 col-md-8 col-sm-offset-2 col-md-offset-2">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									${user.getFirstName()} Account
								</h3>
							</div>
							<div class="panel-body">

								<form role="form" method="POST" action="UpdateUser">
									<div class="row">
									<div class="col-xs-6 col-sm-6 col-md-6">
											<div class="form-group">
												<input type="text" name="id" id="id"
													class="form-control input-sm" placeholder="id" value="${id}">
											</div>
										</div>
										<div class="col-xs-6 col-sm-6 col-md-6">
											<div class="form-group">
												<input type="text" name="first_name" id="first_name"
													class="form-control input-sm" placeholder="First Name" value="${user.getFirstName()}">
											</div>
										</div>
										<div class="col-xs-6 col-sm-6 col-md-6">
											<div class="form-group">
												<input type="text" name="last_name" id="last_name"
													class="form-control input-sm" placeholder="Last Name" value="${user.getLastName()}">
											</div>
										</div>
									</div>

									<div class="form-group">
										<input type="email" name="email" id="email"
											class="form-control input-sm" value="${user.getEmail()}" placeholder="Email Address"
											required>
									</div>

								
									<input type="submit" value="Save"
										class="btn btn-info btn-block">

								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

	</c:if>
</c:forEach>

	<%	
			PostDao userdoaobj = new PostDao();
			List posts = userdoaobj.getuserpost(id);
			//	response.getWriter().append(posts.toString());
			request.setAttribute("posts", posts);
			
		%>

	
	<h2 class="col-md-offset-5">My Post</h2>
	<table class="table">
		<c:forEach items="${posts}" var="post">
			<tr>
				<td>${post.getTimestamp()}</td>
				<td><a href="/Rental/postdetail.jsp?postid=${post.getPostid()}"><c:out value="${post.getSubject()}" /></a></td>
				 <td><a href="/Rental/Deletepost?postid=${post.getPostid()}&userid=${id}"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" >
				 <span class="glyphicon glyphicon-trash"></span></button></a></td>
			</tr>
		</c:forEach>



	</table>


		</div>
		<!-- /container -->


<%@ include file="footer.jsp"%>

