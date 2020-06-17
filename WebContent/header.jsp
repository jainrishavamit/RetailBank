


  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="js/utility.js?ver=1"></script>
  <%@include file="pageStyles.css" %>
  
    </head>

  <body>


   <!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">FedChoice Bank</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"  > <a href="welcome.jsp" >Home</a></li>
			
<%

if(session.getAttribute("loginUserRole")==null || (session.getAttribute("loginUserRole").equals("customer_account_executive"))){

%>
            
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Customer Management <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="addUser.jsp">Add Customer</a></li>
                <li><a href="UpdateCustomer.jsp">Update Customer</a></li>
                <li><a href="DeleteCustomer.jsp">Delete Customer</a></li>
                <li><a href="SearchCustomer.jsp">Search Customer</a></li>
              </ul>
            </li>
            
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Account Managment <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="CreateAccount_006.jsp">Create Account</a></li>
                <li><a href="DeleteAccount_007.jsp">Delete Account</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Status Details <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="ViewCustomerStatusController">Customer Status</a></li>
                <li><a href="ViewAccountStatusController">Account Status</a></li>
              </ul>
            </li>
            
<%}else{ %>            
			
                <li><a href="searchAC.jsp">Perform Transaction / Search Account</a></li>
                <li><a href="printStatement.jsp">Print Statement</a></li>

<%} %>			
			 <li class="active"><a href="processLogout.jsp">Logout</a></li>
			
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
