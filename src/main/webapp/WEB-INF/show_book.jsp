<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Show a book</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<body>
	<div class="container w-75 ">
		
		<div class="d-flex align-items-center justify-content-between">
			<h3 style="color:#603F8B" ><c:out value="${book.title}"/></h3> 
			<a style="color:#603F8B" href="/books">Back to the shelves</a>
		</div>
		<br>
		<br>
		<c:choose>
			<c:when test="${book.user.id == user_id}"><h5><span style="color:#a58aca">You</span></c:when>
			<c:otherwise><h5><span style="color:#a58aca"><c:out value="${book.user.username}"/></span></c:otherwise>
		</c:choose>
		 read <span style="color:#603F8B"><c:out value="${book.title}"/></span> by 
		<span style="color:#603F8B"><c:out value="${book.author}"/></span></h5>
		
		<br>
		<h6>Here are <c:out value="${book.user.username}"/>'s thoughts:</h6>
		<hr>
		<p><c:out value="${book.thoughts}"/></p>
		<hr>
		<c:if test="${user_id == book.user.id}">
			<div class="container">
				<form class="d-flex align-items-center justify-content-end" action='/books/<c:out value="${book.id}"/>/edit' method="post">
					<input type="hidden" name="_method" value="put">
					<input style="background-color:#603F8B" type="submit" class="btn btn-dark" value="Edit">
				</form>
			</div>
		</c:if>
    </div>
	
</body>
</html>