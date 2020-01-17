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
    <link href="${pageContext.request.contextPath}/static/css/easy-responsive-tabs.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/creditly.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/popuo-box.css" rel="stylesheet">
   
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

	
	<!--CheckOut BreadCrumb-->
 <section class="breadcrumb" >
    <div class="inner_breadcrumb">
      <div class="container">
        <ul class="breadcrumb_list">
          <li>
            <a href="index.html">Home</a>
            <i>|</i>
          </li>
          <li>
            <a href="index.html">Checkout</a>
            <i>|</i>
          </li>
          <li>Payment</li>
        </ul>
      </div>
    </div>
    
  </section>
  
  <!-- Main Section -->
  <section class="checkout_section container">
    <h3 class="text-center payment_header">Payment</h3>
  </section>
  
  
  <!-- //title heading -->
      <div class="checkout-right">
        <!--Horizontal Tab-->
        <div id="parentHorizontalTab">
          <ul class="resp-tabs-list hor_1">
            <li>Cash on delivery (COD)</li>
            <li>Credit/Debit</li>
            <li>Net Banking</li>
            <li>Paypal Account</li>
          </ul>
          <div class="resp-tabs-container hor_1">

            <div>
              <div class="vertical_post check_box_agile">
                <h5>COD</h5>
                <div class="checkbox">
                  <div class="check_box_one cashon_delivery">
                    <label class="anim">
                      <input type="checkbox" class="checkbox">
                      <span> We also accept Credit/Debit card on delivery. Please Check with the agent.</span><br/>
                      <span>*Our Customer Service would reach you on the number provided to confirm your order</span>
                      <input style="margin-left: 40px;"  class="btn btn-success" value="Pay On Delivery"/>
                    </label>
                  </div>

                </div>
              </div>
            </div>
            <div>
              <form action="${pageContext.request.contextPath}/receipt" method="get" class="creditly-card-form agileinfo_form">
                <div class="creditly-wrapper wthree, w3_agileits_wrapper">
                  <div class="credit-card-wrapper">
                    <div class="first-row form-group">
                      <div class="controls">
                        <label class="control-label">Name on Card</label>
                        <input class="billing-address-name form-control" type="text" name="cardname" placeholder="Enter Name Here">
                      </div>
                      <div class="w3_agileits_card_number_grids">
                        <div class="w3_agileits_card_number_grid_left">
                          <div class="controls">
                            <label class="control-label">Card Number</label>
                            <input class="number credit-card-number form-control" type="text" name="cardnumber" inputmode="numeric" autocomplete="cc-number"
                                autocompletetype="cc-number" x-autocompletetype="cc-number" placeholder="&#149;&#149;&#149;&#149; &#149;&#149;&#149;&#149; &#149;&#149;&#149;&#149; &#149;&#149;&#149;&#149;">
                          </div>
                        </div>
                        <div class="w3_agileits_card_number_grid_right">
                          <div class="controls">
                            <label class="control-label">CVV</label>
                            <input class="security-code form-control" · inputmode="numeric" type="text" name="cvv" placeholder="&#149;&#149;&#149;">
                          </div>
                        </div>
                        <div class="clear"> </div>
                      </div>
                      <div class="controls">
                        <label class="control-label">Expiration Date</label>
                        <input class="expiration-month-and-year form-control" type="text" name="exp_date" placeholder="MM / YY">
                      </div>
                    </div>
                    <button class="submit" type="submit" value="submit" name="submit">
                      <span>Make a payment </span>
                    </button>
                  </div>
                </div>
              </form>

            </div>
            <div>
              <div class="vertical_post">
                <form action="#" method="post">
                  <h5>Select From Popular Banks</h5>
                  <div class="swit-radio">
                    <div class="check_box_one">
                      <div class="radio_one">
                        <label>
                          <input type="radio" name="radio" checked="">
                          <i></i>First Bank</label>
                      </div>
                    </div>
                    <div class="check_box_one">
                      <div class="radio_one">
                        <label>
                          <input type="radio" name="radio">
                          <i></i>GTB</label>
                      </div>
                    </div>
                    <div class="check_box_one">
                      <div class="radio_one">
                        <label>
                          <input type="radio" name="radio">
                          <i></i>Fidelity</label>
                      </div>
                    </div>
                    <div class="check_box_one">
                      <div class="radio_one">
                        <label>
                          <input type="radio" name="radio">
                          <i></i>ICICI Bank</label>
                      </div>
                    </div>
                    <div class="check_box_one">
                      <div class="radio_one">
                        <label>
                          <input type="radio" name="radio">
                          <i></i>Access Bank</label>
                      </div>
                    </div>
                  </div>
                  <h5>Or Select Other Bank</h5>
                  <div class="section_room_pay">
                    <select class="year">
                      <option value="">=== Other Banks ===</option>
                      <option value="ALB-NA">Wema Bank</option>
                      <option value="ADB-NA">Heritage Bank</option>
                      <option value="BBK-NA">UBA</option>
                    </select>
                  </div>
                  <input type="submit" value="PAY NOW">
                </form>
              </div>
            </div>
            <div>
              <div id="tab4" class="tab-grid" style="display: block;">
                <div class="row">
                  <div class="col-md-6">
                    <img class="pp-img" src="${pageContext.request.contextPath}/static/images/paypal.png" alt="Image Alternative text" title="Image Title">
                    <p>Important: You will be redirected to PayPal's website to securely complete your payment.</p>
                    <a class="btn btn-primary text-white">Checkout via Paypal</a>
                  </div>
                  <div class="col-md-6 number-paymk">
                    <form class="cc-form">
                      <div class="clearfix">
                        <div class="form-group form-group-cc-number">
                          <label>Card Number</label>
                          <input class="form-control" placeholder="xxxx xxxx xxxx xxxx" type="text">
                          <span class="cc-card-icon"></span>
                        </div>
                        <div class="form-group form-group-cc-cvc">
                          <label>CVV</label>
                          <input class="form-control" placeholder="xxxx" type="text">
                        </div>
                      </div>
                      <div class="clearfix">
                        <div class="form-group form-group-cc-name">
                          <label>Card Holder Name</label>
                          <input class="form-control" type="text">
                        </div>
                        <div class="form-group form-group-cc-date">
                          <label>Valid Thru</label>
                          <input class="form-control" placeholder="mm/yy" type="text">
                        </div>
                      </div>
                      <div class="checkbox checkbox-small">
                        <label>
                          <input class="i-check" type="checkbox" checked="">Add to My Cards</label>
                      </div>
                      <input type="submit" class="submit" value="Proceed Payment">
                    </form>
                  </div>
                </div>

              </div>
            </div>

          </div>
        </div>
        <!--Plug-in Initialisation-->
      </div>
  
  
  		<!--Payment Methods-->
  <section class="payment_method_section child-momu" style="margin-top: 2vh;">
    <h5>Payment Methods</h5>
          <ul>
            <li>
              <img src="${pageContext.request.contextPath}/static/images/pay2.png" alt="">
            </li>
            <li>
              <img src="${pageContext.request.contextPath}/static/images/pay1.png" alt="">
            </li>
            <li>
              <img src="${pageContext.request.contextPath}/static/images/pay3.png" alt="">
            </li>
            <li>
              <img src="${pageContext.request.contextPath}/static/images/pay7.png" alt="">
            </li>
            <li>
              <img src="${pageContext.request.contextPath}/static/images/pay8.png" alt="">
            </li>
            <li>
              <img src="${pageContext.request.contextPath}/static/images/pay9.png" alt="">
            </li>
          </ul>
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
    <script src="${pageContext.request.contextPath}/static/scripts/easyResponsiveTabs.js"></script>
     <script>
    $(document).ready(function () {
      //Horizontal Tab
      $('#parentHorizontalTab').easyResponsiveTabs(
      {
        type: 'default', //Types: default, vertical, accordion
        width: 'auto', //auto or any width like 600px
        fit: true, // 100% fit in a container
        tabidentify: 'hor_1', // The tab groups identifier
        activate: function (event) { // Callback function if tab is switched
          var $tab = $(this);
          var $info = $('#nested-tabInfo');
          var $name = $('span', $info);
          $name.text($tab.text());
          $info.show();
        }
      });
    });
  </script>
   <script src="${pageContext.request.contextPath}/static/scripts/creditly.js"></script>
    <!--For the Credit Cart Payment Tab-->
  <script>
    $(function () 
    {
      var creditly = Creditly.initialize(
        '.creditly-wrapper .expiration-month-and-year',
        '.creditly-wrapper .credit-card-number',
        '.creditly-wrapper .security-code',
        '.creditly-wrapper .card-type');

      $(".creditly-card-form .submit").click(function (e) {
        e.preventDefault();
        var output = creditly.validate();
        if (output) {
          // Your validated credit card output
          console.log(output);
        }
      });
    });
  </script>
  
</body>
</html>