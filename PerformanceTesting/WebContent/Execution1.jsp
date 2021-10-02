<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.io.BufferedReader" %>
<%@ page import ="java.io.File" %>
<%@ page import ="java.io.*" %>
<%@ page import ="java.io.IOException" %>
<%@ page import ="java.io.InputStreamReader" %>
<%@ page import ="org.apache.commons.io.FileDeleteStrategy" %>
<%@ page import ="org.apache.commons.io.FileUtils" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<c:include url="D:/index.html"  />

</body>

 <!--  <a href="D:\Tools\apache-jmeter-3.1\apache-jmeter-3.1\sampleProject\HTML\index.html">Report</a> -->
<%-- <%
if (request.getParameter("submit") != null) {
	String path="D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/bin/";
	String resultFolder="D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/sampleProject/RESULT";
	String htmlFolder="D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/sampleProject/HTML";
	String scriptpath="D:\\Tools\\apache-jmeter-3.1\\apache-jmeter-3.1\\sampleProject\\OnlineShoppingCartFWK.jmx";
	String scriptResult="D:\\Tools\\apache-jmeter-3.1\\apache-jmeter-3.1\\sampleProject\\RESULT\\result.jtl";
	String scriptHTML="D:\\Tools\\apache-jmeter-3.1\\apache-jmeter-3.1\\sampleProject\\HTML";

	
	String SERVERURL=request.getParameter("SERVERURL");
	String PORTNO=request.getParameter("PORTNO");
	String USERCOUNT=request.getParameter("USERCOUNT");
	String DURATION=request.getParameter("DURATION");
	String platform1=request.getParameter("platform");
	String RAMPUP=request.getParameter("RAMPUP");
	String RAMPDOWN=request.getParameter("RAMPDOWN");
	
	File directory = new File(resultFolder);
	// Get all files in directory	
	File[] files = directory.listFiles();
	for (File file : files)
	{
	   if (!file.delete())
	   {
	       System.out.println("Failed to delete "+file);
	   }
	} 	
	FileUtils.deleteDirectory(new File(htmlFolder));

	//File f=new File(htmlFolder); 

	
	String[] command;
	String line=null;
	
	command=new String[]{"CMD","/C",path+"jmeter.bat -Jjmeter.save.saveservice.output_format=csv -n -t "+scriptpath+" -JSERVERURL="+SERVERURL+" -JPORTNO="+PORTNO+" -JUSERCOUNT="+USERCOUNT+" -JDURATION="+DURATION+" -JRAMPUP="+RAMPUP+" -JRAMPDOWN="+RAMPDOWN+" -l "+scriptResult+" -e -o "+scriptHTML};
	ProcessBuilder buildProcess=new ProcessBuilder(command);
	buildProcess.directory(new File(path+"/"));
	try {
		Process p=buildProcess.start();
		Thread.sleep(3000);
		BufferedReader inputBuf=new BufferedReader(new InputStreamReader(p.getInputStream()));
		while((line=inputBuf.readLine())!=null){
			out.println(line);
			out.flush();
		}
		inputBuf.close();
	} catch (IOException | InterruptedException e) {
		e.printStackTrace();
		//return false;
	} 
}
%> --%>
</body>
</html>