<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<%@include file="css/style.jsp"%>
<title>Placement Management Application</title>
<style>
body {
   /* background-image: url("images/trypic.gif");
    background-repeat:no-repeat ;
   
       
            background-size: cover; */
          
}
td, th { border: 0px solid black }
</style>
</head>
<body>
	<center>
		<h1 style="font-family:poppins;">Placement Management</h1>
		<h2>
			<a href="Admin?action=Adminlist"><button type="button"
					class="btn btn-primary" style="background-color:
#68a0bd ; border-style:none;">Display All Admins</button></a>


		</h2>
	</center>
	<a href="AdminDashboard.html"><button type="button"
			class="btn btn-primary" style="background-color:
#68a0bd ; border-style:none;" >Dashboard</button></a>
	<div align="center">
		<c:if test="${admin != null}">
			<form action="Admin?action=Adminupdate" method="post">
		</c:if>
		<c:if test="${admin == null}">
			<form action="Admin?action=Admininsert" method="post">
		</c:if>
		<table border="0" cellpadding="5" style=" width:450px" >

			<h2>
				<c:if test="${admin != null}">
		            			Edit Admin
		            		</c:if>
				<c:if test="${admin == null}">
		            			Add New Admin
		            		</c:if>
			</h2>

			<c:if test="${admin != null}">
				<input type="hidden" name="id" value="<c:out value='${admin.id}' />" />
			</c:if>
			<tr>
				<th><b>Admin Name:</b></th>
				<td><input type="text" class="form-control" required
					name="name" size="45" value="<c:out value='${admin.name}' />" /></td>
			</tr>
			<tr>
				<th><b>Admin Password:</b></th>
				<td><input type="text" class="form-control" required
					name="password" size="45"
					value="<c:out value='${admin.password}' />" /></td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-success" style="background-color:
#68a0bd ; border-style:none;" >Save</button>
				</td>
			</tr>
		</table>
		</form>
		</form>
	</div>
</body>
</html>
