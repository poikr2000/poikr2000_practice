<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="resources/js/parsley.min.js"></script>
</head>
<body>
	<form action="memberList" method="get">
		<div class="container col-sm-offset-4 col-sm-4" align="center">
			<div class="row" style="margin-top:50px">
				  <div align="center" style="font-size: 50px">result page</div>
			</div>
			<div class="row" style="margin-top:10px">
				  <div align="center">
				  	<h4>${msg}</h4>
				  </div>
			</div>
			<div class="row" style="margin-top:10px">
			  	<button id="confirm" class="btn btn-primary btn-block"><i class="fa fa-check" aria-hidden="true"></i>&nbsp확&nbsp&nbsp&nbsp&nbsp&nbsp인</button>
			</div>
		</div>
	
	</form>
</body>
</html>