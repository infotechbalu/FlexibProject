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
<script>
$(document).ready(function(){
  var data = [
		['High', $HAGraph],['Medium', $MAGraph], ['Low', $LAGraph],['Informational', $IAGraph]
  ];
  var plot1 = jQuery.jqplot ('chart1', [data], 
    { 
      seriesDefaults: {
        renderer: jQuery.jqplot.PieRenderer, 
        rendererOptions:{
          showDataLabels: true
        }
      }, 
	  grid: {
		drawGridLines: false,        // wether to draw lines across the grid or not.
		gridLineColor: '#cccccc',   // *Color of the grid lines.
		background: '#ffffff',      // CSS color spec for background color of grid.
		borderColor: '#999999',     // CSS color spec for border around grid.
		borderWidth: 0.5,           // pixel width of border around grid.
		shadow: true,               // draw a shadow for grid.
		shadowAngle: 45,            // angle of the shadow.  Clockwise from x axis.
		shadowOffset: 1.5,          // offset from the line of the shadow.
		shadowWidth: 3,             // width of the stroke for the shadow.
		shadowDepth: 3,             // Number of strokes to make when drawing shadow.
									// Each stroke offset by shadowOffset from the last.
		shadowAlpha: 0.07,          // Opacity of the shadow
		renderer: $.jqplot.CanvasGridRenderer,  // renderer to use to draw the grid.
		rendererOptions: {}         // options to pass to the renderer.  Note, the default
                                // CanvasGridRenderer takes no additional options.
		},
      legend: { show:true, location: 'e'},
	  seriesColors: [ "#FF0000", "#EAA228", "#FFFF00", "#0000FF" ]
    }
	//$('#chart1').jqplotSaveImage()
  );
});
</script>

