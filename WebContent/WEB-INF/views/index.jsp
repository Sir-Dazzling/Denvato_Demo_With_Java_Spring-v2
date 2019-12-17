<!-- My Tag Libs -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <a class="nav-link" href="#">HOME <span class="sr-only">(current)</span></a>
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

<!-- home section -->
<section id="home">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<!--/banner-->
				<div class="banner-info">
            <p id="trend">Trending of the week</p>
            <h3 class="mb-4">Casual Shoes for Men</h3>
            <div class="ban-buttons">
                <a href="shop-single.html" class="btn">Shop Now</a>
                <a href="single.html" class="btn active">All Products</a>
            </div>
        	</div>
		</div>
		</div>
	</div>		
</section>


<!-- Features Section -->
	<section class="about">
		<div class="container-fluid">
			<div class="row feature-grids">
				<div class="col-lg-3 gd-bottom">
					 <div class="bottom-gd row">
                        <div class="icon-gd col-md-3 text-center"><span class="fa fa-truck" style="color: #00c6d7;" aria-hidden="true"></span></div>
                        <div class="icon-gd-info col-md-9">
                            <h3 class="mb-2">FREE SHIPPING</h3>
                            <p>On all order over <naira>&#x20A6;</naira>50,000</p>
                        </div>
                    </div>
				</div>
				<div class="col-lg-3 gd-bottom">
                    <div class="bottom-gd row bottom-gd2-active">
                        <div class="icon-gd col-md-3 text-center"><span class="fa fa-bullhorn " style="color: red" aria-hidden="true"></span></div>
                        <div class="icon-gd-info col-md-9">
                            <h3 class="mb-2">FREE RETURN</h3>
                            <p>On 1st exchange in 30 days</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 gd-bottom">
                    <div class="bottom-gd row">
                        <div class="icon-gd col-md-3 text-center"> <span class="fa fa-gift" style="color: #00c6d7"; aria-hidden="true"></span></div>

                        <div class="icon-gd-info col-md-9">
                            <h3 class="mb-2">MEMBER DISCOUNT</h3>
                            <p>Register & save up to <naira>&#x20A6;</naira>29%</p>
                        </div>

                    </div>
                </div>
                <div class="col-lg-3 gd-bottom">
                    <div class="bottom-gd row">
                        <div class="icon-gd col-md-3 text-center"> <span aria-hidden="true" style="color: #00c6d7;">&#x20A6;</span></div>
                        <div class="icon-gd-info col-md-9">
                            <h3 class="mb-2">PREMIUM SUPPORT</h3>
                            <p>Support 24 hours per day</p>
                        </div>
                    </div>
                </div>
			</div>
		</div>
	</section>

	<!-- Trending Products -->
	<section>
		<div class="container">
		<h3 class="text-center mb-5">Trending Products</h3>
			<div class="row">	
					 <c:forEach var="tempProduct" items="${products}">
						<div class="col-md-4 mb-4">
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