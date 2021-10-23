<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head><%@include file="css/style.jsp"%>

<title>Placement Management Application</title>
</head>
<body>
	<center>
		<h1>Placement Management</h1>
		
	</center>
	<a href="AdminDashboard.html"><button type="button"
			class="btn btn-primary" style="background-color:
#68a0bd ; border-style:none;">Dashboard</button></a>
	<div align="center"  class="table">
		<table border="1" cellpadding="5" class="table-bodered">
	
				<h2>List of Certificates</h2>
		
			<tr>
				<th  scope="col">ID</th>
				<th  scope="col">Year</th>
				<th  scope="col">College</th>
				<th scope="col">Operations</th>
				

			</tr>
			<c:forEach var="certificate" items="${listCertificate}">
				<tr>
					<td><c:out value="${certificate.id}" /></td>
					<td><c:out value="${certificate.year}" /></td>
					<td><c:out value="${certificate.college}" /></td>
					<td><a
						href="certificate?action=certificateedit&id=<c:out value='${certificate.id}' />"><button type="button"
			class="btn btn-warning" style="background-color:
#68a0bd ; border-style:none;">Edit</button></a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="certificate?action=certificatedelete&id=<c:out value='${certificate.id}' />"><button type="button"
			class="btn btn-danger" style="background-color:
#68a0bd ; border-style:none;">Delete</button></a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div><br>
	<h2 align="center">
			<a href="certificate?action=certificatenew"><button type="button"
					class="btn btn-info" style="background-color:
#68a0bd ; border-style:none;">Add New Certificate</button></a>

		</h2>
</body>
</html>
