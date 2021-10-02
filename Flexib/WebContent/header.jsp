<!DOCTYPE html>
<html>
<title>Flexib</title>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Flexib</title>

<!-- Bootstrap -->
<!-- <link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/font-awesome.min.css"> -->

  <link rel="stylesheet" type="text/css" href="/FlexiHomepage/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="/FlexiHomepage/css/styles.css">
  <link rel="stylesheet" type="text/css" href="/FlexiHomepage/css/font-awesome.min.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <div class="navbar navbar-default navbar-fixed-top shadow1">
  <div class="container-fluid">
    <div class="pull-right"><img src="images/AltirayTrans.png"  height="60" alt="" /></div>
    <div class="navbar-header">
      <button button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" rel="home" href="#" title=""> <img 
                     src="FlexiHomepage/images/FlexibImage.png" height="60px" 
				> </a> </div>
    <div id="navbar" class="collapse navbar-collapse navbar-responsive-collapse">
      <ul class="nav navbar-nav">
        <li class="active dropdown" > <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Testing types <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="/Flexib/login.jsp?testtype=Static_Code_Analysis">Static Code Analysis</a></li>
            <li><a href="/Flexib/login.jsp?testtype=VisualAuto_Testing">Visual Automation</a></li>
            <li><a href="/Flexib/login.jsp?testtype=Automation_Testing">Functional Automation</a></li>
            <!-- <li role="separator" class="divider"></li>-->
            <li><a href="#">Mobile Automation</a></li>
            <li><a href="/Flexib/login.jsp?testtype=Security_Testing">Security Testing</a></li>
            <li><a href="/Flexib/login.jsp?testtype=Performance_Testing"> Performance Testing</a></li>
          </ul>
        </li>
        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Reports <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Static Code Analysis</a></li>
            <li><a href="#">Visual Automation</a></li>
            <li><a href="#">Functional Automation</a></li>
            <!-- <li role="separator" class="divider"></li>-->
            <li><a href="#">Mobile Automation</a></li>
            <li><a href="#">Security Testing</a></li>
            <li><a href="#"> Performance Testing</a></li>
          </ul>
        </li>
        <li><a href="/Flexib/cicd.jsp">Continuous Testing</a></li>
      </ul>
    </div>
  </div>
</div>
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="/Flexib/FlexiHomepage/js/jquery-1.11.3.min.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="/Flexib/FlexiHomepage/js/bootstrap.js"></script>
</body>
</html>