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
	<title>Register</title>
	<style>
		.failed, error
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
          <div class="col-sm-6 col-sm-offset-3 form-box">
            <div class="form-top">
              <div class="form-top-left" style="margin-top: -90px;">
                <h3>Register Here</h3>
                 <p>Please fill out all details carefully</p>
              </div>
              <div class="form-top-right">
                <i class="fa fa-user"></i>
              </div>
            </div>
            <div class="form-bottom"><!--Login Form -->
              <form:form role="form" action="${pageContext.request.contextPath}/processRegistrationForm" method="POST" class="login-form" modelAttribute="user">
                            <div class="form-group">
                              <label class="sr-only" for="firstname">First Name</label>
                                <form:input path="firstName" type="text" name="firstname" placeholder="First Name..." class="form-firstname form-control" id="firstname" />
                                <form:errors path="firstName" cssClass="error" />
                            </div>
                            <div class="form-group">
                              <label class="sr-only" for="lastname">Last Name</label>
                                <form:input path="lastName" type="text" name="lastname" placeholder="Last Name..." class="form-lastname form-control" id="lastname" />
                                <form:errors path="lastName" cssClass="error" />
                            </div>
                            <div class="form-group">
                              <label class="sr-only" for="email">Email</label>
                                <input type="text" name="email" placeholder="Email..." class="form-email form-control" id="email">
                            </div>
                            <div class="form-group">
                              <label class="sr-only" for="phoneno">Phone Number</label>
                                <form:input path="phoneno" type="text" name="phoneno" placeholder="Phone Number..." class="form-phoneno form-control" id="phoneno" onkeypress="return isNumberKey(event)" />
                                <form:errors path="phoneno" cssClass="error" />
                            </div>
                            <div class="form-group">
  										<label for="sel1">Gender:</label>
  										<select class="form-control" id="sel1" name="gender">
    										<option>Male</option>
    										<option>Female</option>
  										</select>
							</div>
                            <div class="form-group">
                              <label class="sr-only" for="username">User Name</label>
                                <form:input path="username" type="text" name="username" placeholder="User Name..." class="form-username form-control" id="username" />
                                <form:errors path="username" cssClass="error" />
                            </div>
                             <div class="form-group">
                               <label class="sr-only" for="password">Password</label>
                               <form:input path="password" type="password" name="password" placeholder="Password..." class="form-password form-control" id="password" />
                               <form:errors path="password" cssClass="error" />
                             </div>
                              <div class="form-group">
			                    <label class="sr-only" for="cpassword">Confirm Password</label>
			                    <input type="password"  name="cpassword"  placeholder="Confirm Password..." class="form-cpassword form-control" id="cpassword" />
			                    <span id="password_text2"></span>
			                  </div>
                       			
                              <button type="submit" class="btn" >Submit</button>
                              <p><a id="registerLink" href="${pageContext.request.contextPath}/showLoginPage">Back to Login Page</a></p>
              </form:form>
            </div>
          </div>
        </div>
        <div class="row justify-content-center text-center" style="margin-left: 6px">
          <div class="col-sm-6 col-sm-offset-3 social-login">
            <h3>...or Register with:</h3>
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
    <script src="${pageContext.request.contextPath}/static/scripts/script2.js"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/script3.js"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/nivo-lightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/jquery.backstretch.min.js"></script>
</body>
</html>