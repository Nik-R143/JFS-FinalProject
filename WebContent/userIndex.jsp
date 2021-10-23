<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head><%@include file="css/style.jsp"%>

<title>Placement Management Application</title>
<style>
body {
    background-image: url("images/IT.gif");
    background-repeat:no-repeat ;
  
       
            background-size: cover; 
          
}
td, th { border: 0px solid white}
</style>
</head>
<body>
	<center>
		<h1 style="font-family:poppins;">Placement Management</h1>
		<h2>
			<a href="user?action=ulist"><button type="button"
					class="btn btn-primary" style="background-color:
#68a0bd ; border-style:none;">Display
				All Users</button></a>
        

		</h2>
	</center><a href="AdminDashboard.html"><button type="button"
			class="btn btn-primary" style="background-color:
#68a0bd ; border-style:none;">Dashboard</button></a>
	<div align="center">
		<c:if test="${user != null}">
			<form action="user?action=uupdate" method="post">
		</c:if>
		<c:if test="${user == null}">
			<form action="user?action=uinsert" method="post">
		</c:if>
		<table border="0.1" cellpadding="5">
	
				<h2>
					<c:if test="${user != null}">
            			Edit User
            		</c:if>
					<c:if test="${user == null}">
            			<b>Add New User</b>
            		</c:if>
				</h2>
		
			<c:if test="${user != null}">
				<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
			</c:if>
			<tr>
				<th style="color:white;">User Name:</th>
				<td><input type="text" class="form-control" required name="name" size="45"
					value="<c:out value='${user.name}' />" /></td>
			</tr>
			<tr>
				<th style="color:white;">User Password:</th>
				<td><input type="text" class="form-control" required name="password" size="45"
					value="<c:out value='${user.password}' />" /></td>
			</tr>
			<tr>
				<th style="color:white;">User Type:</th>
				<td><input type="text" class="form-control" required name="type" size="45"
					value="<c:out value='${user.type}' />" /></td>
			</tr>

			<tr>
				<td colspan="2" align="center">					<button type="submit" class="btn btn-success" style="background-color:
#68a0bd ; border-style:none;">Save</button>
</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>
