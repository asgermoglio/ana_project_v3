<%@ taglib prefix="d" uri="jakarta.tags.core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <link href="/webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
  <title>Add Petition Page</title>
</head>
<body>
    <div class="container">
        <h1> Enter Petition Details</h1>
        <form:form method="post" modelAttribute="petition">

            <fieldset class="mb-3">
                <form:label path="description">Description</form:label>
                <form:input type="text" name="description" required="required" path="description"/>
                <form:errors path="description" cssClass="text-warning"/>
            </fieldset>

            <fieldset class="mb-3">
                <form:label path="targetDate">Petition Date</form:label>
                <form:input type="text" name="description" required="required" path="targetDate"/>
                <form:errors path="targetDate" cssClass="text-warning"/>
            </fieldset>

            <fieldset class="mb-3">
                <form:label path="email">Insert your email</form:label>
                <form:input type="text" name="email" path="email"/>
                <form:errors path="email" cssClass="text-warning"/>
            </fieldset>

            <fieldset class="mb-3">
                <form:label path="done">Check the box to sign the petition</form:label>
                <form:checkbox name="done" path="done"/>
                <form:errors path="done" cssClass="text-warning"/>
            </fieldset>

            <form:input type="hidden" path="id" />

            <input type="submit" name="btn btn-success" />
        </form:form>
    </div>
</body>
<script src="/webjars/bootstrap/5.1.3/js/bootstrap.min.js"</script>
<script src="/webjars/jquery/3.6.0/jquery.min.js"</script>
<script type="text/javascript">
    $('#targetDate').datepicker({
            format: 'yyyy-mm-dd'
        });
</script>
</body>
</html>