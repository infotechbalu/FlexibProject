<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
	<link rel="icon" href="images/stf.png" type="image/ico" />

    <title>Performance Testing Dashboard</title>

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
  width:1000px;
  overflow:hidden;
}
.marquee{
  display:block;
position:relative;
width:400px;
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
<!-- <script type="text/javascript">
        var auto_refresh1 = setInterval(
        function ()
        {
        $('#ThreadsStateOverTime').load('MonitorCMDExecutor.jsp').fadeIn("slow");
        }, 2000); // autorefresh the content of the div after
                   //every 1000 milliseconds(1sec)
</script> -->

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
          <div class="row tile_count">
			<!-- <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><div class="card-body-icon"><b><font color="#014F76"><h3>Monitoring</h3></font></b></div></span>
			  <br/>
              <span class="count_bottom green"><b></b></span>
            </div> -->
		
          </div>	
          <div class="row tile_count" style="margin-bottom: 0px; margin-top: 0px;">
          <div class="col-md-2 col-sm-6 col-xs-6 tile_stats_count">
              <br/><br/>
              <div class="count red"><div class="test"><h1><font color="#079DF9">Monitoring</font></h1></div></div>
			  <span class="count_bottom"></span>
            </div>
         		
            <marquee style="width:900px">
				<div class="col-md-2 col-sm-2 col-xs-6 tile_stats_count mytable" style="padding-left: 0px; padding-bottom: 0px; padding-right: 0px; width: 600px; margin-bottom: 0px;">
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
          <div class="col-md-6 col-sm-6 col-xs-12">
              <div class="x_panel tile fixed_height_225 overflow_hidden">
                <div class="x_title">
                  <h5> Threads State OverTime</h5>
                  <div class="clearfix"></div>
                </div>
					<div>
						<img src="img/ThreadsStateOverTime.png" id="ThreadsStateOverTime1" height="300px" width="500px" onload="setTimeout('document.getElementById(\'ThreadsStateOverTime1\').src=\'img/ThreadsStateOverTime.png?\'+new Date().getMilliseconds()', 1000)" />
						<%-- <jsp:include page="MonitorCMDExecutor.jsp" /> --%>
						<%-- <%@include file="MonitorCMDExecutor.jsp" %> --%>
					</div>
					<!--<div id="chart1"></div>-->
              </div>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <div class="x_panel tile fixed_height_210">
                <div class="x_title">
                  <h5>Response Times OverTime</h5>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="widget_summary">
                    <div>  
                    	<img src="img/ResponseTimesOverTime.png" id="ResponseTimesOverTime2" height="300px" width="500px" onload="setTimeout('document.getElementById(\'ResponseTimesOverTime2\').src=\'img/ResponseTimesOverTime.png?\'+new Date().getMilliseconds()', 1000)" />                  	 
                   		 <%-- <jsp:include page="MonitorCMDExecutor.jsp"/> --%>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-md-6 col-sm-6 col-xs-12">
              <div class="x_panel tile fixed_height_210">
                <div class="x_title">
                  <h5>Bytes Throughput OverTime</h5>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="widget_summary">
                    <div>  
                    	<img src="img/BytesThroughputOverTime.png" id="BytesThroughputOverTime1" height="300px" width="500px" onload="setTimeout('document.getElementById(\'BytesThroughputOverTime1\').src=\'img/BytesThroughputOverTime.png?\'+new Date().getMilliseconds()', 1000)" />                  	 
                   		 <%-- <jsp:include page="MonitorCMDExecutor.jsp"/> --%>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                </div>
              </div>
            </div>
            
             <div class="col-md-6 col-sm-6 col-xs-12">
              <div class="x_panel tile fixed_height_210">
                <div class="x_title">
                  <h5>Hits Per Second</h5>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="widget_summary">
                    <div>  
                    	<img src="img/HitsPerSecond.png" id="HitsPerSecond1" height="300px" width="500px" onload="setTimeout('document.getElementById(\'HitsPerSecond1\').src=\'img/HitsPerSecond.png?\'+new Date().getMilliseconds()', 1000)" />                  	 
                   		 <%-- <jsp:include page="MonitorCMDExecutor.jsp"/> --%>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                </div>
              </div>
            </div>
            
            
            <div class="col-md-6 col-sm-6 col-xs-12">
              <div class="x_panel tile fixed_height_210">
                <div class="x_title">
                  <h5>Latencies Over Time</h5>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="widget_summary">
                    <div>  
                    	<img src="img/LatenciesOverTime.png" id="LatenciesOverTime1" height="300px" width="500px" onload="setTimeout('document.getElementById(\'LatenciesOverTime1\').src=\'img/LatenciesOverTime.png?\'+new Date().getMilliseconds()', 1000)" />                  	 
                   		 <%-- <jsp:include page="MonitorCMDExecutor.jsp"/> --%>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-md-6 col-sm-6 col-xs-12">
              <div class="x_panel tile fixed_height_210">
                <div class="x_title">
                  <h5>Response Codes Per Second</h5>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="widget_summary">
                    <div>  
                    	<img src="img/ResponseCodesPerSecond.png" id="ResponseCodesPerSecond1" height="300px" width="500px" onload="setTimeout('document.getElementById(\'ResponseCodesPerSecond1\').src=\'img/ResponseCodesPerSecond.png?\'+new Date().getMilliseconds()', 1000)" />                  	 
                   		 <%-- <jsp:include page="MonitorCMDExecutor.jsp"/> --%>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                </div>
              </div>
            </div>
			
			 <div class="col-md-6 col-sm-6 col-xs-12">
              <div class="x_panel tile fixed_height_210">
                <div class="x_title">
                  <h5>Response Times Distribution</h5>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="widget_summary">
                    <div>  
                    	<img src="img/ResponseTimesDistribution.png" id="ResponseTimesDistribution1" height="300px" width="500px" onload="setTimeout('document.getElementById(\'ResponseTimesDistribution1\').src=\'img/ResponseTimesDistribution.png?\'+new Date().getMilliseconds()', 1000)" />                  	 
                   		 <%-- <jsp:include page="MonitorCMDExecutor.jsp"/> --%>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                </div>
              </div>
            </div>
			
			<div class="col-md-6 col-sm-6 col-xs-12">
              <div class="x_panel tile fixed_height_210">
                <div class="x_title">
                  <h5>Response Times Percentiles</h5>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="widget_summary">
                    <div>  
                    	<img src="img/ResponseTimesPercentiles.png" id="ResponseTimesPercentiles1" height="300px" width="500px" onload="setTimeout('document.getElementById(\'ResponseTimesPercentiles1\').src=\'img/ResponseTimesPercentiles.png?\'+new Date().getMilliseconds()', 1000)" />                  	 
                   		 <%-- <jsp:include page="MonitorCMDExecutor.jsp"/> --%>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-md-6 col-sm-6 col-xs-12">
              <div class="x_panel tile fixed_height_210">
                <div class="x_title">
                  <h5>Throughput Vs Threads</h5>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="widget_summary">
                    <div>  
                    	<img src="img/ThroughputVsThreads.png" id="ThroughputVsThreads1" height="300px" width="500px" onload="setTimeout('document.getElementById(\'ThroughputVsThreads1\').src=\'img/ThroughputVsThreads.png?\'+new Date().getMilliseconds()', 1000)" />                  	 
                   		 <%-- <jsp:include page="MonitorCMDExecutor.jsp"/> --%>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-md-6 col-sm-6 col-xs-12">
              <div class="x_panel tile fixed_height_210">
                <div class="x_title">
                  <h5>Times Vs Threads</h5>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="widget_summary">
                    <div>  
                    	<img src="img/TimesVsThreads.png" id="TimesVsThreads1" height="300px" width="500px" onload="setTimeout('document.getElementById(\'TimesVsThreads1\').src=\'img/TimesVsThreads.png?\'+new Date().getMilliseconds()', 1000)" />                  	 
                   		 <%-- <jsp:include page="MonitorCMDExecutor.jsp"/> --%>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-md-6 col-sm-6 col-xs-12">
              <div class="x_panel tile fixed_height_210">
                <div class="x_title">
                  <h5>Transactions Per Second</h5>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="widget_summary">
                    <div>  
                    	<img src="img/TransactionsPerSecond.png" id="TransactionsPerSecond1" height="300px" width="500px" onload="setTimeout('document.getElementById(\'TransactionsPerSecond1\').src=\'img/TransactionsPerSecond.png?\'+new Date().getMilliseconds()', 1000)" />                  	 
                   		 <%-- <jsp:include page="MonitorCMDExecutor.jsp"/> --%>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                </div>
              </div>
            </div>
            
			
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
<script>
    var config = {
        type: 'pie',
        data: {
            datasets: [{
                data: [
                    $P_1,
                    $P_2,
                    $P_3,
                    $P_4,
                    $P_5,
					$P_6,
                    $P_7,
                    $P_8,
                    $P_9,
                ],
                backgroundColor: [
                    "#F7464A",
                    "#46BFBD",
                    "#FDB45C",
                    "#949FB1",
                    "#4D5360",
					"#074644",
                    "#444FBD",
                    "#FDF45C",
                    "#940FB1",
                ],
            }],
            labels: [
                "Injection Flaws",
                "Buffer Overflow",
                "Insecure Cryptographic Storage",
                "Insecure Communications",
                "Improper Error Handling",
				"Cross Site Scripting",
                "Improper Access Control",
                "Cross-Site Request Forgery (CSRF)",
                "Broken Authentication and Session Management",
            ]
        },
        options: {
            responsive: true,
            legend: {
                position: 'bottom',
            },
            title: {
                display: true,
                text: ''
            },
            animation: {
                animateScale: true,
                animateRotate: true
            }
        }
    };

    window.onload = function() {
        var ctx = document.getElementById("chart-area").getContext("2d");
        window.myPie = new Chart(ctx, config);
    };
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
