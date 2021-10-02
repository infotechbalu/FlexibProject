<%-- <jsp:useBean id="someid" scope="session" class="Flexib.SecurityDemo"> --%>
<html>
<%-- <body onload="<%someid.startDemo(); %>"> --%>
<body>
<%
//System.out.println(request.getParameter("submit"));
if (request.getParameter("submit") != null) {
	Flexib.SecurityDemo.startDemo();
}
response.sendRedirect("SecurityTestingDashboard.jsp");
%> 

<%-- </jsp:useBean> --%>
</body>
</html>