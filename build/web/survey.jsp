<%@ page language="java" contentType="text/html; charset=ISO-8859-9" pageEncoding="ISO-8859-9"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cantekin Anket</title>
    <meta charset="Unicode">
    <link rel="stylesheet" href="./css/bootstrap.min.css"/>
    <link rel="stylesheet" href="./css/style.css"/>
</head>
<body>
    <% if(session.getAttribute("login") == null)
		{
			response.sendRedirect("index.jsp");	
		}
    %>
    <%ArrayList<String> quest=(ArrayList<String>)session.getAttribute("question");%>
    
<div class="container">
    <div class="header">
        <div class="row">
            <h3>
                <h5>Welcome to our Survey <%=session.getAttribute("name")%>  <%=session.getAttribute("surname")%>  <br>  </h5>
                    <form method="post" action="logout">
                        <div class="btn-side">
                            <button type="submit" class="btn btn-success">Log Out </button>
                        </div>
                    </form>
            </h3>
        </div>
    </div>
    <div class="content">
        <div class="row info-bar">
            <div class="col-md-12">
                <span class="float-md-right">Please rate acording to : 1-Very Bad 2- Bad  3-Avarege  4-Good  5-Very Goood</span>

            </div>
        </div>
        <form action="finishSurvey" method="post">
            <div class="row questions">
                <div class="col-md-12 question">
                    <p class=""><strong>
                          <%=quest.get(0)%>
                    </strong>
                    </p>
                </div>
                <div class="answers">
                    <div class="col-md-2 form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="q-1" id="ans-1" value="ans-1">
                        <label class="form-check-label" for="ans-1">1</label>
                    </div>
                    <div class="col-md-2 form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="q-1" id="ans-2" value="ans-2">
                        <label class="form-check-label" for="ans-2">2</label>
                    </div>
                    <div class="col-md-2 form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="q-1" id="ans-3" value="ans-3">
                        <label class="form-check-label" for="ans-3">3</label>
                    </div>
                    <div class="col-md-2 form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="q-1" id="ans-4" value="ans-4">
                        <label class="form-check-label" for="ans-4">4</label>
                    </div>
                    <div class="col-md-2 form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="q-1" id="ans-5" value="ans-5">
                        <label class="form-check-label" for="ans-5">5</label>
                    </div>
                </div>
            </div>
            <div class="row questions">
                <div class="col-md-12 question">
                    <p class=""><strong>
                        <%=quest.get(1)%>
                    </strong>
                    </p>
                </div>
                <div class="answers">
                    <div class="col-md-2 form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="q-2" id="ans-1" value="ans-1">
                        <label class="form-check-label" for="ans-1">1</label>
                    </div>
                    <div class="col-md-2 form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="q-2" id="ans-2" value="ans-2">
                        <label class="form-check-label" for="ans-2">2</label>
                    </div>
                    <div class="col-md-2 form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="q-2" id="ans-3" value="ans-3">
                        <label class="form-check-label" for="ans-3">3</label>
                    </div>
                    <div class="col-md-2 form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="q-2" id="ans-4" value="ans-4">
                        <label class="form-check-label" for="ans-4">4</label>
                    </div>
                    <div class="col-md-2 form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="q-2" id="ans-5" value="ans-5">
                        <label class="form-check-label" for="ans-5">5</label>
                    </div>
                </div>
            </div>
            <div class="row questions">
                <div class="col-md-12 question">
                    <p class=""><strong>
                        <%=quest.get(2)%>
                    </strong>
                    </p>
                </div>
                <div class="answers">
                    <div class="col-md-2 form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="q-3" id="ans-1" value="ans-1">
                        <label class="form-check-label" for="ans-1">1</label>
                    </div>
                    <div class="col-md-2 form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="q-3" id="ans-2" value="ans-2">
                        <label class="form-check-label" for="ans-2">2</label>
                    </div>
                    <div class="col-md-2 form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="q-3" id="ans-3" value="ans-3">
                        <label class="form-check-label" for="ans-3">3</label>
                    </div>
                    <div class="col-md-2 form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="q-3" id="ans-4" value="ans-4">
                        <label class="form-check-label" for="ans-4">4</label>
                    </div>
                    <div class="col-md-2 form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="q-3" id="ans-5" value="ans-5">
                        <label class="form-check-label" for="ans-5">5</label>
                    </div>
                </div>
            </div>
            <div class="row btn w-100">
                <div class="btn-side">
                    <button type="submit" class="btn btn-success">Send</button>
                </div>
            </div>
        </form>
    </div>
    <div class="footer">

    </div>
</div>
<script src="./js/bootstrap.min.js"></script>
</body>
</html>