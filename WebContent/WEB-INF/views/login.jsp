<!-- My Tag Libs -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page session="true"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Login</title>
	<style>
		.failed
		{
			color: red;
		}
	</style>

	 <!--Linking my Css Files-->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/index.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/form-elements.css" rel="stylesheet">
   
    <!--Links to my Fonts -->
    <link href="${pageContext.request.contextPath}/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/font-awesome.css" rel="stylesheet">
</head>
<body>
	
	<section class="top-content">
    <div class="inner-bg">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-sm-8 col-sm-offset-2 text">
            <h1 id="welcomeHeader"><strong>Welcome To  Denvato Store</strong></h1>
            <div class="description">
              
            </div>
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="col-sm-6 col-sm-offset-3 form-box">
            <div class="form-top">
              <div class="form-top-left" style="margin-top: -90px;">
                <h3>Login to our site</h3>
                 <p>Enter your username and password to login:</p>
              </div>
              <div class="form-top-right">
                <i class="fa fa-lock"></i>
              </div>
            </div>
            <div class="form-bottom"><!--Login Form -->
              <form:form role="form" action="${pageContext.request.contextPath}/authenticateUser" method="POST" class="login-form">
              		<!-- Checking for Login Error -->
              		<c:if test="${param.error != null }">
              			<i class="failed">Sorry! You entered invalid credentials</i>
              		</c:if>
              		
              		<c:if test="${param.logout != null }">
              			<div class="alert alert-success col-xs-offset-1 col-xs-10">
              				Logged out Successfully
              			</div>
              		</c:if>
              		
                            <div class="form-group">
                              <label class="sr-only" for="username">Username</label>
                                <input type="text" name="username" placeholder="Username..." class="form-username form-control" id="username">
                              </div>
                              <div class="form-group">
                                <label class="sr-only" for="password">Password</label>
                                <input type="password" name="password" placeholder="Password..." class="form-password form-control" id="password">
                              </div>
                              <button type="submit" class="btn">Sign in!</button>
                              <p>Dont have an Account yet? <a id="registerLink" href="${pageContext.request.contextPath}/showRegistrationPage">Register Here</a></p>
                               <a type="submit" class="btn btn-success text-white" href="${pageContext.request.contextPath}/">Continue as Guest</a>
              </form:form>
            </div>
          </div>
        </div>
        <div class="row justify-content-center text-center" style="margin-left: 6px">
          <div class="col-sm-6 col-sm-offset-3 social-login">
            <h3>...or login with:</h3>
            <div class="social-login-buttons">
              <a class="btn btn-link-1 btn-link-1-facebook" href="#">
                              <i class="fa fa-facebook"></i> Facebook
                          </a>
                          <a class="btn btn-link-1 btn-link-1-twitter" href="#">
                              <i class="fa fa-twitter"></i> Twitter
                          </a>
                          <a class="btn btn-link-1 btn-link-1-google-plus" href="#">
                              <i class="fa fa-google-plus"></i> Google Plus
                          </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/script.js"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/nivo-lightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/jquery.backstretch.min.js"></script>
</body>
</html>