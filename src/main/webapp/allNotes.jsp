<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="Helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Entities.Note"%>
<%@ page language="java" contentType="text/html; 
charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<div class="container">
<%@ include file="Navbar.jsp" %>
</div>
<br>
<%
Session s=FactoryProvider.getFactory().openSession();
Query q=s.createQuery("from Note");

List<Note> list=q.list();

for(Note n:list){
	
%>
<div class="card" style="width: 18rem;">
  
  <div class="card-body">
    <h5 class="card-title"><%= n.getTitle() %></h5>
    <p class="card-text"><%= n.getContent() %></p>
    <a href="DeleteServlet?delete_Id=<%= n.getId() %>" class="btn btn-danger">delete</a>
    <a href="edit.jsp?edit_Id=<%= n.getId() %>" class="btn btn-primary">Edit</a>
  </div>
</div>
<%
}
s.close();
%>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>