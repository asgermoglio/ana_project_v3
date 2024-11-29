<%@ taglib prefix="d" uri="jakarta.tags.core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link href="/webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
  <link href="/webjars/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.standalone.min.css" rel="stylesheet" >
  <title>List To dos page</title>
</head>
<body>
    <div class="container">
        <h1>Your Petitions</h1>
        <table class="table">
            <thead></thead>
                <tr>
                    <th>Description</th>
                    <th>Petition Date</th>
                    <th>Is Signed?</th>
                    <th>Email</th>
                    <th></th>
                    <th></th>
                </tr>
            <tbody>
                <c:forEach items="${petitions}" var="petition">
                    <tr>
                        <td>${petition.description}</td>
                        <td>${petition.targetDate}</td>
                        <td>${petition.done}</td>
                        <td>${petition.email}</td>
                        <td><a href="delete-petition?id=${petition.id}" class="bnt btn-warning"> DELETE </a></td>
                        <td><a href="update-petition?id=${petition.id}" class="bnt btn-success"> SIGN </a></td>
                    </tr>

                </c:forEach>
            </tbody>
        </table>
        <a href="add-petition" class="btn btn-success">Add Petition</a>

    </div>
<script src="/webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
<script src="webjars/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.standalone.min.css"</script>
</body>
</html>