</head>
  <body class="nav-md">
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.jsp" class="site_title"><img style="width:210px;height:50px" src="images/3i-Infotech.png"/></a>
			</div>
            <div class="clearfix"></div>
            <br />
            <!-- sidebar menu -->
			
           <div id="sidebar-menu" class="main_menu_side hidden-print main_menu sidenav">
              <div class="menu_section">
              <jsp:include page="menu.jsp" />
                <!-- <ul class="nav side-menu">
				<a href="index.html"><img style="width:100px;height:90px" src="images/3i-Infotech.jpg"/></a>
                <li><a href="index.html"><i class="fa fa-home" aria-hidden="true"></i><small>Dashboard</small><span class="fa fa-chevron-down"></span></a>
                  </li>
				  <li><a><i class="fa fa-calculator"></i>Calculators<span class="fa fa-chevron-down"></span></a>
					    <ul class="nav child_menu">
						  <li><a href="Throughput.jsp">Throughput</a></li>
						  <li><a href="#navigate2">test</a></li>					  
						</ul>
                  </li>
                  <li><a><i class="fa fa-newspaper-o"></i><small>Keyword Driven Framework</small><span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="#navigate1">Create Jobs</a></li>
                      <li><a href="#navigate2">Execute Jobs</a></li>					  
                    </ul>
                  </li>				  
                  <li><a><i class="fa fa-pie-chart"></i>Visual Load Test<span class="fa fa-chevron-down"></span></a>
                  </li>
				  
                </ul> -->
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
			<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><div class="card-body-icon"><b><font color="#014F76">Project Name</font></b></div></span>
			  <br/>
              <span class="count_bottom green"><b>$Project</b></span>
            </div>
			
	
		
          </div>	
          <!-- /top tiles -->
          <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_210">
                <div class="x_title">
                  <h5>Vulnerability Summary</h5>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="widget_summary">
                    <table id="generalInfos" class="table table-bordered table-condensed " height="120" >
                            <tr>
                                <td>High:</td>
                                <td style="background-color:#F7464A;"><font color="black"><b>$hAlerts</b></font></td>
                            </tr>
                            <tr>
                                <td>Medium</td>
                                <td style="background-color:orange;"><font color="black"><b>$mAlerts</b></font></td>
                            </tr>
                            <tr>
                                <td>Low</td>
                                <td style="background-color:yellow;"><font color="black"><b>$lAlerts</b></font></td>
                            </tr>
							<tr>
                                <td>Informational</td>
                                <td style="background-color:blue;"><font color="white"><b>$iAlerts</b></font></td>
                            </tr>
                        </table>
                    <div class="clearfix"></div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_220 overflow_hidden">
                <div class="x_title">
                  <h5>Vulnerability Summary Graph</h5>
                  <div class="clearfix"></div>
                </div>
					<div style="height:155px;width:320px" id="chart1"></div>
					<!--<div id="chart1"></div>-->
              </div>
            </div>
			<div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_220 overflow_hidden">
                <div class="x_title">
                  <h5>Governance & Compliance Violations</h5>
                  <div class="clearfix"></div>
                </div>
					<div class="col-md-8 col-sm-12 col-xs-12" style="height:150px;width:320px" id="chart2"></div>
              </div>
            </div>
          </div>
          <div class="row">
		    <div class="col-md-8 col-sm-8 col-xs-12">
              <div class="row">
                <div class="col-md-12 col-sm-6 col-xs-6">
                  <div class="x_panel">
                    <div class="x_title" id="navigate1">
                      <h5>OWASP Top 10 (2013)</h5>
                      <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                      <div class="dashboard-widget-content">
                        <div class="col-md-6 hidden-small">
                          <table class="countries_list">
                            <tbody>
                              <tr>
                                <td>A1 - Injection</td>
                                <td><font color="red">$Aone</font></td>
                               </tr>
                               <tr>
                                <td>A2 -  Broken Authentication and Session Management</td>
                                <td><font color="red">$Atwo</font></td>
                               </tr>
                               <tr>
                                <td>A3 - Cross-Site Scripting (XSS)</td>
                                <td><font color="red">$Athree</font></td>
                               </tr>
							   <tr>
                                <td>A4 - Insecure Direct Object References</td>
                                <td><font color="red">$Afour</font></td>
                               </tr>
							   <tr>
                                <td>A5 - Security Misconfiguration</td>
                                <td><font color="red">$Afive</font></td>
                               </tr>
                               <tr>
                                <td>A6 - Sensitive Data Exposure</td>
                                <td><font color="red">$Asix</font></td>
                               </tr>
                               <tr>
                                <td>A7 - Missing Function Level Access Control</td>
                                <td><font color="red">$Aseven</font></td>
                               </tr>
							   <tr>
                                <td>A8 - Cross-Site Request Forgery (CSRF)</td>
                                <td><font color="red">$Aeight</font></td>
                               </tr>
							   <tr>
                                <td>A9 - Using Components with Known Vulnerabilities</td>
                                <td><font color="red">$Anine</font></td>
                               </tr>
							   <tr>
                                <td>A10 - Unvalidated Redirects and Forwards</td>
                                <td><font color="red">$Aten</font></td>
                               </tr>
                            </tbody>
                          </table>
						</div>
						<div id="chart3" class="col-md-6 col-sm-6 col-xs-12" style="height:320px;" ></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <!-- Start to do list -->
                <div class="col-md-12 col-sm-6 col-xs-12">
                  <div class="x_panel">
                    <div class="x_title" id="navigate2">
                      <h5>PCI-DSS 6.5 Compliance</h5>
                      <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
						<div class="dashboard-widget-content">
                        <div class="col-md-6 hidden-small">
                          <table class="countries_list">
                            <tbody>
                              <tr>
                                <td>Injection Flaws</td>
                                <td><font color="red">$pcidss_one</font></td>
                            </tr>
                            <tr>
                                <td>Buffer Overflow</td>
                                <td><font color="red">$pcidss_two</font></td>
                            </tr>
                            <tr>
                                <td>Insecure Cryptographic Storage</td>
                                <td><font color="red">$pcidss_three</font></td>
                            </tr>
							<tr>
                                <td>Insecure Communications</td>
                                <td><font color="red">$pcidss_four</font></td>
                            </tr>
							    <tr>
                                <td>Improper Error Handling</td>
                                <td><font color="red">$pcidss_five</font></td>
                            </tr>
                            <tr>
                                <td>Cross Site Scripting</td>
                                <td><font color="red">$pcidss_six</font></td>
                            </tr>
                            <tr>
                                <td>Improper Access Control</td>
                                <td><font color="red">$pcidss_seven</font></td>
                            </tr>
							<tr>
                                <td>Cross-Site Request Forgery (CSRF)</td>
                                <td><font color="red">$pcidss_eight</font></td>
                            </tr>
							<tr>
                                <td>Broken Authentication & Session Management</td>
                                <td><font color="red">$pcidss_nine</font></td>
                            </tr>
                            </tbody>
                          </table>
						  </div>
							<div id="canvas-holder" class="col-md-6 col-sm-6 col-xs-12" style="width:50%">
								<canvas id="chart-area"/>
							</div>
						
						<!--<div id="chart4" class="col-md-6 col-sm-6 col-xs-12" style="height:320px;" ></div>-->
                      </div>
                    </div>
                  </div>
                </div>
                <!-- End to do list -->
                <div class="col-md-12 col-sm-6 col-xs-12">
                  <div class="x_panel">
                    <div class="x_title" id="navigate3">
                      <h5>SANS Top 25 (2011) Compliance</h5>
                      <div class="clearfix"></div>
                    </div>
                    <div class="x_content" >
						<div class="dashboard-widget-content">
                        <div class="col-md-6 hidden-small" style="overflow: scroll; height:500px">
                          <table class="countries_list">
                            <tbody>
                              <tr>
                                <td>Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')</td>
                                <td>$sans_one</b></font></td>
                            </tr>
                            <tr>
                                <td>Improper Neutralization of Special Elements used in an OS Command ('OS Command Injection')</td>
                                <td>$sans_two</b></font></td>
                            </tr>
                            <tr>
                                <td>Buffer Copy without Checking Size of Input ('Classic Buffer Overflow')</td>
                                <td>$sans_three</b></font></td>
                            </tr>
							<tr>
                                <td>Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')</td>
                                <td>$sans_four</b></font></td>
                            </tr>
							    <tr>
                                <td>Missing Authentication for Critical Function</td>
                                <td>$sans_five</b></font></td>
                            </tr>
                            <tr>
                                <td>Missing Authorization</td>
                                <td>$sans_six</b></font></td>
                            </tr>
                            <tr>
                                <td>Use of Hard-coded Credentials</td>
                                <td>$sans_seven</b></font></td>
                            </tr>
							<tr>
                                <td>Missing Encryption of Sensitive Data</td>
                                <td>$sans_eight</b></font></td>
                            </tr>
							<tr>
                                <td>Unrestricted Upload of File with Dangerous Type</td>
                                <td>$sans_nine</b></font></td>
                            </tr>
							<tr>
                                <td>Reliance on Untrusted Inputs in a Security Decision</td>
                                <td>$sans_ten</b></font></td>
                            </tr>
							<tr>
                                <td>Execution with Unnecessary Privileges</td>
                                <td>$sans_leven</b></font></td>
                            </tr>
							<tr>
                                <td>Cross-Site Request Forgery (CSRF)</td>
                                <td>$sans_tweleve</b></font></td>
                            </tr>
							<tr>
                                <td>Improper Limitation of a Pathname to a Restricted Directory ('Path Traversal')</td>
                                <td>$sans_thirteen</b></font></td>
                            </tr>
							<tr>
                                <td>Download of Code Without Integrity Check</td>
                                <td>$sansfourteen</b></font></td>
                            </tr>
							<tr>
                                <td>Incorrect Authorization</td>
                                <td>$sansfivteen</b></font></td>
                            </tr>
							<tr>
                                <td>Inclusion of Functionality from Untrusted Control Sphere</td>
                                <td>$sanssixteen</b></font></td>
                            </tr>
							<tr>
                                <td>Incorrect Permission Assignment for Critical Resource</td>
                                <td>$sansseventeen</b></font></td>
                            </tr>
							<tr>
                                <td>Use of Potentially Dangerous Function</td>
                                <td>$sanseighteen</b></font></td>
                            </tr>
							<tr>
                                <td>Use of a Broken or Risky Cryptographic Algorithm</td>
                                <td>$sansnineteen</b></font></td>
                            </tr>
							<tr>
                                <td>Incorrect Calculation of Buffer Size</td>
                                <td>$sans__twenty</b></font></td>
                            </tr>
							<tr>
                                <td>Improper Restriction of Excessive Authentication Attempts</td>
                                <td>$sanstwentyone</b></font></td>
                            </tr>
							<tr>
                                <td>URL Redirection to Untrusted Site ('Open Redirect')</td>
                                <td>$sanstwentytwo</b></font></td>
                            </tr>
							<tr>
                                <td>Uncontrolled Format String</td>
                                <td>$sanstwentythree</b></font></td>
                            </tr>
							<tr>
                                <td>Integer Overflow or Wraparound</td>
                                <td>$sanstwentyfour</b></font></td>
                            </tr>
							<tr>
                                <td>Use of a One-Way Hash without a Salt</td>
                                <td>$sanstwentyfive</b></font></td>
                            </tr>
                            </tbody>
                          </table>
						  </div>
							<div id="chart5" class="col-md-6 col-sm-6 col-xs-12" style="height:480px;" ></div>
						<!--<div id="chart4" class="col-md-6 col-sm-6 col-xs-12" style="height:320px;" ></div>-->
                      </div>
                    </div>
                  </div>
                </div>
				<!--HIPAA Starts -->
				 <div class="col-md-12 col-sm-6 col-xs-12">
                  <div class="x_panel">
                    <div class="x_title" id="navigate5">
                      <h5>HIPAA Compliance</h5>
                      <div class="clearfix"></div>
                    </div>
                    <div class="x_content" >
						<div class="dashboard-widget-content">
                        <div class="col-md-6 hidden-small">
                          <table class="countries_list">
                            <tbody>
                              <tr>
                                <td>General requirements 164.306 (a)(1))</td>
                                <td>$hipaa_one</b></font></td>
                            </tr>
                            <tr>
                                <td>General requirements 164.306 (a)(2))</td>
                                <td>$hipaa_two</b></font></td>
                            </tr>
                            <tr>
                                <td>General requirements  (164.306 (a)(3))</td>
                                <td>$hipaa_three</b></font></td>
                            </tr>
							<tr>
                                <td>Standard: Security management process (164.308 (a)(1)(i))</td>
                                <td>$hipaa_four</b></font></td>
                            </tr>
							    <tr>
                                <td>Risk management (164.308 (a)(1)(ii)(B))</td>
                                <td>$hipaa_five</b></font></td>
                            </tr>
                            <tr>
                                <td>Protection from malicious software</td>
                                <td>$hipaa_six</b></font></td>
                            </tr>
                            <tr>
                                <td>Password management (164.308 (a)(5)(ii)(D))</td>
                                <td>$hipaa_seven</b></font></td>
                            </tr>
							<tr>
                                <td>Integrity Controls 164.312(c)</td>
                                <td>$hipaa_eight</b></font></td>
                            </tr>
							<tr>
                                <td>Person or entity authentication (164.312 (d))</td>
                                <td>$hipaa_nine</b></font></td>
                            </tr>
							<tr>
                                <td>Transmission Security 164.312(e)</td>
                                <td>$hipaaten</b></font></td>
                            </tr>
							<tr>
                                <td>Safeguards 164.530 (c)(2)(i)</td>
                                <td>$hipaa_leven</b></font></td>
                            </tr>
                            </tbody>
                          </table>
						  </div>
							<div id="chart6" class="col-md-6 col-sm-6 col-xs-12" style="height:340px;" ></div>
						<!--<div id="chart4" class="col-md-6 col-sm-6 col-xs-12" style="height:320px;" ></div>-->
                      </div>
                    </div>
                  </div>
                </div>
				<!--HIPAA Ends -->
				<!--NIST Starts -->
				 <div class="col-md-12 col-sm-6 col-xs-12">
                  <div class="x_panel">
                    <div class="x_title" id="navigate4">
                      <h5>NIST Compliance</h5>
                      <div class="clearfix"></div>
                    </div>
                    <div class="x_content" >
						<div class="dashboard-widget-content">
                        <div class="col-md-6 hidden-small">
                          <table class="countries_list">
                            <tbody>
                              <tr>
                                <td>(AC-6) LEAST PRIVILEGE</td>
                                <td>$nist_one</b></font></td>
                            </tr>
                            <tr>
                                <td>(AC-10) CONCURRENT SESSION CONTROL</td>
                                <td>$nist_two</b></font></td>
                            </tr>
                            <tr>
                                <td>(AC-12) SESSION TERMINATION</td>
                                <td>$nist_three</b></font></td>
                            </tr>
							<tr>
                                <td>(AC-17) REMOTE ACCESS</td>
                                <td>$nist_four</b></font></td>
                            </tr>
							    <tr>
                                <td>(CM-6) CONFIGURATION SETTINGS</td>
                                <td>$nist_five</b></font></td>
                            </tr>
                            <tr>
                                <td>(CM-7) LEAST FUNCTIONALITY</td>
                                <td>$nist_six</b></font></td>
                            </tr>
                            <tr>
                                <td>(IA-2) USER IDENTIFICATION AND AUTHENTICATION</td>
                                <td>$nist_seven</b></font></td>
                            </tr>
							<tr>
                                <td>(SC-5) DENIAL OF SERVICE PROTECTION</td>
                                <td>$nist_eight</b></font></td>
                            </tr>
							<tr>
                                <td>(SC-8) TRANSMISSION INTEGRITY</td>
                                <td>$nist_nine</b></font></td>
                            </tr>
							<tr>
                                <td>(SC-9) TRANSMISSION CONFIDENTIALITY</td>
                                <td>$nistten</b></font></td>
                            </tr>
							<tr>
                                <td>(SC-14) PUBLIC ACCESS PROTECTIONS</td>
                                <td>$nist_leven</b></font></td>
                            </tr>
							<tr>
                                <td>(SI-3) MALICIOUS CODE PROTECTION</td>
                                <td>$nist_tweleve</b></font></td>
                            </tr>
							<tr>
                                <td>(SI-7) SOFTWARE AND INFORMATION INTEGRITY</td>
                                <td>$nist_thirteen</b></font></td>
                            </tr>
							<tr>
                                <td>(SI-15) INFORMATION OUTPUT FILTERING</td>
                                <td>$nistfourteen</b></font></td>
                            </tr>
                            </tbody>
                          </table>
						  </div>
							<div id="chart8" class="col-md-6 col-sm-6 col-xs-12" style="height:500px;" ></div>
						<!--<div id="chart4" class="col-md-6 col-sm-6 col-xs-12" style="height:320px;" ></div>-->
                      </div> 
                    </div>
                  </div>
                </div>
				<!--NIST Ends -->
				<!--OSSTMM Starts -->
				 <div class="col-md-12 col-sm-6 col-xs-12">
                  <div class="x_panel">
                    <div class="x_title" id="navigate9">
                      <h5>OSS TMM Compliance</h5>
                      <div class="clearfix"></div>
                    </div>
                    <div class="x_content" >
						<div class="dashboard-widget-content">
                        <div class="col-md-6 hidden-small">
                          <table class="countries_list">
                            <tbody>
                              <tr>
                                <td>Authentication</td>
                                <td><font color="red">$OSS1</font></td>
                               </tr>
                               <tr>
                                <td>Session Management </td>
                                <td><font color="red">$OSS2</font></td>
                               </tr>
                               <tr>
                                <td>Input Manipulation</td>
                                <td><font color="red">$OSS3</font></td>
                               </tr>
							   <tr>
                                <td>Output Manipulation</td>
                                <td><font color="red">$OSS4</font></td>
                               </tr>
							   <tr>
                                <td>Information Leakage</td>
                                <td><font color="red">$OSS5</font></td>
                               </tr>
                               <tr>
                                <td>Denial of service</td>
                                <td><font color="red">$OSS6</font></td>
                               </tr>
                            </tbody>
                          </table>
						  </div>
							<div id="chart9" class="col-md-6 col-sm-6 col-xs-12" style="height:200px;" ></div>
						<!--<div id="chart4" class="col-md-6 col-sm-6 col-xs-12" style="height:320px;" ></div>-->
                      </div> 
                    </div>
                  </div>
                </div>
				<!--OSSTMM Ends -->
                <!-- start of weather widget -->
                <div class="col-md-12 col-sm-1 col-xs-12">
                  <div class="x_panel">
                    <div class="x_title" id="navigate">
                      <h2>Detailed Vulnerabilities Status</h2>
                      <div class="clearfix"></div>
                    </div>
                    <div class="x_content">   
                     <table id="vulnsStatus" class="table table-bordered table-condensed TFtable" >
							<tr>
                                <th width="10%" style="background-color:#FF94B6;">S.No</th>
                                <th width="70%" style="background-color:#FF94B6;"><b>Vulnerability</b></th>
								<th width="10%" style="background-color:#FF94B6;"><b>Tool Name</b></th>
								<th width="10%" style="background-color:#FF94B6;"><b>Severity</b></th>
                            </tr>
							$vulnsStatus
					  </table> 
                    </div>
                  </div>
                </div>
                <!-- end of weather widget -->
              </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>Compliance Information</h2>	                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="dashboard-widget-content">
				  <marquee direction="down">
                    <ul class="list-unstyled timeline widget">
                      <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                              <a>OWASP Top 10</a>
                                          </h2>
                            <p class="excerpt">The Open Web Application Security Project (OWASP) is a non-profit organization dedicated to providing unbiased, practical information about application security. The OWASP Top 10 Web Application Security Risks was updated in 2017 to provide guidance to developers and security professionals on the most critical vulnerabilities that are commonly found in web applications, which are also easy to exploit. These 10 application risks are dangerous because they may allow attackers to plant malware, steal data, or completely take over your computers or web servers. 
                            </p>
                          </div>
                        </div>
                      </li>
                      <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                              <a>PCI-DSS 6.5</a>
                                          </h2>
                            
                            <p class="excerpt">The PCI Standard is mandated by the card brands and administered by the Payment Card Industry Security Standards Council. The standard was created to increase controls around cardholder data to reduce credit card fraud. Validation of compliance is performed annually, either by an external [Qualified Security Assessor] (QSA) or by a firm specific Internal Security Assessor that creates a Report on Compliance for organizations handling large volumes of transactions, or by Self-Assessment Questionnaire (SAQ) for companies handling smaller volumes. 
                            </p>
                          </div>
                        </div>
                      </li>
                      <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                              <a>SANS top 25</a>
                                          </h2>
                           
                            <p class="excerpt">The SANS Institute (officially the Escal Institute of Advanced Technologies)   is a private U.S. for-profit company   founded in 1989 that specializes in information security and cybersecurity training. Topics available for training include cyber and network defenses, penetration testing, incident response, digital forensics, and audit. The information security courses are developed through a consensus process involving administrators, security managers, and information security professionals. The courses cover security fundamentals and technical aspects of information security. The Institute has been recognized for its training programs  and certification programs. SANS stands for SysAdmin, Audit, Network and Security. 
                            </p>
                          </div>
                        </div>
                      </li>
                      <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                              <a>HIPAA Compliance</a>
                                          </h2>
                            
                            <p class="excerpt">HIPAA is the acronym for the Health Insurance Portability and Accountability Act that was passed by Congress in 1996.  HIPAA does the following: 
