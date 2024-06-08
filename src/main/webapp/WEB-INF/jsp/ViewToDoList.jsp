<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<head>
<meta charset="ISO-8859-1">
<title>To-Do List</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<style>
a {
	color: white;
}

a:hover {
	color: white;
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="container">
		<div
			class="d-flex flex-row justify-content-between align-items-center">
			<h1 class="p-3 mb-0">To-Do Item List</h1>
			<button id="toggleFormBtn" class="btn btn-primary ml-3">Add
				New To-Do Item</button>
		</div>
		<form:form>
			<table class="table table-bordered">
				<tr>
					<th>Id</th>
					<th>Title</th>
					<th>Date</th>
					<th>Status</th>
					<th>Mark Completed</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
				<c:forEach var="todo" items="${list}">
					<tr id="row-${todo.id}">
						<td>${todo.id}</td>
						<td>${todo.title}</td>
						<td>${todo.date}</td>
						<td>${todo.status}</td>
						<td>
							<button type="button" class="btn btn-success" onclick="markAsComplete(${todo.id})">Mark Complete</button>
						</td>
						<td>
							<form action="/editToDoItem/${todo.id}" method="post">
								<button type="submit" class="btn btn-primary">Edit</button>
							</form>
						</td>
						<td>
							<button type="button" class="btn btn-danger"
								onclick="deleteToDoItem(${todo.id})">Delete</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</form:form>

		<!-- Add To-Do Item Modal -->
		<form id="todoForm" action="/saveToDoItem" method="post"
			style="display: none;">
			<div class="form-group">
				<label for="title">Title:</label> <input type="text"
					class="form-control" id="title" name="title" required>
			</div>
			<div class="form-group">
				<label for="date">Date:</label> <input type="date"
					class="form-control" id="date" name="date" required>
			</div>
			<div class="form-group">
				<label for="status">Status:</label> <input type="text"
					class="form-control" id="status" name="status" value="Incomplete">
			</div>
			<button type="submit" class="btn btn-primary">Add New To-Do
				Item</button>
			<button type="button" id="cancelBtn" class="btn btn-secondary">Cancel</button>
		</form>
	</div>

	<script>
		document.addEventListener("DOMContentLoaded", function() {
	        const toggleFormBtn = document.getElementById("toggleFormBtn");
	        const todoForm = document.getElementById("todoForm");
	        const cancelBtn = document.getElementById("cancelBtn");
	
	        toggleFormBtn.addEventListener("click", function() {
	            todoForm.style.display = "block";
	            toggleFormBtn.style.display = "none";
	        });
	
	        cancelBtn.addEventListener("click", function() {
	            todoForm.style.display = "none";
	            toggleFormBtn.style.display = "block";
	        });
	    });
		
		function markAsComplete(id) {
            if(confirm('Are you sure you want to mark this item as complete?')) {
                $.ajax({
                    url: '/updateToDoStatus/' + id,
                    type: 'post',
                    success: function(result) {
                        toastr.success('Item marked as complete successfully!!');
                        $('#row-' + id + ' td:eq(3)').text('Complete');
                    },
                    error: function(xhr, status, error) {
                        toastr.error('Some error occurred, couldn\'t mark item as complete');
                    }
                });
            }
        }
		
        function deleteToDoItem(id) {
            if(confirm('Are you sure you want to delete this item?')) {
                $.ajax({
                    url: '/deleteToDoItem/' + id,
                    type: 'post',
                    success: function(result) {
                        toastr.success('Item deleted successfully!!');
                        $('#row-' + id).remove();
                    },
                    error: function(xhr, status, error) {
                        toastr.error('Some error occurred, couldn\'t delete item');
                    }
                });
            }
        }

        window.onload = function() {
            var msg = "${message}";
            if (msg == "Save Success") {
                toastr.success("Item added successfully!!");
            } else if (msg == "Delete Success") {
                toastr.success("Item deleted successfully!!");
            } else if (msg == "Delete Failure") {
                toastr.error("Some error occurred, couldn't delete item");
            } else if (msg == "Edit Success") {
                toastr.success("Item updated successfully!!");
            }
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "newestOnTop": false,
                "progressBar": true,
                "positionClass": "toast-top-right",
                "preventDuplicates": false,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "5000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
        }
    </script>
</body>
</html>
