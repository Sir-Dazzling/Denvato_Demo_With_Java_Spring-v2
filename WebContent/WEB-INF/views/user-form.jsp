<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        <a class="nav-link" href="${pageContext.request.contextPath}/">ABOUT</a>
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
      <li class="nav-item mr-4">
        <a class="nav-link active" href="${pageContext.request.contextPath}/admin/home">ADMIN PAGE</a>
      </li>
      <li class="nav-item mr-4">
      	<a class="nav-link" href="#">CART <i class="fa fa-cart-plus" style="font-size: 17px;"></i>
      	</a>
      </li>
      <li class="nav-item mr-4"><a class="nav-link" href="#">LOG OUT</a></li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>


</body>
	
	<section class="formSection container" style="margin-bottom: 30px;">
    	<h3>User Account Form</h3>
    		<form:form id="userForm" action="saveAdminUser" modelAttribute="user" method="POST">
    		
    			<!-- Associating data with Username -->
				<form:hidden path="username"/>
				
      				<h5 class="text-info">Save User</h5>
      				
  					<div class="form-group col-md-8">
    					<label for="username">User Name</label>
    					<form:input type="text" class="form-control" id="username" aria-describedby="emailHelp" placeholder="Enter User Name" path="username"/>
  					</div>
					 <div class="form-group col-md-8">
					   <label for="price">Password</label>
					   <form:input type="text" class="form-control" id="password" placeholder="Enter Passowrd" path="password" />
					 </div>
					 <div class="form-group col-md-8">
    					<label for="firstname">First Name</label>
    					<form:input type="text" class="form-control" id="firstname" aria-describedby="emailHelp" placeholder="Enter First Name" path="firstName"/>
  					</div>
  					<div class="form-group col-md-8">
    					<label for="firstname">Last Name</label>
    					<form:input type="text" class="form-control" id="lastname" aria-describedby="emailHelp" placeholder="Enter Last Name" path="lastName"/>
  					</div>
  					<div class="form-group col-md-8">
    					<label for="firstname">Email</label>
    					<form:input type="text" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Email" path="email"/>
  					</div>
  					<div class="form-group col-md-8">
  						<label for="sel1">Gender:</label>
  							<form:select class="form-control" id="sel1" name="gender" path="gender">
    							<option>Male</option>
    							<option>Female</option>
  							</form:select>
					</div>
					<div class="form-group col-md-8">
    					<label for="phoneno">Phone No</label>
    					<form:input type="text" class="form-control" id="phoneno" aria-describedby="emailHelp" placeholder="Enter Phone Number" path="phoneno"/>
  					</div>
  					<div class="form-group col-md-8">
  						<label for="sel2">Enabled:</label>
  							<form:select class="form-control" id="sel1" name="enabled" path="enabled">
    							<option>0</option>
    							<option>1</option>
  							</form:select>
					</div>
					
				  <button type="submit" class="btn btn-primary">Save</button>
				  <a class="btn btn-success"  href="${pageContext.request.contextPath}/admin/usersList">Back to list</a>
		</form:form>
	</section>
</body>


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