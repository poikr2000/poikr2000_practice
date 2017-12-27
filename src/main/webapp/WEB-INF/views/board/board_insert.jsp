<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form class="boardinput_form" name="boardinput_form" 
		action="boardInsert" method="POST"role="form" data-parsley-validate="true"enctype="multipart/form-data">
		<div class="container col-sm-offset-4 col-sm-4" align="center">
			<div class="row" style="margin-top:50px">
				  <div align="center" style="font-size: 50px"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>게시판</div>
			</div>
			<div class="row" style="margin-top:10px">
		  	  <div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-envelope" aria-hidden="true"></i>&nbsp E-mail &nbsp&nbsp&nbsp</span>
			    <input id="b_email" type="email" value="${member.email}" readonly="readonly" class="form-control" name="b_email">
			    <input type="hidden" id="b_password" name="b_password" value="${member.password}">
			  </div>
			</div>
			<div class="row" style="margin-top:10px">
		  		<div class="input-group">
				    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i>&nbsp 이&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp름</span>
				    <input id="b_name" type="text" value="${member.name}" readonly="readonly"class="form-control" name="b_name">
			  	</div>
			</div>
			<div class="row" style="margin-top:10px">
		  		<div class="input-group">
				    <span class="input-group-addon"><i class="fa fa-flag-checkered" aria-hidden="true"></i>&nbsp 제&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp목</span>
				    <input id="b_title" type="text" required="true" autofocus="autofocus" data-parsley-error-message="제목을 입력해 주세요." data-parsley-errors-container="div[id='titleError']"class="form-control" name="b_title">
			  	</div>
			</div>
			<div class="row">
					<div id="titleError" style="color:#f00"></div>
				</div>
			<div class="row" style="margin-top:10px">
		  		<div class="input-group">
				    <span class="input-group-addon"><i class="fa fa-paperclip" aria-hidden="true"></i>&nbsp 첨부파일</span>
				    <input id="b_attach" name="file"type="file" class="filestyle" data-buttonBefore="true">
			  	</div>
			</div>
			<div class="row" style="margin-top:10px">
		  		<div class="input-group">
				    <span class="input-group-addon"><i class="fa fa-comments" aria-hidden="true"></i>&nbsp 내&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp용</span>
				    <textarea id="b_content" name="b_content" class="col-sm-12 form-control" ></textarea>
			  	</div>
			</div>
			<div class="row" style="margin-top:10px">
			  	<button class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i>&nbsp저&nbsp&nbsp&nbsp&nbsp&nbsp장</button>
			  	<button type="reset" id=""class="btn btn-primary"><i class="fa fa-eraser" aria-hidden="true"></i>&nbsp초&nbsp기&nbsp화</button>
			  	<button type="button" onclick="javascript:location.href='index';" class="btn btn-primary"><i class="fa fa-reply" aria-hidden="true"></i>&nbsp돌아가기</button>
			</div>
		</div>
	</form>

</body>
</html>