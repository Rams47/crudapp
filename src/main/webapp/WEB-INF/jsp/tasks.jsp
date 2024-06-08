<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Task List</title>
</head>
<body>
    <h1>Task List</h1>
    <a href="<spring:url value='/tasks/add'/>">Add Task</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="task" items="${tasks}">
            <tr>
                <td>${task.id}</td>
                <td>${task.name}</td>
                <td>${task.description}</td>
                <td>
                    <a href="<spring:url value='/tasks/edit/${task.id}'/>">Edit</a>
                    <a href="<spring:url value='/tasks/delete/${task.id}'/>">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