Provides the ability to transfer and continue health insurance coverage for millions of American workers and their families when they change or lose their jobs; 
Reduces health care fraud and abuse; 
Mandates industry-wide standards for health care information on electronic billing and other processes; and 
Requires the protection and confidential handling of protected health information
                            </p>
                          </div>
                        </div>
                      </li>
					  <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                              <a>ISO27001 Compliance</a>
                                          </h2>
                            
                            <p class="excerpt">ISO/IEC 27001 is an information security management system (ISMS) standard published in October 2005 by the International Organization for Standardization (ISO) and the International Electrotechnical Commission (IEC). Its full name is ISO/IEC 27001:2005 – Information technology – Security techniques – Information security management systems – Requirements. The objective of this standard is to provide a model for establishing, implementing, operating, monitoring, reviewing, maintaining, and improving an Information Security Management System. 
                            </p>
                          </div>
                        </div>
                      </li>
					  <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                              <a>WASC Compliance</a>
                                          </h2>
                            
                            <p class="excerpt">The Web Application Security Consortium (WASC) is 501c3 non profit made up of an international group of experts, industry practitioners, and organizational representatives who produce open source and widely agreed upon best-practice security standards for the World Wide Web. 
                            </p>
                          </div>
                        </div>
                      </li>
					  <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                              <a>SAS70 Compliance</a>
                                          </h2>
                            
                            <p class="excerpt">Statement on Auditing Standards (SAS) No. 70, Service Organizations, was a widely recognized auditing standard developed by the American Institute of Certified Public Accountants (AICPA).  SAS  70 provides guidance to enable an independent auditor ("service auditor") to issue an opinion on a service organization's description of controls through a Service Auditor's Report .
                            </p>
                          </div>
                        </div>
                      </li>
					  <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                              <a>NIST Compliance</a>
                                          </h2>
                            
                            <p class="excerpt">National Institute of Standards and Technology (NIST) test methods, reference data, proof of concept implementations, and technical analyses to advance the development and productive use of information technology 
                            </p>
                          </div>
                        </div>
                      </li>
                    </ul>
					</marquee>
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
	Morris.Donut({
  element: 'chart2',
  data: [
    {label: "OWASP", value: $owaspCount},
    {label: "PCI-DSS", value: $pcidssCount},
    {label: "SANS", value: $sansCount},
	{label: "HIPAA", value: $hipaaCount},
	{label: "ISO27001", value: 0},
	{label: "OSSTMM", value: $OSS_TMMCount},
	{label: "WASC", value: $wascCount},
	{label: "NIST", value: $nistCount},
	{label: "SAS70", value: 0}
  ],
  labelColor: '#060',
  colors: [
    '#66A384',
    '#024925',
    '#05AEB6',
    '#0E5154',
	'#4840E8',
    '#817F9D',
	'#85802b', 
	'#00749F'
  ],
  formatter: function (x) { return x + ""}
});
</script>
<script>
$(document).ready(function(){
    var line1 = [['A1', $A_1],['A2', $A_2],['A3', $A_3],['A4', $A_4],['A5', $A_5],['A6', $A_6],['A7', $A_7],['A8', $A_8],['A9', $A_9],['A10', $A_10]];
 
    $('#chart3').jqplot([line1], {
        title:'',
        // Provide a custom seriesColors array to override the default colors.
        seriesColors:['#85802b', '#00749F', '#73C774', '#C7754C', '#17BDB8'],
        seriesDefaults:{
            renderer:$.jqplot.BarRenderer,
            rendererOptions: {
                // Set varyBarColor to tru to use the custom colors on the bars.
                varyBarColor: true
            }
        },
		pointLabels: { show: true,formatString: '%s' },
        axes:{
            xaxis:{
                renderer: $.jqplot.CategoryAxisRenderer,
				tickOptions: {
					angle: -40
				}
            }
        }
    });
});
</script>
<script>
$(document).ready(function(){
    var line1 = [['OSSTMM1', $OSSTMM_1],['OSSTMM2', $OSSTMM_2],['OSSTMM3', $OSSTMM_3],['OSSTMM4', $OSSTMM_4],['OSSTMM5', $OSSTMM_5],['OSSTMM6', $OSSTMM_6]];
 
    $('#chart9').jqplot([line1], {
        title:'',
        // Provide a custom seriesColors array to override the default colors.
        seriesColors:['#85802b', '#00749F', '#73C774', '#C7754C', '#17BDB8','#C7754C'],
        seriesDefaults:{
            renderer:$.jqplot.BarRenderer,
            rendererOptions: {
                // Set varyBarColor to tru to use the custom colors on the bars.
                varyBarColor: true
            }
        },
		pointLabels: { show: true,formatString: '%s' },
        axes:{
            xaxis:{
                renderer: $.jqplot.CategoryAxisRenderer,
				tickOptions: {
					angle: -40
				}
            }
        }
    });
});
</script>
<script>
$(document).ready(function(){
    var line1 = [['H1', $H_1],['H2', $H_2],['H3', $H_3],['H4', $H_4],['H5', $H_5],['H6', $H_6],['H7', $H_7],['H8', $H_8],['H9', $H_9],['H10', $H10],['H11', $H11]];
    $('#chart6').jqplot([line1], {
        title:'',
        // Provide a custom seriesColors array to override the default colors.
        seriesColors:['#85802b', '#00749F', '#73C774', '#C7754C', '#17BDB8','#85802b', '#00749F', '#73C774', '#C7754C', '#17BDB8', '#00749F'],
        seriesDefaults:{
            renderer:$.jqplot.BarRenderer,
            rendererOptions: {
                // Set varyBarColor to tru to use the custom colors on the bars.
                varyBarColor: true
            }
        },
        axes:{
            xaxis:{
                renderer: $.jqplot.CategoryAxisRenderer
            }
        }
    });
});
</script>
<script>
 $(document).ready(function(){
    // For horizontal bar charts, x an y values must will be "flipped"
    // from their vertical bar counterpart.
    var plot2 = $.jqplot('chart5', [
        [[$S_1,"S1"]], 
        [[$S_2,"S2"]], 
        [[$S_3,"S3"]],
		[[$S_4,"S4"]], 
        [[$S_5,"S5"]], 
        [[$S_6,"S6"]],
		[[$S_7,"S7"]], 
        [[$S_8,"S8"]], 
        [[$S_9,"S9"]],
		[[$S10,"S10"]], 
        [[$S11,"S11"]], 
        [[$S12,"S12"]],
		[[$S13,"S13"]], 
        [[$S14,"S14"]], 
        [[$S15,"S15"]],
		[[$S16,"S16"]], 
        [[$S17,"S17"]], 
        [[$S18,"S18"]],
		[[$S19,"S19"]], 
        [[$S_20,"S20"]], 
        [[$S21,"S21"]],
		[[$S22,"S22"]], 
        [[$S23,"S23"]], 
        [[$S24,"S24"]],
		[[$S25,"S25"]]		
		], {
        seriesDefaults: {
            renderer:$.jqplot.BarRenderer,
            // Show point labels to the right ('e'ast) of each bar.
            // edgeTolerance of -15 allows labels flow outside the grid
            // up to 15 pixels.  If they flow out more than that, they 
            // will be hidden.
            pointLabels: { show: true, location: 'e', edgeTolerance: -15 },
            // Rotate the bar shadow as if bar is lit from top right.
            shadowAngle: 135,
            // Here's where we tell the chart it is oriented horizontally.
            rendererOptions: {
                barDirection: 'horizontal'
            }
        },
        axes: {
            yaxis: {
                renderer: $.jqplot.CategoryAxisRenderer
            }
        }
    });
});
</script>
<script>
 $(document).ready(function(){
    // For horizontal bar charts, x an y values must will be "flipped"
    // from their vertical bar counterpart.
    var plot2 = $.jqplot('chart8', [
        [[$N_1,'N1']],[[$N_2,'N2']],[[$N_3,'N3']],[[$N_4,'N4']],[[$N_5,'N5']],[[$N_6,'N6']],[[$N_7,'N7']],[[$N_8,'N8']],[[$N_9,'N9']],[[$N10,'N10']],[[$N11,'N11']],[[$N12,'N12']],[[$N13,'N13']],[[$N14,'N14']]	
		], {
        seriesDefaults: {
            renderer:$.jqplot.BarRenderer,
            // Show point labels to the right ('e'ast) of each bar.
            // edgeTolerance of -15 allows labels flow outside the grid
            // up to 15 pixels.  If they flow out more than that, they 
            // will be hidden.
            pointLabels: { show: true, location: 'e', edgeTolerance: -15 },
            // Rotate the bar shadow as if bar is lit from top right.
            shadowAngle: 135,
            // Here's where we tell the chart it is oriented horizontally.
            rendererOptions: {
                barDirection: 'horizontal'
            }
        },
        axes: {
            yaxis: {
                renderer: $.jqplot.CategoryAxisRenderer
            }
        }
    });
});
</script>
<!--
<script>
$(document).ready(function(){
    var line1 = [['N1', $N_1],['N2', $N_2],['N3', $N_3],['N4', $N_4],['N5', $N_5],['N6', $N_6],['N7', $N_7],['N8', $N_8],['N9', $N_9],['N10', $N10],['N11', $N11],['N12', $N12],['N13', $N13],['N14', $N14]];
    $('#chart8').jqplot([line1], {
        title:'',
        // Provide a custom seriesColors array to override the default colors.
        seriesColors:['#85802b', '#00749F', '#73C774', '#C7754C', '#17BDB8','#85802b', '#00749F', '#73C774', '#C7754C', '#17BDB8','#85802b', '#00749F', '#73C774', '#C7754C'],
        seriesDefaults:{
            renderer:$.jqplot.BarRenderer,
            rendererOptions: {
                // Set varyBarColor to tru to use the custom colors on the bars.
                varyBarColor: true
            }
        },
        axes:{
            xaxis:{
                renderer: $.jqplot.CategoryAxisRenderer
            }
        }
    });
});
</script>
-->
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
