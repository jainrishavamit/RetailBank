<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Sign In</title>
        
  		 <script type="text/javascript" src="js/login.js"> </script>
   
        <link rel="stylesheet" href="Style.css">
            </head> 
            <body class="BackGround"> 
         <div>
            <h2 class="sign">User Login</h2>
            
            <form action ="LoginController" method="post" onsubmit="return checkFields();">
            
                    <h2 class="inputbox">UserId 
                    <input  type="text" name ="Userid" id="Userid" required  placeholder="UserId" style="margin-left:4%">
                         <br>   Password 
                    <input  type="password" name ="Password" id="Password"  required  placeholder="Password"> <br>
                          </h2>
                    <button type="submit" class="buttonbox" value="Log in" style="margin-left: 50%" >Log in</button> 
                  
                  
               </form>
               <div>
               <h2><center><p id="errorMsg" style="color:red"></p></center></h2>
               </div>
               </div>
            </body>
</html>

                  
                  <%-- displaying redirection reason here --%>
                  <% if(session.getAttribute("login_msg")!=null){  %>
                	<script>alert("<%=session.getAttribute("login_msg")%>")</script>
                	<% 
                		session.removeAttribute("login_msg");  
                  }%>
                  