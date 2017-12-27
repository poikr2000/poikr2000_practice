<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<content tag="local_script">
<script>
$(document).ready(function(){
	
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	var day= date.getDate();
	$('#yyyy').attr('value',year);
	$('#mm').val(month).prop("selected",true);
	$('#dd').val(day).prop("selected",true);
	$('#salestatementmmbtn').click(function(){
		$('.salestatement_form').attr('action','saleStatementMm');
		$('.salestatement_form').submit();
	});
	$('#salestatementddbtn').click(function(){
		$('.salestatement_form').attr('action','saleStatementDd');
		$('.salestatement_form').submit();
	});
});
</script>
</content>
<body>
<form class="salestatement_form" name="salestatement_form" method="post"role="form">
	<div class="container col-sm-offset-4 col-sm-4" align="center">
		<div class="row" style="margin-top:20px">
			  <div align="center" style="font-size: 50px"><i class="fa fa-sign-in" aria-hidden="true"></i>매출장</div>
		</div>
		<div class="row" style="margin-top:10px">
	  	  	<div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i>&nbsp 년</span>
			    <input type="text" id="yyyy" name="yyyy" class="form-control" placeholder="yyyy">
		 	 </div>
		</div>
		<div class="row" style="margin-top:10px">
	  	  	<div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i>&nbsp 월</span>
			    <select id="mm" name="mm" class="form-control" style="width: 100%"> 
					<c:forEach var="i" begin="1" end="12" step="1">
						<option value="${i}">${i}</option>
					</c:forEach>
			    </select>
		 	 </div>
		</div>
		<div class="row" style="margin-top:10px">
	  	  	<div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i>&nbsp 일</span>
			    <select id="dd" name="dd" class="form-control" style="width: 100%"> 
					<c:forEach var="i" begin="1" end="31" step="1">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>
		 	 </div>
		</div>
		<div class="row" style="margin-top:30px">
		  	<button type="button" id="salestatementmmbtn" class="btn btn-primary"><i class="fa fa-calendar-times-o" aria-hidden="true"></i>&nbsp월매출장</button>
		  	<button type="button" id="salestatementddbtn" class="btn btn-primary"><i class="fa fa-calendar-check-o" aria-hidden="true"></i>&nbsp일매출장</button>
		  	<button type="button" onclick="javascript:location.href='index';" class="btn btn-primary"><i class="fa fa-reply" aria-hidden="true"></i>&nbsp돌아가기</button>
		</div>
	</div>
</form>
</body>
</html>