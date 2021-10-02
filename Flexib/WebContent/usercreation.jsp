<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="css/styles.css">
  <link rel="stylesheet" type="text/css" href="css/indexmenu.css">

<style>
* {
    box-sizing: border-box;
}

input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
}

label {
    padding: 12px 12px 12px 0;
    display: inline-block;
}

input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    float: right;
}

input[type=submit]:hover {
    background-color: #45a049;
}

.container {
    border-radius: 5px;
    background-color: white;
    padding: 10px;
}

.col-25 {
    float: left;
    width: 25%;
    margin-top: 6px;
}

.col-75 {
    float: left;
    width: 75%;
    margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
    .col-25, .col-75, input[type=submit] {
        width: 100%;
        margin-top: 0;
    }
}
</style>
</head>
<body>
<jsp:include page="header.jsp" />
<hr class="hrheader">
<table>
	<tr>
		<td>
			<div class="vertical-menu">
			  <a href="#" class="active">Home</a>
			  <a href="usercreation.jsp">User Creation</a>
			  <a href="#">Link 2</a>
			  <a href="#">Link 3</a>
			  <a href="#">Link 4</a>
			</div>
		</td>
		<td>
			<div class="container" style="padding-left: 250px;padding-top: 250px; width: 800px; padding-right: 20px;">
			  <form action="#">
			    <div class="row">
			      <div class="col-25">
			        <label for="uname">User Name</label>
			      </div>
			      <div class="col-75">
			        <input type="text" id="uname" name="username" placeholder="User Name..">
			      </div>
			    </div>
			    <div class="row">
			      <div class="col-25">
			        <label for="pwd">Password</label>
			      </div>
			      <div class="col-75">
			        <input type="password" id="pwd" name="password" placeholder="Password..">
			      </div>
			    </div>
			    
			    <div class="row">
			      <div class="col-25">
			        <label for="testtype">Testing Type</label>
			      </div>
			      <div class="col-75">
			        <select id="testtype" name="testtype">
			          <option></option>
					    <option value="Automation_Testing">Automation Testing</option>
					    <option value="Performance_Testing">Performance Testing</option>
					    <option value="UFT">UFT</option>
					    <option value="Security_Testing">Security Testing</option>
					    <option value="Administrator">Administrator</option>
			        </select>
			      </div>
			    </div>
			    <br>
			    <div class="row">
			      <input type="submit" value="Submit">
			    </div>
			  </form>
			</div>
		</td>
	</tr>
</table>

<jsp:include page="footer.jsp" />
</body>
</html>
