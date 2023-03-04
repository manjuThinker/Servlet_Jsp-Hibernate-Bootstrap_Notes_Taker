<%@page import="Entities.Note"%>
<%@page import="Helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<h1>hi</h1>
	<div class="container">
	<%@ include file="Navbar.jsp" %>
	<% 
	int id=Integer.parseInt(request.getParameter("edit_Id").trim());
	Session s=FactoryProvider.getFactory().openSession();
	
	
	Note n=(Note) s.get(Note.class, id);
	
	s.close();
	%>
	
	<div class="container">
			<h2>Edit Notes</h2>
			<form action="EditServlet" method="post">
			<input type="hidden" name="myField" value="<%=n.getId()%>">
			
				<div class="form-group">
					<label for="title">Title:</label> <input type="text" name="title"
						class="form-control" required id="title" 
						placeholder="Enter title"
						value="<%=n.getTitle() %>"
						>
				</div>
				<div class="form-group">
					<label for="content">Content:</label>
					<textarea class="form-control" name="content" required id="content"
						rows="5" placeholder="Enter content"><%=n.getContent() %></textarea>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>

	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
	
</html>