<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="resources/js/ncs3.js"></script>
</head>

<body>
	<form class="memberlogin_form" action="login"name="memberlogin_form" method="post" style="margin-top:50px" role="form" data-parsley-validate="true">
		<div class="row">
		  <div class="col-sm-offset-4 col-sm-4" align="center" style="font-size: 50px; color:#ff0000"><i class="fa fa-sign-in" aria-hidden="true"></i>&nbspLogin Fail</div>
		</div>
		<div class="row" style="margin-top:50px">
		  <div class="col-sm-offset-4 col-sm-4" align="center">
		  	<div class="input-group">
			  <span class="input-group-addon"><i class="fa fa-envelope" aria-hidden="true"></i></span>
			  <input id="email" type="email" required="required" class="form-control" name="email" placeholder="Email">
			</div>
		  </div>
		</div><br>
		<div class="row">
		  <div class="col-sm-offset-4 col-sm-4" align="center" >
		  	<div class="input-group">
			  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
			  <input id="password" type="password" required="required" class="form-control" name="password" placeholder="Password">
			</div>
		  </div>
		</div><br>
		<div class="row">
			<div class="col-sm-offset-4 col-sm-4" align="center" >
			  	<div class="btn-group">
				  <button class="btn btn-primary">Login</button>
				  <button type="button" onclick="javascript:location.href='member_insert';" class="btn btn-primary">SignUp</button>
				  <button type="button" onclick="javascript:location.href='index';" class="btn btn-primary">Home</button>
				</div>
			</div>
		</div>
		<div class="row">
			<span class="col-sm-offset-4 col-sm-4 text-center" align="center">
			<a><i class="fa fa-search" aria-hidden="true"></i><span class="passfind">&nbsp비밀번호찾기</span></a>
			</span>
		</div>
		
	</form>
	<form>
		<div id="passwordModal" class="modal fade" role="dialog" >
	         <div class="modal-dialog modal-sm" role="document">
	            <div class="modal-content">
	               <div class="modal-header">
	                  <button type="button" class="close" data-dismiss="modal">&times;</button>
	                   <h4 class="modal-title">E-mail 입력</h4>
	               </div>
	               <div class="modal-body">
		               <div class="input-group">
						   <span class="input-group-addon"><i class="fa fa-envelope" aria-hidden="true"></i></span>
						   <input id="findemail" type="email" required="required" class="form-control" name="findemail" placeholder="Email">
						</div>
						<div class="input-group">
						   <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						   <input id="findname" type="text" class="form-control" name="findname" placeholder="name">
						</div>
	               </div>
	               <div class="modal-footer" style="text-align:center">
	                  <button id="findbtn"type="button"class="btn btn-success" data-dismiss="modal">확인</button>
	               </div>
	            </div>
	         </div>
	     </div>
	     <div id="failpasswordModal" class="modal fade" role="dialog" >
	         <div class="modal-dialog modal-sm" role="document">
	            <div class="modal-content">
	               <div class="modal-header">
	                  <button type="button" class="close" data-dismiss="modal">&times;</button>
	               </div>
	               <div class="modal-body">
		               <div id="modalmessage" style="color:ff0000">some msg</div>
	               </div>
	               <div class="modal-footer" style="text-align:center">
	                  <button id="findbtn"type="button"class="btn btn-success" data-dismiss="modal">확인</button>
	               </div>
	            </div>
	         </div>
	     </div>
		</form>
		
</body>
</html>