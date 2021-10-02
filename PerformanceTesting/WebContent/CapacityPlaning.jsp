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
						  <li><a href="LoadGenerator.jsp">Load Generator</a></li>
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
              <span class="count_top"><div class="card-body-icon"><h1>Server Capacity Calculator</h1></div></span>
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
                      <h4><font color="#C080F9"><b>Existing Server Capacity &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Estimated Server Capacity</b></font></h4>
                     <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
              
                  <div class="widget_summary">
                   <!-- Form -->
                   
                   <table width="100%">
                   		<tr> 
                   			<td width="28%">
                   				<form id="existingserver" method="GET" action="CapacityPlaning.jsp">
							  No. of Users (Threads)*<br>
							  <input id="NoOfUsers" type="text" class="input">
							  <br><br>
							  Average ResponseTime(in Sec)*<br>
							  <input id="AvgResTime" type="text" class="input">
							  <br><br>
							  Throughput(Requests/Sec)*<Br>
							  <input id="trupt" type="text" class="input">
							  <br><br>
							  CPU Cores*<Br>
							  <input id="cores" type="text" class="input">
							  <br><br>
							  Memory(GB)*<Br>
							  <input id="memory" type="text" class="input">
							  <br><br>
							  Target Users*<Br>
							  <input id="Tusers" type="text" class="input">
							  <br><br>
							  Target Avg ResponseTime(sec)*<Br>
							  <input id="TAvgResTime" type="text" class="input">
							  <br><br>							  
							  <input type="button" name="button" value="Calculate" onclick="calThinkTime()">
							  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  <input type="button" name="button" value="Reset" onclick="resetform1()">
							</form>
							</td> 
                   			<td width="50%">
                   				<form id="estimateserver" "method="GET" action="CapacityPlaning.jsp">
							  Target Users(Threads)*<br>
							  <input id="TarUsers" type="text" readonly="readonly" disabled>
							  <br><br>
							  Target Average ResponseTime(in Sec)*<br>
							  <input id="TarAvgResTime" type="text"  readonly="readonly" disabled>
							  <br><br>
							  Throughput(Requests/Sec)*<Br>
							  <input id="tarupt" type="text" readonly="readonly" disabled>
							  <br><br>
							  Required CPU Cores*<Br>
							  <input id="reqcores" type="text" readonly="readonly" disabled>
							  <br><br>
							  Required Memory(GB)*<Br>
							  <input id="reqmemory" type="text" readonly="readonly" disabled>		
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
        avgRes = Number(document.getElementById("AvgResTime").value);
		thrpughput = Number(document.getElementById("trupt").value);
        noofcores = Number(document.getElementById("cores").value);
		 memorygb= Number(document.getElementById("memory").value);
		 tuesrs = Number(document.getElementById("Tusers").value);
		 tavgrs= Number(document.getElementById("TAvgResTime").value);
		if (nousers == "" || avgRes== "" || thrpughput== "" || noofcores== "" || memorygb== "" ||tuesrs=="" ||tavgrs=="")
		{
		alert("All the fields with * sign are compulsory");
		return false;
		}
		
		ReqVusers=tuesrs/nousers;
		tarThroughput=thrpughput*ReqVusers;
		tarCpuCores=noofcores*ReqVusers;
		RequiredMemory=memorygb*ReqVusers;		
		document.getElementById("TarUsers").value=tuesrs;
		document.getElementById("TarAvgResTime").value=tavgrs;
		document.getElementById("tarupt").value=tarThroughput;
		document.getElementById("reqcores").value=tarCpuCores;
		document.getElementById("reqmemory").value=RequiredMemory;

}
</script>
<script>
function resetform1() {
  document.getElementById("calvusers").reset();
  document.getElementById("estimateserver").reset();
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
