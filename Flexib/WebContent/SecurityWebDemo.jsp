<!DOCTYPE html>
<html>
<head>
<style>
.button {
  padding: 15px 25px;
  font-size: 24px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
</style>
</head>
<body>
<table>
	<tr>
		<td>
			<form action="SecurityDemo.jsp" method="POST">
				<input type="hidden" name="submit" value="submit">
				<input class="button" type="submit" name="button1" value="Run Demo">
			</form>
		</td>
		<td>
		</td>
	</tr>
	<tr>
		<td>
		</td>
	</tr>
</table>


</body>
</html>
