<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Register</title>
</head>
<body>
	<form class="memberinput_form" name="memberinput_form" 
	action="memberInsert" method="POST"role="form" data-parsley-validate="true"enctype="multipart/form-data">
		<div class="container col-sm-offset-4 col-sm-4" align="center">
			<div class="row" style="margin-top:50px">
				  <div align="center" style="font-size: 50px">Member Register</div>
			</div>
			<div class="row" style="margin-top:10px">
				  <a href=#><img title="클릭후 이미지 변경"alt="클릭후 이미지 변경"class="img-circle"style="WIDTH: 30%; border:1px solid"
				  id="image"name="image"src="resources/images/noimage.jpg"></a>
			</div>
			<div class="row">
				<input type="file" id="photo"name="imgfile"
				style="visibility:hidden;">
			</div>
			<div class="row" style="margin-top:10px">
		  	  <div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-envelope" aria-hidden="true"></i>&nbsp E-mail &nbsp&nbsp&nbsp</span>
			    <input id="email" type="email" required="true" data-parsley-error-message="E-mail 형식에 맞게 입력해 주세요." data-parsley-errors-container="div[id='emailError']" class="form-control" name="email" placeholder="Email">
			    <input type="hidden" name="confirmchk" id="confirmchk" value="no">
			    <div class="input-group-btn">
			      <button id="confirm" class="btn btn-default" type="button">중복검사</button>
			    </div>
			  </div>
			</div>
			<div class="row">
				<div id="emailError" style="color:#f00"></div>
			</div>
			<div class="row" style="margin-top:10px">
		  	  <div class="input-group">
			    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i>&nbsp 비밀번호</span>
			    <input id="password" type="password" required="true" data-parsley-error-message="비밀번호를 입력해 주세요." data-parsley-errors-container="div[id='passwordError']" class="form-control" name="password" placeholder="Password">
			  </div>
			</div>
			<div class="row">
				<div id="passwordError" style="color:#f00"></div>
			</div>
			<div class="row" style="margin-top:10px">
		  		<div class="input-group">
				    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i>&nbsp 이&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp름</span>
				    <input id="name" type="text" required="true" data-parsley-error-message="이름을 입력해 주세요." data-parsley-errors-container="div[id='nameError']" class="form-control" name="name">
			  	</div>
			</div>
			<div class="row">
				<div id="nameError" style="color:#f00"></div>
			</div>
			<div class="row input-group" style="margin-top:10px">
			    <span class="input-group-addon"><i class="fa fa-phone" aria-hidden="true"></i>&nbsp&nbsp&nbsp전화번호</span>
			    <select id="phone1" name="phone1" class="form-control" style="width:30%"> 
			    	<option value="010" selected>010</option>
			    	<option value="001">001</option> 
			    	<option value="011">011</option> 
			    	<option value="018">018</option> 
			    	<option value="019">019</option> 
			    </select>
			    <input id="phone2" numberonly="true" style="width:70%"type="text" maxlength="4" data-parsley-type="number" required="true" 
			    onkeyup="phone2_lengthchk(this)"
			    data-parsley-error-message="전화번호 앞자리를 입력해 주세요." data-parsley-errors-container="div[id='phoneError']" class="form-control" name="phone2" placeholder="전화번호1">
			    <span class="input-group-addon">-</span>
			    <input id="phone3" numberonly="true" type="text" maxlength="4" data-parsley-type="number" required="true"
			    data-parsley-error-message="전화번호 뒷자리를 입력해 주세요." data-parsley-errors-container="div[id='phoneError']" class="form-control" name="phone3" placeholder="전화번호2">
			</div>
			<div class="row">
				<div id="phoneError" style="color:#f00"></div>
			</div>
			<div class="row" style="margin-top:10px">
			  	<button type="button" id="membersave" class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i>&nbsp저&nbsp&nbsp&nbsp&nbsp&nbsp장</button>
			  	<button type="reset" id="memberreset"class="btn btn-primary"><i class="fa fa-eraser" aria-hidden="true"></i>&nbsp초&nbsp기&nbsp화</button>
			  	<button type="button" onclick="javascript:location.href='index';" class="btn btn-primary"><i class="fa fa-reply" aria-hidden="true"></i>&nbsp돌아가기</button>
			</div>
		</div>
		<div id="myModal" class="modal fade" role="dialog">
	         <div class="modal-dialog modal-sm" role="document">
	            <div class="modal-content">
	               <div class="modal-header">
	                  <button type="button" class="close" data-dismiss="modal">&times;</button>
	                  <h4 class="modal-title">E-mail Check</h4>
	               </div>
	               <div class="modal-body">
	               	<p><span id="modalmsg"> Some text in modal</span>
	               </div>
	               <div class="modal-footer" style="text-align:center">
	                  <button type="button" id="usebtn" class="btn btn-success" data-dismiss="modal">확인</button>
	               </div>
	            </div>
	         </div>
	     </div>
	</form>
</body>
</html>