<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<content tag="local_script">
<script>
var date = new Date();
var year = date.getFullYear();
var month = date.getMonth()+1;
$(document).ready(function(){
	$('#yyyy').attr('value',year);
	$('#mm').val(month).prop("selected",true);
});

</script>
</content>
</head>
<body>
	<form class="salarytaxform" method="post" data-parsley-validate="true">
		<div class="container col-sm-offset-4 col-sm-4" align="center">
			<div class="row" style="margin-top:20px">
				  <div align="center" style="font-size: 50px"><i class="fa fa-sign-in" aria-hidden="true"></i>급여 계산</div>
			</div>
			<div class="row" style="margin-top:30px">
		  	  	<div class="input-group">
				    <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i>&nbsp 처리년도</span>
				    <input id="yyyy" name="yyyy" type="text" required="true" numberonly="true"maxlength="4"data-parsley-error-message="정확한 년도를 입력해 주세요." data-parsley-errors-container="div[id='yyyyError']"class="form-control" placeholder="ex)2017">
			 	</div>
			</div>
			<div class="row">
				<div id="yyyyError" style="color:#f00"></div>
			</div>
			<div class="row" style="margin-top:30px">
		  	  	<div class="input-group">
				    <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i>&nbsp 처&nbsp&nbsp리&nbsp&nbsp월</span>
				    <select id="mm" name="mm" class="form-control" required="required"> 
			    	<option value="1" selected>1</option>
			    	<option value="2">2</option> 
			    	<option value="3">3</option> 
			    	<option value="4">4</option> 
			    	<option value="5">5</option> 
			    	<option value="6">6</option> 
			    	<option value="7">7</option> 
			    	<option value="8">8</option> 
			    	<option value="9">9</option> 
			    	<option value="10">10</option> 
			    	<option value="11">11</option> 
			    	<option value="12">12</option> 
			    </select>
			 	</div>
			</div>
			<div class="row">
				<div id="mmError" style="color:#f00"></div>
			</div>
			<div class="row" style="margin-top:30px">
			  	<button type="button" id="salarytaxbtn" class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i>&nbsp계&nbsp&nbsp&nbsp&nbsp&nbsp산</button>
			  	<button type="button" id="salarytaxdeletebtn" class="btn btn-primary"><i class="fa fa-trash-o" aria-hidden="true"></i>&nbsp삭&nbsp&nbsp&nbsp&nbsp&nbsp제</button>
			  	<button type="button" onclick="javascript:location.href='index';" class="btn btn-primary"><i class="fa fa-reply" aria-hidden="true"></i>&nbsp돌아가기</button>
			</div>
		</div>
		<div id="salaryTaxModal" class="modal fade" role="dialog">
	         <div class="modal-dialog modal-sm" role="document">
	            <div class="modal-content">
	               <div class="modal-header">
	                  <button type="button" class="close" data-dismiss="modal">&times;</button>
	               </div>
	               <div class="modal-body">
	               	<p><span id="taxmodalmsg"> Some text in modal</span>
	               	<p><span id="taxmodalmsg2"> Some text in modal</span>
	               </div>
	               <div class="modal-footer" style="text-align:center">
	                  <button type="button" id="salarytaxusebtn" class="btn btn-success" data-dismiss="modal">확인</button>
	                  <button type="button" id="cancelbtn" class="btn btn-success" data-dismiss="modal">취소</button>
	               </div>
	            </div>
	         </div>
	     </div>
	</form>

</body>
</html>