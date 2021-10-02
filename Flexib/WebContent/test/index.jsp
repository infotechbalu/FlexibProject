<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%@ page import ="java.util.Properties" %>

<%@include file="DB.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>CICD- Continuous Everything</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>
  <link rel="stylesheet" href="css/login_style.css">
</head>
<body>
<div class="form">
<h1>Login</h1>
  <form method="POST" name="login" action="login.jsp" accept-charset="UTF-8" autocomplete="off" onsubmit="return validate_Loginform(this)">
    <div class="field-wrap">
      <div class="form-group input-group"><span id="basic-addon1" class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
        <input type="text" name="username" placeholder="Username" aria-describedby="basic-addon1" class="form-control" />
      </div>
    </div>
    <div class="field-wrap">
      <div class="form-group input-group"><span id="basic-addon2" class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
        <input type="password" name="password" placeholder="Password" aria-describedby="basic-addon2" autocomplete="off" class="form-control" />
      </div>
      </div>
<div class="field-wrap">
     <div class="form-group input-group">
     <span id="basic-addon2" class="input-group-addon">
    <span class="glyphicon glyphicon-tag">
     </span>
     </span>
       <select name="roles">
       <%
       		try{
       			ResultSet result =statement.executeQuery("select * from roles") ;
       			//PreparedStatement ps = con.prepareStatement("select * from users");
       			while(result.next()){
      %>
       <option value="<%= result.getString(1)%>"><%= result.getString(1)%></option>
       <%
        }
       
       %>
       </select>
       <%
       	}
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
       %>
      </div>
    </div>
   <!-- <p class="forgot"><a href="/forgot">Forgot Password?</a></p> -->
    <div>
 	<input type="submit" name="submit" value="Submit" />
    	<!-- <img src="images/loginbutton.png" /> -->
     <!-- 
    <input type="submit" id="button-image" name="submit" style="order-top-width: 0px;
    padding-right: 0px;
    border-right-width: 0px;
    padding-bottom: 0px;
    border-bottom-width: 0px;
    border-left-width: 0px;
    padding-left: 0px;
    border-top-width: 0px;
    padding-top: 0px;
    background: none;">
    <img src="images/loginbutton.png" />
    -->
    <!--Log In -->
    
  <!--  </button> -->
    </div>
  </form>
</div>
<%con.close(); %>
</body>
</html>
