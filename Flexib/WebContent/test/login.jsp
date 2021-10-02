<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="DB.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CICD - Login</title>
</head>
<body>
<%
String sql = "select * from users where username=? and password=? and role=? and status='Enabled'";
String username = request.getParameter("username");
String password = request.getParameter("password");
String role = request.getParameter("roles");
PreparedStatement ps = null;
ResultSet rs = null;
String userdbName;
String userdbPsw;
String dbrole;
if((!(username.equals(null) || (username.equals(""))) && !(password.equals(null) || (password.equals("")))))
{
	try{
		ps = con.prepareStatement(sql);
		ps.setString(1, username);
		ps.setString(2, password);
		ps.setString(3, role);
		rs = ps.executeQuery();
		if(rs.next()){
			userdbName = rs.getString("username");
			userdbPsw = rs.getString("password");
			dbrole = rs.getString("role");
			if(username.equals(userdbName) && password.equals(userdbPsw) && role.equals(dbrole)){
				session.setAttribute("username",userdbName);
				session.setAttribute("roles", dbrole); 
				if(role.equals("Sys Admin")){
					response.sendRedirect("Sys_Admin_Dashboard.jsp");
				}
				else if(role.equals("Test Design & Execution")){
				response.sendRedirect("Design_Execution_Dashboard.jsp");
				}
				else if(role.equals("App Admin")){
					response.sendRedirect("App_Admin_Dashboard.jsp");
					}
				else{
					out.println("No Dashboard Found");
					response.sendRedirect("index.jsp");
				}
			}
		}
		else{
			response.sendRedirect("loginerror.jsp");
		}
		rs.close();
		ps.close(); 		
	}
	catch(SQLException sqe){
		out.println(sqe);
	} 
}
else{
%>
<center><p style="color:red">Error In Login</p></center>
<% 
getServletContext().getRequestDispatcher("index.jsp").include(request, 
response);
}
%>
<%con.close(); %>
</body>
</html>