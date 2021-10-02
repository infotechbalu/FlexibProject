<%@page import="Monitor.Monitoring"%>
<%@page import="Monitor.ThreadsStateOverTime"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.io.BufferedReader" %>
<%@ page import ="java.io.File" %>
<%@ page import ="java.io.*" %>
<%@ page import ="java.io.IOException" %>
<%@ page import ="java.io.InputStreamReader" %>
<%@ page import ="org.apache.commons.io.FileDeleteStrategy" %>
<%@ page import ="org.apache.commons.io.FileUtils" %>
<%@ page import ="java.nio.file.*" %>

<%@page import="Monitor.responsetimeovertime"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
	<link rel="icon" href="images/stf.png" type="image/ico" />

    <title>Parallel Load Test</title>

    <!-- Bootstrap -->
    <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Font Awesome -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet"/>
	
	<!--JQPlot -->
	<link rel="stylesheet" type="text/css" href="jqplot/jquery.jqplot.css" />

	<!--Cahrt JS -->
	<script src="chartjs/Chart.bundle.js"></script>
    <script src="chartjs/jquery.min.js"></script>
	
	<!--Morris -->
	<script src="morris/jquery.min.js"></script>
	<script src="morris/raphael-min.js"></script>
	<script src="morris/morris.js"></script>
<style type="text/css">
	.TFtable{
		width:100%; 
		border-collapse:collapse; 
	}
	.TFtable td{ 
		padding:7px; border:#4e95f4 1px solid;
	}
	/* provide some minimal visual accomodation for IE8 and below */
	.TFtable tr{
		background: #b8d1f3;
	}
	/*  Define the background color for all the ODD background rows  */
	.TFtable tr:nth-child(odd){ 
		background: #b8d1f3;
	}
	/*  Define the background color for all the EVEN background rows  */
	.TFtable tr:nth-child(even){
		background: #dae5f4;
	}


#myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  border: none;
  outline: none;
  background-color: red;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 10px;
}

#myBtn:hover {
  background-color: #555;
}

canvas {
    -moz-user-select: none;
    -webkit-user-select: none;
    -ms-user-select: none;
}
</style>
<style>
<!--marquee starts-->

.container {
  padding:1px;
  border:1px solid transparent;
  width:100px;
  overflow:hidden;
}
.marquee{
  display:block;
position:relative;
width:500px;
height:90px;
animation:scroll 10s linear infinite;
padding:1px;
}
.marquee:hover {
    animation-play-state: paused
}
.d1 {
  width:200px;
  height:95px;
  background-color:transparent;
  margin:1px;
  float:left;
  padding-top: 0px;
    padding-right: 0px;
    padding-bottom: 0px;
    padding-left: 1000px;
}
/* Make it move */
@keyframes scroll{
0% {left:100px;}
100% {left:-500px;}
}
<!--
.pContiner {
    width:100px;
    overflow:scroll;
}
.dContiner{
    background:transparent;
	overflow:hidden;
    height: 90px;
    width: 500px;
}
.marquee{
  display:block;
position:relative;
width:800px;
height:90px;
animation:scroll 10s linear infinite;
padding:1px;
}
.marquee:hover {
    animation-play-state: paused
}
.d1{
    background: transparent;
	display: block;
    float: right;
    height: 80px;
    width: 150px;
}
-->
.mytable {
  display: table;
}
.myrow {
  display: table-row;
}
.mycell {
  display: table-cell;
}
.column1 {
  display: table-column;
  background-color: green;
}
.column2 {
  display: table-column;
}
<!--marquee ends-->
<!--blink starts-->
</style>
<style>
.test {
  -moz-animation-duration: 400ms;
  -moz-animation-name: blink;
  -moz-animation-iteration-count: infinite;
  -moz-animation-direction: alternate;
  
  -webkit-animation-duration: 400ms;
  -webkit-animation-name: blink;
  -webkit-animation-iteration-count: infinite;
  -webkit-animation-direction: alternate;
  
  animation-duration: 400ms;
  animation-name: blink;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}
@-moz-keyframes blink {
  from {
    opacity: 1;
  }
  to {
    opacity: 0;
  }
}
@-webkit-keyframes blink {
  from {
    opacity: 1;
  } 
  to {
    opacity: 0;
  }
}
@keyframes blink {
  from {
    opacity: 1;
  }
  to {
    opacity: 0;
  }
}
<!--blink ends-->
</style>
<style>
.sidenav {
    width: 215px;
    position: fixed;
    z-index: 0;
    top: 0px;
    left: 5px;
    background: transparent;
    overflow-x: hidden;
    padding: 6px 0;
}
.sidenav a {
    padding: 6px 8px 6px 16px;
    text-decoration: none;
    font-size: 11px;
    color: #2196F3;
    display: block;
}

