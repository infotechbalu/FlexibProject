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
  <script>
  window.onload = function () {
     open(location, '_self').close();
   };
</script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
	<link rel="icon" href="images/stf.png" type="image/ico" />

    <title>Visual Automation Execution</title>

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
width:900px;
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
  -moz-animation-duration: 500ms;
  -moz-animation-name: blink;
  -moz-animation-iteration-count: infinite;
  -moz-animation-direction: alternate;
  
  -webkit-animation-duration: 500ms;
  -webkit-animation-name: blink;
  -webkit-animation-iteration-count: infinite;
  -webkit-animation-direction: alternate;
  
  animation-duration: 500ms;
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

<a href="<%
Runtime.getRuntime().exec("cmd /c start E:\\VisualRegressionTesting\\Projects\\test1.bat");
%>">TestReference</a>

</body>
</html>