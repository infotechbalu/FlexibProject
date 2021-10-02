<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <ul class="nav side-menu">
				<li><a href="index.jsp"><img style="width:200px;height:90px" src="images/3i-Infotech.png"/></a>
                </li>
                <li><a href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i><small>Dashboard</small><span class="fa fa-chevron-down"></span></a>
                  </li>
				  <li><a><i class="fa fa-calculator"></i>Calculators<span class="fa fa-chevron-down"></span></a>
					    <ul class="nav child_menu">
					      <li><a href="PacingCalculator.jsp">Pacing Calculator</a></li>
					      <li><a href="LoadGenerator.jsp">Load Generator</a></li>
					      <li><a href="TphCalculation.jsp">TPH/TPS Calculator</a></li>
						  <li><a href="Throughput.jsp">Throughput</a></li>
						  <li><a href="VusersCalculator.jsp">VUsers Calculator</a></li>
						  <li><a href="ThinkTimeCalculator.jsp">Think Time Calculator</a></li>		
						  <li><a href="CapacityPlaning.jsp">Capacity Planing</a></li>				  				  
						</ul>
                  </li>
                  <li><a><i class="fa fa-newspaper-o" aria-hidden="true"></i><small>Keyword Driven Framework</small><span class="fa fa-chevron-down"></span></a>
                  		<ul class="nav child_menu">
                  		<li><a href="KeywordDrivenFramework.jsp">Keyword Driven Framework</a></li>		
						  <li><a href="Execution.jsp">Execution</a></li>
						  <li><a href="ClixExecution.jsp">Clix CapitalExecution</a></li>
						  <li><a href="Monitoring.jsp">Monitoring</a></li>					  
						</ul>
                  </li>				  
                  <li><a><i class="fa fa-pie-chart"></i>Visual Load Test<span class="fa fa-chevron-down"></span></a>
                  </li>
                  <li><a><i class="fa fa-pie-chart"></i>Parallel Load Test<span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu">
                  		<li><a href="ParallelLoadtest.jsp">Jmeter Load Tests</a></li>		
			  
						</ul>
                  </li>				  
                </ul>
</body>
</html>