.sidenav a:hover {
    color: #064579;
}
.main {
    margin-left: 0px; /* Same width as the sidebar + left position in px */
    font-size: 11px; /* Increased text to enable scrolling */
    padding: 0px 5px;
}
@media screen and (max-height: 450px) {
    .sidenav {padding-top: 10px;}
    .sidenav a {font-size: 10px;}
}
</style>

</head>
  <body class="nav-md">
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <!--<a href="index.html" class="site_title"><img style="width:210px;height:50px" src="images/3i-Infotech.jpg"/></a>-->
			</div>
            <div class="clearfix"></div>
            <br />
            <!-- sidebar menu -->
			
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu sidenav">
              <div class="menu_section">
                <jsp:include page="menu.jsp" />
              </div>
            </div>
			
            <!-- /sidebar menu -->
            <!-- /menu footer buttons -->        
            <!-- /menu footer buttons -->
          </div>
        </div>
	</div>
        <!-- page content -->
        <div class="right_col main" role="main">
          <!-- top tiles -->
         <div class="row tile_count" style="margin-bottom: 0px; margin-top: 0px;">
          <div class="col-md-6 col-sm-6 col-xs-6 tile_stats_count">
              <br/><br/>
              <div class="count red"><div class="test"><h1><font color="#079DF9">Parallel Load Test</font></h1></div></div>
			  <span class="count_bottom"></span>
            </div>
         		
            <marquee style="width:500px">
				<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count mytable" style="padding-left: 0px; padding-bottom: 0px; padding-right: 0px; width: 600px; margin-bottom: 0px;">
					<div class="myrow">
						<div class="tile_stats_count mycell">
						  <div class="count blue"><img style="width:200px;height:100px;mix-blend-mode: multiply;" src="images/LoadTesting.png" ></div>							
						</div>
					  <div class="tile_stats_count mycell">
						 <div class="tile_stats_count mycell">
						  <div class="count blue"><img style="width:200px;height:100px;mix-blend-mode: multiply;" src="images/StressTesting.png" ></div>							
						</div>
						<div class="tile_stats_count mycell">
							  <div class="tile_stats_count mycell">
						  <div class="count blue"><img style="width:200px;height:100px;mix-blend-mode: multiply;" src="images/SpikeTesting.png" ></div>							
						</div>
						<div class="tile_stats_count mycell">
						  <div class="tile_stats_count mycell">
						  <div class="count blue"><img style="width:200px;height:100px;mix-blend-mode: multiply;" src="images/EnduranceTesting.png" ></div>							
						</div>
						</div>
						<div class="tile_stats_count mycell">
						  <div class="tile_stats_count mycell">
						  <div class="count blue"><img style="width:200px;height:100px;mix-blend-mode: multiply;" src="images/ScalabilityTesting.png" ></div>							
						</div>
						</div>
					</div>
				</div>
			</marquee>	
          </div>
		
          <!-- /top tiles -->
          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel tile">
                <div class="x_title">
                  <h4><font color="#C080F9"><b>Execution</b></font></h4>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="widget_summary">
                   <!-- Form -->
                   <table width="100%">
                   		<tr>
                   			<td width="40%">
                   				<form method="GET" action="ParallelLoadtest1.jsp">
								  Server URL:  &nbsp; &nbsp; &nbsp;&nbsp;<input type="text" name="SERVERURL">
								  <br>
								  <br>
								  Server Port: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="PORTNO">
								  <br><br>
								  User Count: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="USERCOUNT">
								  <br><br>
								  Duration(Sec): &nbsp;&nbsp;<input type="text" name="DURATION">
								  <br><br>
								  Ramp Up: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="RAMPUP">
								  <br><br>
								  Ramp Down: &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="RAMPDOWN">
								  <br><br>
								  <input type="submit" name="submit" id="submit" value="Submit">
	
								  <a href="file:///D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/sampleProject/HTML/index.html">Report</a>
								</form>
                   			</td>                    			
                   			<td width="60%">                   				
                   							<%
											if (request.getParameter("submit") != null) {
												%>
												<table height="300px">
			                   					<tr height="15">
			                   						<td style="height:15px;"><div id="test_div" style = "background-image:url('images/pbar.gif');width:800px;height:15px;"></td>
			                   					</tr>
			                   					<tr height="5"><td></td></tr>
			                   					<tr height="70">
			                   						<td bgcolor="#050505" style="height:85px;">
			                   							<div style="max-height: 300px; width: 100%; overflow: auto;">                   							
			                   							<font color="white">
                   							<%
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
												
												FileUtils.deleteDirectory(new File(resultFolder));
		
												FileUtils.deleteDirectory(new File(htmlFolder));

												String[] command;
												String line=null;
												
												command=new String[]{"CMD","/C","D:/PerformanceTesting/bzt Shoppingcartdemo.jmx"};
												ProcessBuilder buildProcess=new ProcessBuilder(command);
												buildProcess.directory(new File(path+"/"));
												try {
													Process p=buildProcess.start();
													Thread.sleep(3000);
													BufferedReader inputBuf=new BufferedReader(new InputStreamReader(p.getInputStream()));
													while((line=inputBuf.readLine())!=null){
														out.println(line);
														out.println("\n");
														out.flush();
														//Monitor.responsetimeovertime.response();
														//Monitor.ThreadsStateOverTime.ThreadsStateOverTime1();
														Monitor.Monitoring.ResponseTimesOverTime();
														Monitor.Monitoring.ThreadsStateOverTime1();
														Monitor.Monitoring.BytesThroughputOverTime();
														Monitor.Monitoring.HitsPerSecond();
														Monitor.Monitoring.LatenciesOverTime();
														Monitor.Monitoring.ResponseCodesPerSecond();
														Monitor.Monitoring.ResponseTimesDistribution();
														Monitor.Monitoring.ResponseTimesPercentiles();
														Monitor.Monitoring.ThroughputVsThreads();
														Monitor.Monitoring.TimesVsThreads();
														Monitor.Monitoring.TransactionsPerSecond();
													}
													inputBuf.close();
												} catch (IOException | InterruptedException e) {
													e.printStackTrace();
													//return false;
												} 
												//out.println("<a href=\"D:/Tools/apache-jmeter-3.1/apache-jmeter-3.1/sampleProject/HTML/index.html\">Report</a>");
									
    									
										/* Path sourceDirectory = Paths.get(htmlFolder);
        								Path targetDirectory = Paths.get(getServletContext().getRealPath("/WebContent/HTML"));
        								Files.copy(sourceDirectory, targetDirectory); */
        								
        								String source = htmlFolder;
        								File srcDir = new File(source);

        								/* String destination = getServletContext().getRealPath("/HTML");
        								File destDir = new File(destination);
        								try {
        								    FileUtils.copyDirectory(srcDir, destDir);
        								} catch (IOException e) {
        								    e.printStackTrace();
        								} */
										%>
										</font>
										</div>
                   						</td>
                   					</tr>
                   				  
                   				<script>
                   				document.getElementById("test_div").style.backgroundImage = 'url(images/pbar_completed.png)';
                   				</script>
                   				<tr height="10"><td>test</td></tr>  
										<%
										
											}
										%>
								</table> 		              				
                   			</td>                  		
                   		</tr>
                   </table>
                    
                   <!-- /Form -->
                    <div class="clearfix"></div>
                  </div>
                </div>
              </div>
            </div>
            <!-- <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_220 overflow_hidden">
                <div class="x_title" id="navigate">
                  <h5>Keywords in TestPlan</h5>
                  <div class="clearfix"></div>
                </div>
					<img src="images/KeywordsinTestPlan.png" width="100%" height="435px"/>
					<div id="chart1"></div>
              </div>
            </div> -->

			
               
              </div>
            </div>
 
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
           Performance Testing Dashboard
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    <!--</div>-->

