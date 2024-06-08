<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Task</title>
</head>
<body>
    <h1>Add Task</h1>
    <form action="<spring:url value='/tasks/add'/>" method="post">
        <table>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" /></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td><input type="text" name="description" /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Add Task" /></td>
            </tr>
        </table>
    </form>
</body>
</html>
