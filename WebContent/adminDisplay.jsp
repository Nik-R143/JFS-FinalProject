<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<%@include file="css/style.jsp"%>

	<title>Placement Management Application</title>
</head>
<body>
	<center>
		<h1>Placement Management</h1>
        
	</center>
	<a href="AdminDashboard.html"><button type="button"
			class="btn btn-primary" style="background-color:
#68a0bd ; border-style:none;">Dashboard</button></a>
    <div align="center" class="table">
        <table border="1" cellpadding="5" class="table-bodered">
            <h2>List of Admins</h2>
            <tr>
                <th scope="col" >ID</th>
                <th scope="col" >Name</th>
                <th scope="col" >Password</th>
                <th scope="col">Operations</th>
                
            </tr>
            <c:forEach var="admin" items="${listAdmin}">
                <tr>
                    <td><c:out value="${admin.id}" /></td>
                    <td><c:out value="${admin.name}" /></td>
                    <td><c:out value="${admin.password}" /></td>
                    <td>
                    	<a href="Admin?action=Adminedit&id=<c:out value='${admin.id}' />"><button type="button"
			class="btn btn-warning" style="background-color:
#68a0bd ; border-style:none;">Edit</button></a>
                    	&nbsp;&nbsp;&nbsp;&nbsp;
                    	<a href="Admin?action=Admindelete&id=<c:out value='${admin.id}' />"><button type="button"
			class="btn btn-danger" style="background-color:
#68a0bd ; border-style:none;">Delete</button></a>                    	
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>	<br>
    <h2 align="center">
        	<a href="Admin?action=Adminnew"><button type="button"
			class="btn btn-info" style="background-color:
#68a0bd ; border-style:none;">Add New Admin</button></a>
        	
        	
        </h2>
</body>
</html>
