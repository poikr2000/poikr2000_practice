<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
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
			  	<button type="button" id="confirm" onclick="javascript:location.href='boardPageList?find';" class="btn btn-primary btn-block"><i class="fa fa-check" aria-hidden="true"></i>&nbsp확&nbsp&nbsp&nbsp&nbsp&nbsp인</button>
			</div>
		</div>
	</form>
</body>
</html>