<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
//Object role=session.getAttribute("testtype");
//Object username=session.getAttribute("username");
try{
if(session.getAttribute("username").equals("null") || session.getAttribute("username").equals("")){
	session.invalidate(); 
	response.sendRedirect("index.jsp");
	//getServletContext().getRequestDispatcher("index.jsp").include(request,response);
}
else{
%>
<html>
<title>Flexib - Security Testing Dashboard</title>
<head>
  <link rel="stylesheet" type="text/css" href="css/styles.css">
  <link rel="stylesheet" type="text/css" href="css/indexmenu.css">
  <script src="js/jquery-1.9.1.js"></script>
<style>
#page {
    margin-left: 200px;
    background-color: white;
    padding-top: 110px;
}
#maincontent {
    float: right;
    width: 90%;
}
#menuleftcontent {
    float: left;
    width: 200px;
    margin-left: -200px;
    background-color: white;
}
#clearingdiv {
    clear: both;
}

/*vertical Menu*/
.vertical-menu {
    width: 250px;
}

.vertical-menu a {
    background-color: #eee;
    color: black;
    display: block;
    padding: 12px;
    text-decoration: none;
}

.vertical-menu a:hover {
    background-color: white;
}

.vertical-menu a.active {
    background-color: white;
    color: white;
}
</style>
<script>
$(function () {
    $("#maincontent > div:gt(0)").hide();
    $("#menu a").on("click", function (e) {
        var href = $(this).attr("href");
        $("#maincontent > " + href).show();
        $("#maincontent > :not(" + href + ")").hide();
    });
});

</script>
</head>
<body>
   <jsp:include page="header.jsp" />
   <hr class="hrheader">
   <div id="page">
    <div id="maincontent" style="padding-top: 0px;">
        <div id="slides"><jsp:include page="SecuritySlides.jsp" /></div>
        <div id="WebAppDemo"><jsp:include page="SecurityWebDemo.jsp" /></div>
        <div id="thirdcontent">thirdcontent</div>
    </div>
    <div id="menuleftcontent" style="width: 250px;background-color: white;">
        <ul id="menu" style="padding-top: 0px;">
        	<h3><font color="white"><b>Security Testing Dashboard</b></font></h3>
        	<div class="vertical-menu" style="padding-top: 0px; width: 250px;">
			  <a href="#slides" class="active">Dashboard</a>
			  <a href="#WebAppDemo">Web Application Demo</a>
			  <a href="Projects/Security Testing/Framework/Reports/index.html" target="_blank">Web Application Results</a>
			  <a href="#">Link 3</a>
			  <a href="#">Link 4</a>
			  <a href="#">Link 1</a>
			  <a href="#">Link 2</a>
			  <a href="index.jsp">Logout</a>
			 
			</div>
        </ul>
    </div>
    <div id="clearingdiv"></div>
</div>
   
   <jsp:include page="footer.jsp" />
 <%}				
				}
				catch(Exception sqe){
					session.invalidate(); 
					response.sendRedirect("index.jsp");
				}%>
</body>
</html>
