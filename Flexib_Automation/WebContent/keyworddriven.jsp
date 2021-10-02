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
<!-- <h4><font color="#C080F9"><b>Hybrid Framework Execution Log</b></font></h4> -->
<%
	Object Executor=session.getAttribute("Executor");
	String s2=String.valueOf(Executor); 
	if(s2.equalsIgnoreCase("True")){ 
		    String[] command;
		    String line=null;
		    
		    System.out.println(request.getRealPath("/"));
		    command=new String[]{"CMD","/C",request.getRealPath("/")+"\\Flexib_ShoppingCart\\ShoppingCartDemo.bat"};
			ProcessBuilder buildProcess=new ProcessBuilder(command);
			buildProcess.directory(new File(System.getProperty("user.dir")));
			try {
				Process p=buildProcess.start();
				Thread.sleep(3000);
				BufferedReader inputBuf=new BufferedReader(new InputStreamReader(p.getInputStream()));
				BufferedReader inputBuf1=new BufferedReader(new InputStreamReader(p.getErrorStream()));
				while((line=inputBuf.readLine())!=null || (line=inputBuf1.readLine())!=null){
					System.out.println(line);			
					out.println(line+"<br>");
					out.flush();
				}
				inputBuf.close();
			} catch (IOException | InterruptedException e) {
				e.printStackTrace();
			}
	}
	else{
	%>
		<img src="images/automation.png" height="400px" width="1200px" />
	<%
	}
	session.invalidate();
%>
</body>
</html>