<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="DB.jsp"%>
<html>
 <body>
 <jsp:include page="header.jsp" />
<%
String sql = "select * from users where username=? and password=? and testtype=?";
String username = request.getParameter("uname");
String password = request.getParameter("psw");
String testtype = request.getParameter("testtype");
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
		ps.setString(3, testtype);
		rs = ps.executeQuery();
		if(rs.next()){
			userdbName = rs.getString("username");
			userdbPsw = rs.getString("password");
			dbrole = rs.getString("testtype");
			if(username.equals(userdbName) && password.equals(userdbPsw) && testtype.equals(dbrole)){
				session.setAttribute("username",userdbName);
				//session.setAttribute("roles", dbrole); 
				if(testtype.equals("Security_Testing")){
					response.sendRedirect("http://14.99.175.107:17688/STFM_V1/index.jsp");
				} 
				else if(testtype.equals("Automation_Testing")){
					response.sendRedirect("http://14.99.175.107:17688/PerformanceTesting/AutomationKeyword.jsp");
				}
				else if(testtype.equals("Performance_Testing")){
					//response.sendRedirect("SecurityTestingDashboard.jsp");
					response.sendRedirect("http://14.99.175.107:17688/PerformanceTesting/KeywordDrivenFramework.jsp");
				}
				else if(testtype.equals("UFT")){
					response.sendRedirect("SecurityTestingDashboard.jsp");
				}
				else if(testtype.equals("Static_Code_Analysis")){
					response.sendRedirect("http://14.99.175.107:17688/SonarQube/dashboard.jsp");
				}
				else if(testtype.equals("Administrator")){
					response.sendRedirect("SecurityTestingDashboard.jsp");
				}
				else if(testtype.equals("VisualAuto_Testing")){
					response.sendRedirect("http://14.99.175.107:17688/PerformanceTesting/VisualAutomationframework.jsp");
				}
				else{
					out.println("No Dashboard Found");
					response.sendRedirect("index.jsp");
				}
			}
		}
		else{
			response.sendRedirect("invalidLogin.jsp");
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
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="/FlexiHomepage/js/jquery-1.11.3.min.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="/FlexiHomepage/js/bootstrap.js"></script>
 </body>
</html>