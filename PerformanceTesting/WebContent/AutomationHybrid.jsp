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

    <title>Keyword Driven Automation Testing</title>

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
	
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.7.7/xlsx.core.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xls/0.7.4-a/xls.core.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <script type="text/javascript">
            function ExportToTable() {
                var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.xlsx|.xls)$/;
                /*Checks whether the file is a valid excel file*/
                if (regex.test($("#excelfile").val().toLowerCase())) {
                    var xlsxflag = false; /*Flag for checking whether excel is .xls format or .xlsx format*/
                    if ($("#excelfile").val().toLowerCase().indexOf(".xlsx") > 0) {
                        xlsxflag = true;
                    }
                    /*Checks whether the browser supports HTML5*/
                    if (typeof (FileReader) != "undefined") {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            var data = e.target.result;
                            /*Converts the excel data in to object*/
                            if (xlsxflag) {
                                var workbook = XLSX.read(data, { type: 'binary' });
                            }
                            else {
                                var workbook = XLS.read(data, { type: 'binary' });
                            }
                            /*Gets all the sheetnames of excel in to a variable*/
                            var sheet_name_list = workbook.SheetNames;

                            var cnt = 0; /*This is used for restricting the script to consider only first sheet of excel*/
                            sheet_name_list.forEach(function (y) { /*Iterate through all sheets*/
                                /*Convert the cell value to Json*/
                                if (xlsxflag) {
                                    var exceljson = XLSX.utils.sheet_to_json(workbook.Sheets[y]);
                                }
                                else {
                                    var exceljson = XLS.utils.sheet_to_row_object_array(workbook.Sheets[y]);
                                }
                                if (exceljson.length > 0 && cnt == 0) {
                                    BindTable(exceljson, '#exceltable');
                                    cnt++;
                                }
                            });
                            $('#exceltable').show();
                        }
                        if (xlsxflag) {/*If excel file is .xlsx extension than creates a Array Buffer from excel*/
                            reader.readAsArrayBuffer($("#excelfile")[0].files[0]);
                        }
                        else {
                            reader.readAsBinaryString($("#excelfile")[0].files[0]);
                        }
                    }
                    else {
                        alert("Sorry! Your browser does not support HTML5!");
                    }
                }
                else {
                    alert("Please upload a valid Excel file!");
                }
            }
            function BindTable(jsondata, tableid) {/*Function used to convert the JSON array to Html Table*/
                var columns = BindTableHeader(jsondata, tableid); /*Gets all the column headings of Excel*/
                var rowid = 0;
                for (var i = 0; i < jsondata.length; i++) {
                    var row$ = $('<tr style="height:20px;">');
                    rowid = rowid + 1;
                    for (var colIndex = 0; colIndex < columns.length; colIndex++) {
                        var cellValue = jsondata[i][columns[colIndex]];
                        if (cellValue == null)
                            cellValue = "";

                        row$.append($('<td/>').html('<input onchange="textchange(this)" type="text" value="' + cellValue + '" id="' + colIndex + '-' + rowid + '" "/>'));
                    }
                    $(tableid).append(row$);
                }
				$("#Execute").css('visibility', 'visible');
            }
            function BindTableHeader(jsondata, tableid) {/*Function used to get all column names from JSON and bind the html table header*/
                var columnSet = [];
                var headerTr$ = $('<tr/>');
                for (var i = 0; i < jsondata.length; i++) {
                    var rowHash = jsondata[i];
                    for (var key in rowHash) {
                        if (rowHash.hasOwnProperty(key)) {
                            if ($.inArray(key, columnSet) == -1) {/*Adding each unique column names to a variable array*/
                                columnSet.push(key);
                                headerTr$.append($('<th/>').html(key));
                            }
                        }
                    }
                }
                $(tableid).append(headerTr$);
                return columnSet;
            }
            function textchange(obj) {
                let inputid = $(obj).prop("id");

               // alert($(obj).val());
            }
            function myFunction()
            {
            	alert("Excel Sheet Changes Successfully Saved!!")
            }
        </script>
  
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
     #exceltable {
           
            border-collapse: collapse;
            display: none;
        }

     #exceltable th, #exceltable td {
                border: 1px solid #000;
           	
            }
	 #exceltable th{
                border: 1px solid #000;
           	background-color:#67b1f3;
            }
            	 #exceltable tr{
           height:20px;
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
<!--               <a href="index.html" class="site_title"><img style="width:210px;height:50px" src="images/flexib.png"/></a>-->
			</div>
            <div class="clearfix"></div>
            <br />
            <!-- sidebar menu -->
			
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu sidenav">
              <div class="menu_section">
                <jsp:include page="AutomationMenu.jsp" />
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
          <div class="col-md-10 col-sm-6 col-xs-6 tile_stats_count">
              <br/><br/>
              <div class="count red"><div class="test"><h1><font color="#079DF9">Functional Automation Testing</font></h1></div></div>
			  <span class="count_bottom"></span>
            </div>		

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
                <h4><font color="#C080F9"><b>Hybrid Framework</b></font></h4>
                  <div class="widget_summary">
                   <!-- Form -->
                   
                   <table width="100%">
                   		<tr>
                   			<td width="40%">
                   				<form method="GET" action="AutomationKeyword.jsp">
								  <font size="2"><b>ProjectDirectory:</b></font><br><input type="text" name="SERVERURL">
								  <br>
								  <br>								  
								  <font size="2"><b>ProjectPath:</b></font><br><input type="text" name="PORTNO">
								  <br>
								  <br>
								  <font size="2"><b>JavaScriptpath:</b></font><br><input type="text" name="USERCOUNT">
								  <br>
								   <br>
								    <font size="2"><b>Choose Runable xlxs:</b></font><br>
								    <input type="file" id="excelfile" /> 
								   <br/>
								   <br/>
								   <input type="button"  id="viewfile" value="Export To Table" onclick="ExportToTable()" />
								   <input type="button"  id="viewfile" value="Save Table" onclick="myFunction()" />
								   <br><br>
								   <input type="submit" name="Execute" id="Execute" onclick="window.open('http://localhost:8080/PerformanceTesting/HybridExecution.jsp')" value="Execute">&nbsp;&nbsp;&nbsp;&nbsp;
									
								 <!-- <a href="http://localhost:8080/Flexib_Automation/ShoppingCart_Demo/ShoppingCartDemo.html"><font size="2"><b>Report<b></b></font></a> --> 
								  <a href="http://localhost:8080/Flexib_Automation/ShoppingCart_Demo/htmlfile/22_06_2021_14-06-02.html"><font size="2"><b>Report<b></b></b></font></a>
								  
								
								
								</form>
                   			</td>                    			
                   			<td width="60%">                   				
                   							<%
											if (request.getParameter("Execute") != null) {
												%>
												<table height="300px">
			                   					<tr height="15">

			                   					</tr>
			                   					<tr height="5"><td></td></tr>
			                   					<tr height="70">
			                   						<td bgcolor="#050505" style="height:85px;">
			                   							<div style="max-height: 300px; width: 100%; overflow: auto;">                   							
			                   							<font color="white">

										</font>
										</div>
                   						</td>
                   					</tr>
                   				  
<!--                    				<script> -->
<!--                      				document.getElementById("test_div").style.backgroundImage = 'url(images/pbar_completed.png)'; -->
<!--                    				</script> -->
                   			<!--  	<tr height="10"><td>test</td></tr> -->  
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

										
											}
										%>
								</table> 		              				
                   			</td>                  		
                   		</tr>
                   </table>
                   
                  <table id="exceltable"></table>
                  
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
           Automation Testing Dashboard
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    <!--</div>-->
<!--  
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
-->
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
