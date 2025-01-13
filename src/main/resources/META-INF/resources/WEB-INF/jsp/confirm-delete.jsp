<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Deletion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f7f7f7;
        }

        .modal-content {
            padding: 20px;
        }

        .modal-header {
            border-bottom: none;
        }

        .modal-footer {
            justify-content: space-between;
        }
    </style>
</head>
<body>
    <div class="container d-flex justify-content-center align-items-center" style="height: 100vh;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Confirm Deletion</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete the task with ID: <strong>${id}</strong>?</p>
                    <form action="delete-todo" method="get" id="deleteForm">
                        <input type="hidden" name="id" value="${id}">
                        <input type="hidden" name="confirm" value="true">
                    </form>
                </div>
                <div class="modal-footer">
                    <a href="todo-list" class="btn btn-secondary">Cancel</a>
                    <button type="submit" class="btn btn-danger" onclick="document.getElementById('deleteForm').submit()">Yes, Delete</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Automatically show the modal when the page loads
        window.onload = function() {
            const modal = new bootstrap.Modal(document.getElementById('exampleModal'));
            modal.show();
        };
    </script>
</body>
</html>
