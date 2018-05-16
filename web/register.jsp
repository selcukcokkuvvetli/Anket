

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
    <% if(session.getAttribute("login") != null)
		{
			response.sendRedirect("survey.jsp");	
		}
	%>
        <form action="Register" method="POST">
<div class="container">
    <div class="row">
        <div class="col"></div>
        <div class="col-md-4 col-md-offset-4" style="padding-top:10%;">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Sign Up</h3>
                </div>
                <div class="panel-body">
                    <form id="signup" name="signup" methot="post" action="signup.jsp">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" name="first_name" placeholder="Name" name="txtFirstname" type="text" autofocus>
                            </div>
                            <div class="form-group">
                                <input class="form-control" name="last_name" placeholder="Surname" name="txtLastname" type="text" autofocus>
                            </div>
                            <div class="form-group">
                                <input class="form-control" name="email" placeholder="E-mail" name="txtEmail" type="text" autofocus>
                            </div>
                            <div class="form-group">
                                <input class="form-control" name="pass" placeholder="Password" name="txtPassword" type="password" value="">
                            </div>
                            <!-- Change this to a button or input when using this as a form -->
                            <button type="submit" id="signupbtn" class="btn btn-success float-md-right">Sign Up</button>
                            <%
                                String msg =(String) request.getAttribute("msg");
                                if (msg==null)
                                {
                                    msg="";
                                }
                            %>
                            <%=msg%>
                            <p><a href="index.jsp">Sing in</a></p>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
        <div class="col"></div>
    </div>
</div>         
<script src="./source/js/bootstrap.min.js"></script>
        </form>
</body>
</html>
