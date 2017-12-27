<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form class="boardinput_form" name=
\ oardinput_form" method="post"
		action="boardReplyInsert" role="form" enctype="multipart/form-data">
		<div class="container col-sm-offset-4 col-sm-4" align="center">
			<div class="row" style="margin-top:50px">
				  <div align="center" style="font-size: 50px"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>댓글</div>
				  <input type="hidden" name="b_ref" value="${board.b_ref}">
			</div>
			<div class="row" style="margin-top:10px">
		  	  <div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-envelope" aria-hidden="true"></i>&nbsp E-mail &nbsp&nbsp&nbsp</span>
			    <input id="b_email" type="email" value="${sessionemail}" readonly="readonly" class="form-control" name="b_email">
			  </div>
			</div>
			<div class="row" style="margin-top:10px">
		  		<div class="input-group">
				    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i>&nbsp 이&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp름</span>
				    <input id="b_name" type="text" value="${sessionname}" readonly="readonly"class="form-control" name="b_name">
				    <input type="hidden" value="${sessionpassword}" name="b_password">
			  	</div>
			</div>
			<div class="row" style="margin-top:10px">
		  		<div class="input-group">
				    <span class="input-group-addon"><i class="fa fa-flag-checkered" aria-hidden="true"></i>&nbsp 제&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp목</span>
				    <input id="b_title" type="text" class="form-control" name="b_title" readonly="readonly"value="[답글]${board.b_title}">
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
				    <textarea id="b_content" name="b_content" class="col-sm-12 form-control" >[답글]&#10;-------------------------------------------------------------------------------&#10;${board.b_content}</textarea>
			  	</div>
			</div>
			<div class="row" style="margin-top:10px">
			  	<button class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i>&nbsp저&nbsp&nbsp&nbsp&nbsp&nbsp장</button>
			  	<button type="button" onclick="javascript:location.href='boardPageList?find';" class="btn btn-primary"><i class="fa fa-reply" aria-hidden="true"></i>&nbsp돌아가기</button>
			</div>
		</div>
	</form>

</body>
</html>