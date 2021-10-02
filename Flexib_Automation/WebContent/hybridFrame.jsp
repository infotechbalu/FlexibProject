<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
//System.out.println("test :" +request.getParameter("submit2"));
if (request.getParameter("submit") != null) {		
	session.setAttribute("Executor","True");	
}
else if(request.getParameter("submit1") != null){
	session.setAttribute("Executor","True1");
}
else if(request.getParameter("submit2") != null){
	session.setAttribute("Executor","True2");
	//System.out.println(session.getAttribute("Executor"));
}
else{
	
}
response.sendRedirect("index.jsp");
%>
<%-- <%@include file='test1.jsp'%> --%>
</body>
</html>