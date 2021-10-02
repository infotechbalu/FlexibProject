<%@ page import="java.io.*" %>
<%@ page import="javax.naming.*,java.sql.*,java.io.*,java.lang.*,java.text.*,java.util.*"%> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
	<link rel="icon" href="images/stf.png" type="image/ico" />

    <title>Calculators</title>

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
td {
  text-align: left;
}
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
               <!--  <ul class="nav side-menu">
				<a href="index.html"><img style="width:100px;height:90px" src="images/3i-Infotech.jpg"/></a>
                <li><a href="index.html"><i class="fa fa-home" aria-hidden="true"></i><small>Dashboard</small><span class="fa fa-chevron-down"></span></a>
                  </li>
				  <li><a><i class="fa fa-calculator"></i>Calculators<span class="fa fa-chevron-down"></span></a>
					    <ul class="nav child_menu">
						  <li><a href="ThinkTimeCalculator.jsp">Load Generator</a></li>
						  <li><a href="#navigate2">test</a></li>					  
						</ul>
                  </li>
                  <li><a><i class="fa fa-newspaper-o"></i><small>Keyword Driven Framework</small><span class="fa fa-chevron-down"></span></a>
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
			<div class="col-md-6 col-sm-6 col-xs-6 tile_stats_count">
              <span class="count_top"><div class="card-body-icon"><h1>Think Time Calculator</h1></div></span>
			  <br/>
              <span class="count_bottom green"><b></b></span>
            </div>			
          </div>		
          <!-- /top tiles -->
          <div class="row">
            
                <!-- start of weather widget -->
                <div class="col-md-12 col-sm-1 col-xs-12">
                  <div class="x_panel">
                    <div class="x_title" id="navigate">
                      <h4><font color="#C080F9"><b>Think Time Calculator</b></font></h4>
                     <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
              
                  <div class="widget_summary">
                   <!-- Form -->
                   
                   <table width="50%">
                   		<tr> 
                   			<td width="25%">

                   				<form id="calThinkTimeF" method="GET" action="ThinkTimeCalculator.jsp">
							  No. of Users (Threads)*)<br>
							  <input id="NoOfUsers" type="text" class="input">
							  <br><br>
							  Time to complete one iteration*<br>
							  <input id="TimeOneItr" type="text" class="input">
							  <br><br>
							  TPS (Transaction per second)*<Br>
							  <input id="Tps" type="text" class="input">
							  <br><br>
							  Pacing*<Br>
							  <input id="pacing" type="text" class="input">
							  <br><br>
							  No. of Transactions *<Br>
							  <input id="notrans" type="text" class="input">
							  <br><br>
							  Calculation Result<Br>
							  <br>
							  Total Think Time (in seconds) #-1 denotes no think time required<Br>
							  <input id="TTTimeResult" type="text" readonly="readonly" disabled>
							  <br><br>
							  Average Think Time between each transaction (in seconds)<Br>
							  <input id="AvgTT" type="text" readonly="readonly" disabled>
							  <br><br>							  
							  <input type="button" name="button" value="Calculate" onclick="calThinkTime()">
							  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  <input type="button" name="button" value="Reset" onclick="resetform1()">
							</form>
							</td>                    			                 		
                   		</tr>
                   </table>                 		
                  </div>
                </div>
                  </div>

                </div>
                <!-- end of weather widget -->
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
function calThinkTime()
{
        nousers = Number(document.getElementById("NoOfUsers").value);
        onrItr = Number(document.getElementById("TimeOneItr").value);
		tps = Number(document.getElementById("Tps").value);
        pacings = Number(document.getElementById("pacing").value);
		notranscat = Number(document.getElementById("notrans").value);
		if (nousers == "" || onrItr== "" || tps== "" || pacings== "" || notranscat== "" )
		{
		alert("All the fields with * sign are compulsory");
		return false;
		}
		Totalthinktime=((nousers/tps)*notranscat)-(onrItr+pacings);
		TTforEachTrans=Totalthinktime/(notranscat-1)
		
		document.getElementById("TTTimeResult").value=Totalthinktime.toFixed(2);
		document.getElementById("AvgTT").value=TTforEachTrans.toFixed(2);
}
</script>
<script>
function resetform1() {
  document.getElementById("calThinkTimeF").reset();
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