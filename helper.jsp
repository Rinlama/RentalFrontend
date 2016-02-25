<%@page import="org.apache.catalina.connector.OutputBuffer"%>
<%@page import="java.util.*"%>
<%@page import="Business.User"%>
<%@page import="Business.PostAds"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<title>Listing All</title>
</head>
<body>

	<h2>All Posts</h2>
	${posts[0].toString()}



	<hr>
	<br>
	<%  
// retrieve your list from the request, with casting 
	ArrayList<PostAds> list = (ArrayList<PostAds>) request.getAttribute("posts");

// print the information about every category of the list
for(PostAds category : list) {
	out.println(category.getUserid());
	out.println(category.getPostid());
	out.println(category.getName());
	out.println(category.getSubject());
	out.println(category.getEmail());
	out.println(category.getDescription());
	%>
	<br />
	<% 
}


%>
	and
	<table class="table">
		<c:forEach items="${posts}" var="post">
			<tr>
				<td><c:out value="${post.getUserid()}" /></td>
				<td><c:out value="${post.getPostid()}" /></td>
				<td><c:out value="${post.getName()}" /></td>
				<td><c:out value="${post.getSubject()}" /></td>
				<td><c:out value="${post.getEmail()}" /></td>
				<td><c:out value="${post.getDescription()}" /></td>
				<td><fmt:formatDate pattern="yyyy-MMM-dd" value="${user.dob}" /></td>
				<td><c:out value="${user.email}" /></td>
			</tr>
		</c:forEach>
	<table>
</body>
</html>