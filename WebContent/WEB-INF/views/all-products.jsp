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
      <li class="nav-item active mr-4">
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
      <security:authorize access="hasRole('EMPLOYEE')">
      	<li class="nav-item mr-4">
       		 <a class="nav-link" href="${pageContext.request.contextPath}/admin/home">ADMIN PAGE</a>
      	</li>
      </security:authorize>
    
      	<li class="nav-item mr-4">
      		<a class="nav-link" href="#" data-toggle="modal" data-target="#myModal">CART <i class="fa fa-cart-plus"></i>(<span id="simpleCart_quantity" class="simpleCart_quantity"></span> Items)</a>
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
      			<li class="nav-item mr-4"><input class="nav-link btn simpleCart_empty" type="submit" value="LOG OUT"></li>
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


	<!-- Modal -->
  	<div class="modal fade" id="myModal" role="dialog">
    	<div class="modal-dialog">
    
      	<!-- Modal content-->
      	<div class="modal-content">
        	<div class="modal-header">
          	<button type="button" class="close" data-dismiss="modal">&times;</button>
          		<h4 class="modal-title">Cart Items</h4>
        </div>
        <div class="modal-body">
          

            <div class="simpleCart_shelfItem text-center">
              <div class="simpleCart_items">
                
              </div>
            </div>


  
          <p>Total : <span class="simpleCart_total"></span>(<span id="simpleCart_quantity" class="simpleCart_quantity"></span> Items)</p>
          <p><a href="javascript:;" class="simpleCart_empty">empty cart</a></p>
        </div>
        <div class="modal-footer">
          <a type="button" class="btn btn-info" href="${pageContext.servletContext.contextPath}/check_out">Check Out</a>
          <button type="button" class="btn btn-success" data-dismiss="modal">Continue Shopping</button>
        </div>
      </div>
      
    </div>
  </div>

	
	<!-- Main Section -->
  <section class="mainSection" style="margin-top: 15vh; margin-bottom: 30vh">
    <div class="container">
      <div class="row">
        <div class="col-lg-3">
          <h1 class="my-4" id="categoryHeader">Categories</h1>
          <div class="list-group">
          		  <a href="${pageContext.request.contextPath}/allProducts" class="list-group-item">All</a>
                  <a href="${pageContext.request.contextPath}/showMens" class="list-group-item ">Mens</a>
                  <a href="${pageContext.request.contextPath}/showWomens" class="list-group-item ">Womens</a>
                  <a href="${pageContext.request.contextPath}/showJerseys" class="list-group-item">Jerseys</a>
                  <a href="${pageContext.request.contextPath}/showSneakers" class="list-group-item">Sneakers</a>
                  <a href="${pageContext.request.contextPath}/showCapsAndHeadwears" class="list-group-item">Caps and Head Wears</a>
                  <a href="${pageContext.request.contextPath}/showWatches" class="list-group-item">Watches</a>
              </div>
        </div>
        <div class="col-lg-9">
          <div class="row">
          <c:forEach var="tempProduct" items="${products}">
            <div class="col-lg-4 col-md-6 mb-4">
              <div class="simpleCart_shelfItem card h-100">
                       <a href="#"><img class="card-img-top img-responsive" src="${pageContext.request.contextPath}/static/images/<c:out value="${tempProduct.imageUrl}"></c:out>.jpg" alt=""></a>
                      <div class="card-body">
                        <h4 class="card-title item_name">
                            <a href="#"><c:out value="${tempProduct.productName}"></c:out></a>
                        </h4>
                        <h5 class="item_price"><naira>&#x20A6;</naira><c:out value="${tempProduct.price}"></c:out></h5>  
                        <button type="submit" class="item_add" data-toggle="modal" data-target="#myModal">Add to Cart</button>
                    </div>
                      <div class="card-footer">
                <!-- Condition code to display which star rating for each product -->
						<c:choose>
							<c:when test="${tempProduct.rating == 1 }">
								<small class="text-muted">&#9733; &#9734; &#9734; &#9734; &#9734;</small>
							</c:when>
							<c:when test="${tempProduct.rating == 2 }">
								<small class="text-muted">&#9733; &#9733; &#9734; &#9734; &#9734;</small>
							</c:when>
							<c:when test="${tempProduct.rating == 3 }">
								<small class="text-muted">&#9733; &#9733; &#9733; &#9734; &#9734;</small>
							</c:when>
							<c:when test="${tempProduct.rating == 4 }">
								<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
							</c:when>
							<c:when test="${tempProduct.rating == 5 }">
								<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9733;</small>
							</c:when>
							<c:otherwise>
								<small class="text-muted">&#9734; &#9734; &#9734; &#9734; &#9734;</small>
							</c:otherwise>
						</c:choose>
                      </div>
                  </div>
          </div>
  
          </c:forEach> 
        </div>
           
      
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
    <script src="${pageContext.request.contextPath}/static/scripts/simpleCart.js"></script>
      <script><!--Script to make the Columns for the Cart-->
      simpleCart({
    	    checkout: {
    	      type: "PayPal",
    	      email: "you@yours.com"
    	    },
    	    cartStyle: "table", 
    	    cartColumns: [
    	   
    	    /* Name */
    	        { attr: "name", label: "Product Name"},
    	    /* Quantity */
    	        { view: "decrement" , label: false },
    	        { attr: "quantity" , label: "Quantity" } ,
    	        { view: "increment" , label: false },
    	    /* Price */
    	        { attr: "price" , label: "Price" } ,
    	    /* Remove */
    	        { view: "remove" , text: "Remove" , label: false }
    	        ]
    	  });
  </script>
</body>
</html>