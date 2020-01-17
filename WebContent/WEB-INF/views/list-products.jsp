<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

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
      <li class="nav-item active mr-4">
        <a class="nav-link" href="${pageContext.request.contextPath}">HOME <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item mr-4">
        <a class="nav-link" href="/">ABOUT</a>
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
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/home">ADMIN PAGE</a>
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

	<h3 class="text-center" style="margin-top: 5vh; margin-bottom: -20vh;">All Products</h3>

	<!-- home section -->
	<section id="home2">
		<div class="container">
			<div class="row">
				<div class="col">
				<input style="margin-right: 85vw;" type="button" value="Add Product" onclick="window.location.href = 'showFormForAddingProduct'; return false;"
				class="add-button"/>
					<table class="table table-striped">
  					<thead class="thead-dark">
    					<tr>
      						<th scope="col">#</th>
      						<th scope="col">Product Name</th>
      						<th scope="col">Price(<naira>&#x20A6;</naira>)</th>
      						<th scope="col">Category</th>
      						<th scope="col">Actions</th>
    					</tr>
  					</thead>
  					<tbody>
  					<!-- Looping over and printing all the products -->
  					<c:forEach var="tempProduct" items="${products}">
  						<!-- constructing an update link with customer id -->
							<c:url var="updateLink" value="/admin/showFormForProductUpdate">
								<c:param name="productId" value="${tempProduct.id}"></c:param>
							</c:url>
							<!-- constructing an delete link with customer id -->
							<c:url var="deleteLink" value="/admin/deleteProduct">
								<c:param name="productId" value="${tempProduct.id}"></c:param>
							</c:url>
    					<tr>
      						<th scope="row">${tempProduct.id}</th>
      						<td>${tempProduct.productName}</td>
      						<td>${tempProduct.price}</td>
      						<td>${tempProduct.category}</td>
      						<td>
      							<!-- Displaying the Update and Delete Link -->
							<a href="${updateLink}">Update</a>
							|
							<a href="${deleteLink}" onclick="if(!(confirm('Are you sure you want to delete this product?'))) return false">Delete</a>
      						</td>
    					</tr>
    				</c:forEach>				  
					 </tbody>
				</table>
				
				</div>
				
			</div>
		</div>
  	</section>
	
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