<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Task</title>
</head>
<body>
    <h1>Edit Task</h1>
    <form action="<spring:url value='/tasks/edit/${task.id}'/>" method="post">
        <table>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" value="${task.name}" /></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td><input type="text" name="description" value="${task.description}" /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Save Changes" /></td>
            </tr>
        </table>
    </form>
</body>
</html>
