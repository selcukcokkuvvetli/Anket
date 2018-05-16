<%@ page language="java" contentType="text/html; charset=ISO-8859-9" pageEncoding="ISO-8859-9"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
    <title>Login Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <%@page import= "javax.servlet.http.*"%>
</head>
<body>
    
    <%@page import="com.servlet.Enter" %>
    <%@page import ="java.util.*" %>
    
    <% if(session.getAttribute("login") != null)
		{
			response.sendRedirect("survey.jsp");	
		}
                String msg =(String) request.getAttribute("msg");
                if (msg==null)
                {
                    msg="Welcome to SurveyBot";
                }
    %>
    <form action="Enter" method="POST">
<div class="container">
    <div class="row">
        <div class="col"></div>
        <div class="col-md-4 col-md-offset-4" style="padding-top:20%;">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><%=msg%></h3>
                </div>
                <div class="panel-body">
                    <form role="form">
                        <fieldset>
                            <div class="form-group">
                               <input class="form-control" name="email" placeholder="E-mail" name="txtEmail" type="text" autofocus>
                            </div>
                            <div class="form-group">
                                <input class="form-control" name="pass" placeholder="Password" name="txtPassword" type="password" value="">
                            </div>
                            <!-- Change this to a button or input when using this as a form -->
                            <button type="submit" id="btnLogin" class="btn btn-success float-md-right">Login</button>
                            <p>New Member? <a href="./register.jsp" class="">Sign up</a></p>
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
