<!DOCTYPE html>
<html>
<title>Flexib</title>
<head>
  <!-- <link rel="stylesheet" type="text/css" href="css/styles.css">
  <link rel="stylesheet" type="text/css" href="css/indexmenu.css"> -->
  
  <link rel="stylesheet" type="text/css" href="/Flexib/FlexiHomepage/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="/Flexib/FlexiHomepage/css/styles.css">
  <link rel="stylesheet" type="text/css" href="/Flexib/FlexiHomepage/css/font-awesome.min.css">
</head>
<script>

function myFunction() {
	document.getElementById("testtype").value ="<%=request.getParameter("testtype")%>";
}
</script>
<body onload="myFunction()">
    <jsp:include page="header.jsp" />
   <%-- <jsp:include page="menu.jsp" /> --%>
<div class="container-fluid top-margin">
     <div class="row">
<div class="col-md-3 login-form center-block">
     
   <div class="profile-img">
            <img src="FlexiHomepage/images/user.jpeg" alt="profile_img" height="140px" width="140px;">
          </div>
		 <h3>Login</h3>
		 <form action="LoginCheck.jsp">
   <div class="form-group" >
	     <input type="text" placeholder="Username" class="form-control" name="uname" required>
	</div>
			 <div class="form-group" >
	     <input type="password" placeholder="Password" class="form-control" name="psw" required>
	    </div>
			 <div class="form-group" > 
	    <label for="testtype"><b><font color="black">Testing Type</font></b></label>
	    <select class="form-control" id="testtype" name="testtype">
		    <option></option>
		    <option value="Automation_Testing">Automation Testing</option>
		    <option value="Performance_Testing">Performance Testing</option>
		    <option value="UFT">UFT</option>
		    <option value="Security_Testing">Security Testing</option>
		    <option value="Static_Code_Analysis">Static Code Analysis</option>
		    <option value="Administrator">Administrator</option>
		    <option value="VisualAuto_Testing">VisualAuto Testing</option>
  		</select>
				 </div>
			 <div class="form-group">
	    <button type="submit" class="btn btn-primary btn-lg btn-block">Sign in</button>
				  </div>
			 </form>
	 </div>
    
  </div>
  </div>
  <footer class="text-center footer">
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <p>Copyright © 3i Infotech. All rights reserved.</p>
      </div>
    </div>
  </div>
</footer>
  </body>

</html>


