<%@ page isErrorPage="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    


<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<title>Lookify</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<div class="container w-75">
		<c:if test="${not empty success}">
			<div class="alert alert-success mt-4"><c:out value="${success}"/></div>
		</c:if>
		
		<div class="d-flex align-items-center justify-content-between">
			<div class="mt-4">
				<h1 style="color:#603F8B">Welcome <c:out value="${username}"/></h1>
				<br>
				<p>Books from everyone's shelves</p>
			</div>
			<div class="d-flex flex-column align-items-end">
				<a style="color:#603F8B" href = "/logout">Logout</a>
				<br>
				<a style="color:#603F8B" href = "/books/new">+ Add to my shelf!</a>
			</div>
			
		</div>
		
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Title</th>
					<th scope="col">Author Name</th>
					<th scope="col" >Posted By</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${books}" var="book">
					<tr>	
						<td ><u><a style="color:#603F8B"  href='<c:url value="/books/${book.id}"/>' ><c:out value="${book.title}"/></a></u></td>
						<td ><c:out value="${book.author}"/></td>
						<td ><c:out value="${book.user.username}"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		
	</div>
    
	
</body>
</html>
