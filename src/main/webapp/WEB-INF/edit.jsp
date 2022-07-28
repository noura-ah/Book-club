<%@ page isErrorPage="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    


<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<title>edit a book</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<div class="container w-75">
		
		
		<div >
			<div class="d-flex align-items-center justify-content-between">
				<h1 class="m-4"style="color:#603F8B">Change Your Entry</h1>
				<a href="/books" class="mt-2">Back to the shelves</a>
			</div>
			<form:form class="border border-3 p-4 border-dark" method="post" modelAttribute="book" action="/books/${book.id}">
				<input type="hidden" name="_method" value="put">
				<div class="mb-3"> 
					<form:label path="title" class="form-label">Title:</form:label>
					<form:input  path="title" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
					<form:errors path="title" cssClass="invalid-feedback"/>
				</div>
				<div class="mb-3">
					<form:label path="author" class="form-label">Author:</form:label>
					<form:input path="author" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
					<form:errors path="author" cssClass="invalid-feedback"/>
				</div>
				<div class="mb-3">
					<form:label path="thoughts" class="form-label">My thoughts: </form:label>
					<form:textarea  path="thoughts" type="number" cssClass="form-control" cssErrorClass="form-control is-invalid"></form:textarea>
					<form:errors  path="thoughts" cssClass="invalid-feedback"/>
				</div>
				<input type="submit"  style="background-color:#603F8B" value="Submit" class="btn btn-dark">
			</form:form>
		</div>
		
	</div>
    
	
</body>
</html>
