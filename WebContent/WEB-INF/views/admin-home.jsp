<!-- My Tag Libs -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@page session="true"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Denvato Demo V2</title>

	 <!--Linking my Css Files-->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/index.css" rel="stylesheet">
   
    <!--Links to my Fonts -->
    <link href="${pageContext.request.contextPath}/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/font-awesome.css" rel="stylesheet">
</head>
<body>
	<!--Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top custom-navbar p-2">
  <a class="navbar-brand" href="#">Denvato</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item  mr-4">
        <a class="nav-link" href="${pageContext.request.contextPath}">HOME <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item mr-4">
        <a class="nav-link" href="#">ABOUT</a>
      </li>
      <li class="nav-item mr-4 dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          CATEGORIES
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item mr-4">
        <a class="nav-link" href="#">CONTACT</a>
      </li>
     <security:authorize access="hasRole('ADMIN')">
      	<li class="nav-item mr-4">
       		 <a class="nav-link" href="${pageContext.request.contextPath}/admin/home">ADMIN PAGE</a>
      	</li>
      </security:authorize>
      <li class="nav-item mr-4">
      	<a class="nav-link" href="#">CART <i class="fa fa-cart-plus" style="font-size: 17px;"></i>
      	</a>
      </li>
       <!-- Display User name -->
       <li class="nav-item mr-4">
       		<c:if test="${pageContext.request.userPrincipal.name != null}">
				<a class="nav-link" style="text-transform: uppercase;  color: #00c6d7; cursor: pointer;">
      				<security:authentication property="principal.username"/>
      			</a>
			</c:if>
			<c:if test="${pageContext.request.userPrincipal.name == null}">
				<a class="nav-link" style="text-transform: uppercase;  color: #00c6d7; cursor: pointer;">
      				GUEST
      			</a>
			</c:if>
      	
      </li> 
      <!-- Log In/Out Button -->
      <c:if test="${pageContext.request.userPrincipal.name != null}">
			 <form:form action="${pageContext.request.contextPath}/logout" method="POST">
      			<li class="nav-item mr-4"><input class="nav-link btn" type="submit" value="LOG OUT"></li>
      		</form:form>			
	  </c:if>
	   <c:if test="${pageContext.request.userPrincipal.name == null}">
	   	<li class="nav-item mr-4">
	   		 <a class="nav-link" href="${pageContext.request.contextPath}/showLoginPage">LOG IN</a>		
	  	</li>
			
	  </c:if>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>


	<div class="jumbotron container" id="adminJumbo" style="margin-top: 15vh; margin-bottom: 25vh;">
    	<h1 class="display-5 text-center">Hello <security:authentication property="principal.username"/>, Welcome to the Admin Page</h1>
    	<p class="lead text-info">All CRUD operations can be done in this section</p>
  		<hr class="my-4">
  		<p>Click on one of the following links to get started.</p>
  		<a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/admin/productsList" role="button">Products List</a>
  		<a class="btn btn-success btn-lg" href="${pageContext.request.contextPath}/admin/usersList" role="button">User Accounts Operations</a>
  </div>


 <footer class="text-center">

        <div class="social_icon">
          <a href="#" class="fa fa-facebook"></a>
          <a href="#" class="fa fa-twitter"></a>
          <a href="#" class="fa fa-linkedin"></a>
          <a href="#" class="fa fa-tumblr"></a>
        </div>


    <p>Copyright &copy; 2019 DazzlingStar</p>

    <!-- start back to top -->
      <a href="#top" class="go-top"><i class="fa fa-chevron-up fa-1x"></i></a>
    <!-- end back to top -->
 </footer>





 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/index.js"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/nivo-lightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/jquery.backstretch.min.js"></script>
</body>
</html>