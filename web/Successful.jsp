

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./source/css/bootstrap.min.css">
    <title>Register Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
</head>
<body>
    <%if(session.getAttribute("login")!=null)
    {
        response.sendRedirect("survey.jsp");
    }
    %>
<div class="container">
    <div class="row">
        <div class="col"></div>
        <div class="col-md-4 col-md-offset-4" style="padding-top:20%;">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Succesfully Registered</h3>
                </div>
                <div class="panel-body">
                    <form role="form">
                        <fieldset>
                            <p>You can Login from here  <a href="./index.jsp" class="">Login Now</a></p>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
        <div class="col"></div>
    </div>
</div>
<script src="./source/js/bootstrap.min.js"></script>

</body>
</html>
