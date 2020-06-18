<!DOCTYPE html>
<html lang="en">



<%-- login status validation --%>
<%
	if(session.getAttribute("isLoggedIn")==null || !(session.getAttribute("isLoggedIn").equals("true"))){

		session.setAttribute("login_msg", "Please login first to continue");
		response.sendRedirect("login.jsp");
	}
	
	else if(session.getAttribute("redirect_msg")!=null){  %>
	<script>alert("<%=session.getAttribute("redirect_msg")%>")</script>
	<% 
		session.removeAttribute("redirect_msg");  
  }
  
 %>
  


<head>
  <title>FedChoice Bank </title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  
  
 
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 50px;
	  background-color:#F8DC2E;
	  padding: initial;
    }
	.jumbotron h1 {
    font-size: 63px;
    font-family: serif;
    font-weight: 700;
	}
	
	
	.jumbotron p {
    font-size: 30px;
    font-family: serif;
    font-weight: 700;
	}
   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #000;
      padding: 25px
	a {
    color: #fff!important;
    text-decoration: none;
	}
	  
	.panel-primary>.panel-heading {
									cursor:pointer;
									color: #fff;
									background-color: #337ab7;
									border-color: #337ab7;
									text-align: -webkit-center;
								}
	
	.panel-heading {
    padding: 10px 15px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
	text-align: -webkit-center;
    
}
	
.footerdiv{
				background-color: #000;
				padding: 2px 13px 4px 13px;
				color: #fff;
				text-align: start;
}
			}

    }
  </style>
</head>
<body>

<div class="jumbotron">
  <div class="container text-center">
    <h1>FedChoice Bank</h1>      
    <p>Banking & Retail </p>
    <a href="processLogout.jsp"><button type="submit" class="btn btn-primary pull-right">logout</button></a>
  </div>
</div>

<%

if(session.getAttribute("loginUserRole")==null || (session.getAttribute("loginUserRole").equals("customer_account_executive"))){

%>

<div class="container">    
  <div class="row">
	
    <div class="col-md-3 col-sm-3 col-xs-3">
      <div class="panel panel-primary">
        <div class="panel-heading"><a href="addUser.jsp" style="color:#fff;">CREATE CUSTOMER</div>
        <div class="panel-body"><img src="img/CreateCust.png" class="img-responsive" style="width:100%" alt="Image"></div>
      </div>
    </div>
	
    <div class="col-md-3 col-sm-3 col-xs-3">
      <div class="panel panel-primary">
        <div class="panel-heading"><a href="UpdateCustomer.jsp" style="color:#fff;">UPDATE CUSTOMER</div>
        <div class="panel-body"><img src="img/UpdateCust.png" class="img-responsive" style="width:100%" alt="Image"></div>
      </div>
    </div>
	
    <div class="col-md-3 col-sm-3 col-xs-3">
      <div class="panel panel-primary">
        <div class="panel-heading"><a href="DeleteCustomer.jsp" style="color:#fff;">DELETE CUSTOMER</div>
        <div class="panel-body"><img src="img/DeleteCust.png" class="img-responsive" style="width:100%" alt="Image"></div>
      </div>
    </div>
	
	 <div class="col-md-3 col-sm-3 col-xs-3">
      <div class="panel panel-primary">
        <div class="panel-heading"><a href="SearchCustomer.jsp" style="color:#fff;">SEARCH CUSTOMER</div>
        <div class="panel-body"><img src="img/SearchCust.png" class="img-responsive" style="width:100%" alt="Image"></div>
      </div>
    </div>
	
  </div>
</div><br>


<div class="container">    
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <div class="panel panel-primary">
        <div class="panel-heading"><a href="ViewCustomerStatusController" style="color:#fff;">STATUS OF CUSTOMERS</div>
        <div class="panel-body"><img src="img/Allcust.png" class="img-responsive" style="width:100%" alt="Image"></div>
      </div>
    </div>
	
    <div class="col-md-3 col-sm-3 col-xs-3"> 
      <div class="panel panel-primary">
        <div class="panel-heading"><a href="CreateAccount_006.jsp" style="color:#fff;">CREATE ACCOUNT</div>
        <div class="panel-body"><img src="img/CreateAccount.png" class="img-responsive" style="width:100%" alt="Image"></div>
      </div>
    </div>
	
    <div class="col-md-3 col-sm-3 col-xs-3"> 
      <div class="panel panel-primary">
        <div class="panel-heading"><a href="DeleteAccount_007.jsp" style="color:#fff;">DELETE ACCOUNT</div>
        <div class="panel-body"><img src="img/DeleteAccount.png" class="img-responsive" style="width:100%" alt="Image"></div>
      </div>
    </div>
	
	<div class="col-md-3 col-sm-3 col-xs-3">
      <div class="panel panel-primary">
        <div class="panel-heading"><a href="ViewAccountStatusController" style="color:#fff;">STATUS OF ACCOUNTS</div>
        <div class="panel-body"><img src="img/AccountStatement.png" class="img-responsive" style="width:100%" alt="Image"></div>
      </div>
    </div>
	
  </div>
</div><br><br>


<%}else{

%>


<div class="container">    
  <div class="row">
    <div class="col-md-6 col-sm-6 col-xs-">
      <div class="panel panel-primary">
        <div class="panel-heading"><a href="searchAC.jsp" style="color:#fff;">PERFORM TRANSACTIONS / SEARCH ACCOUNT	</div>
        <div class="panel-body"><img src="img/CreateCust.png" class="img-responsive" style="width:100%" alt="Image"></div>
      </div>
    </div>
	
    <div class="col-md-6 col-sm-6 col-xs-6"> 
      <div class="panel panel-primary">
        <div class="panel-heading"><a href="AccStatement_014.jsp" style="color:#fff;">PRINT STATEMENT</div>
        <div class="panel-body"><img src="img/AccountStatement.png" class="img-responsive" style="width:100%" alt="Image"></div>
      </div>
    </div>
	
  </div>
</div><br><br>


<%}%>
<div>
<footer>

      <div class="footerdiv" style="color:#fff;">
          <div class="row ">
    <div class="col-sm-4">
      <h3>About Us</h3>
      <p>	FedChoice Bank was founded on 14th June 2016 with the objective of providing
			with the detail services based on Retail Banking operations.The Retail Internet
			Banking of FedChoice Bank offers a plethora of products and services,to cater
			its customers by providing certain animus services with an easy volving offers 
			and ways to do the required job without hurdling the process
	  </p>
    </div>
    <div class="col-sm-4">
      <h3>Services</h3>
      <p>Retail and consumer banking</p>
      <p>Personal Internet banking</p>
	  <p>Corporate Internet Banking</p>
	  <p>Debit and Credit Cards</p>
    </div>
    <div class="col-sm-4">
      <h3>Contact Us</h3>        
      <p>Email: customer.service@fedchoice.com</p>
      <p>Contact No.: 022-42406778,022-54567890</p>
	  <p>Address : Corporate Office,Madame Cama Road,Nariman Point,Mumbai,Maharastra 400021 </p>
    </div>
  </div>
  </div>

</footer>
</div>
</body>
</html>
