<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create/Edit Task</title>
</head>
<body>
<h2>Create/Edit Task</h2>
<form:form method="post" modelAttribute="task">
    <table>
        <tr>
            <td>Title:</td>
            <td><form:input path="title"/></td>
        </tr>
        <tr>
            <td>Description:</td>
            <td><form:textarea path="description"/></td>
        </tr>
        <tr>
            <td>Due Date:</td>
            <td><form:input path="dueDate" type="date"/></td>
        </tr>
        <tr>
            <td>Status:</td>
            <td>
                <form:select path="status">
                    <form:option value="Pending">Pending</form:option>
                    <form:option value="In Progress">In Progress</form:option>
                    <form:option value="Completed">Completed</form:option>
                </form:select>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="Save"/>
            </td>
        </tr>
    </table>
</form:form>
<a href="/tasks">Back to Task List</a>
</body>
</html>