<script>
	// When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function() {scrollFunction()};

	function scrollFunction() {
		if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
			document.getElementById("myBtn").style.display = "block";
		} else {
			document.getElementById("myBtn").style.display = "none";
		}
	}
	// When the user clicks on the button, scroll to the top of the document
	function topFunction() {
		document.body.scrollTop = 0;
		document.documentElement.scrollTop = 0;
	}
</script>

    <!-- jQuery -->
    <script src="jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- Chart.js -->
    <script src="chartjs/Chart.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
	<!-- JQPlot -->
	<!--<script type="text/javascript" src="jqplot/jquery.min.js"></script>-->
	<!--JQPlot -->
	<script type="text/javascript" src="jqplot/jquery.min.js"></script>
	<script type="text/javascript" src="jqplot/jquery.jqplot.js"></script>
	<script type="text/javascript" src="jqplot/jqplot.pieRenderer.js"></script>
	<script type="text/javascript" src="jqplot/jqplot.barRenderer.js"></script>
	<script type="text/javascript" src="jqplot/jqplot.categoryAxisRenderer.js"></script>
	<script type="text/javascript" src="jqplot/jqplot.donutRenderer.js"></script>
	<script type="text/javascript" src="jqplot/jqplot.pointLabels.js"></script>

  </body>
</html>
