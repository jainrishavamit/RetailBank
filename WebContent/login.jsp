<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Sign In</title>
        <link rel="stylesheet" href="Style.css">
            </head> 
            <body class="BackGround"> 
         <div>
            <h2 class="sign">User Login</h2>
            
            <form action ="LoginController" method="post">
            
                    <h2 class="inputbox">UserId 
                    <input  type="text" name ="Userid" required  placeholder="UserId" style="margin-left:4%">
                         <br>   Password 
                    <input  type="password" name ="Password"  required  placeholder="Password"> <br>
                          </h2>
                    <button type="submit" class="buttonbox" value="Log in" style="margin-left: 50%" >Log in</button> 
                  
                  
                  <%-- displaying redirection reason here --%>
                  <% if(session.getAttribute("login_msg")!=null){  %>
                	<script>alert("<%=session.getAttribute("login_msg")%>")</script>
                	<% 
                		session.removeAttribute("login_msg");  
                  }%>
                  
                  
               </form>
               </div>
            </body>
</html>