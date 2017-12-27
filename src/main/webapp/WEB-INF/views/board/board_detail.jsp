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
	<form class="boardDetail_form" action="boardUpdate" name="boardDetail_form" method="post" enctype="multipart/form-data">
		<div class="container col-sm-offset-4 col-sm-4" align="center">
			<div class="row" style="margin-top: 50px">
				<div align="center" style="font-size: 50px">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp${board.b_seq}번 게시글
				</div>
			</div>
			<div class="row" style="margin-top: 10px">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-envelope"
						aria-hidden="true"></i>&nbsp E-mail &nbsp&nbsp&nbsp</span> 
					<input id="b_email" type="email" value="${board.b_email}" readonly="readonly" class="form-control" name="b_email"> 
					<input type="hidden" id="boardb_seq" name="b_seq" value="${board.b_seq}">
				</div>
			</div>
			<div class="row" style="margin-top: 10px">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-user"></i>&nbsp
						이&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp름</span> <input id="b_name"
						type="text" value="${board.b_name}" readonly="readonly"
						class="form-control" name="b_name">
				</div>
			</div>
			<div class="row" style="margin-top: 10px">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="fa fa-flag-checkered" aria-hidden="true"></i>&nbsp
						제&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp목</span> 
					<input id="b_title"type="text" required="true" autofocus="autofocus"
						data-parsley-error-message="제목을 입력해 주세요."
						data-parsley-errors-container="div[id='titleError']"
						class="form-control" name="b_title" value="${board.b_title}">
				</div>
			</div>
			<div class="row">
				<div id="titleError" style="color: #f00"></div>
			</div>
			<div class="row" style="margin-top: 10px">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-paperclip"aria-hidden="true"></i>&nbsp 첨부파일</span> 
					<input type="file" name="file">
				</div>
			</div>
			
			<div class="row" style="margin-top: 10px">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-comments"
						aria-hidden="true"></i>&nbsp 내&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp용</span>
					<textarea id="b_content" name="b_content"
						class="col-sm-12 form-control">${board.b_content}</textarea>
				</div>
			</div>
			<div class="row" style="margin-top:10px">
				<c:if test="${sessionemail eq board.b_email||sessionemail eq 'admin@admin.com'}">
	       			<button class="btn btn-primary"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp글수정</button>
	       			<button type="button" id="boardDeleteBtn" class="btn btn-primary"><i class="fa fa-trash-o" aria-hidden="true"></i>&nbsp삭&nbsp&nbsp제</button>
				</c:if>
				<c:if test="${sessionlevel le 3}">
					<button type="button" onclick="javascript:location.href='boardReplyForm?b_seq=${board.b_seq}';"class="btn btn-primary"><i class="fa fa-trash-o" aria-hidden="true"></i>&nbsp답&nbsp&nbsp글</button>
				</c:if>
				<button type="button" onclick="javascript:location.href='boardPageList?find';" class="btn btn-primary"><i class="fa fa-reply" aria-hidden="true"></i>&nbsp돌아가기</button>
			</div>
		</div>
		<div id="boardDeleteModal" class="modal fade" role="dialog">
	         <div class="modal-dialog modal-sm" role="document">
	            <div class="modal-content">
	               <div class="modal-header">
	                  <button type="button" class="close" data-dismiss="modal">&times;</button>
	               </div>
	               <div class="modal-body">
	               	<p><span id="boardmodalmsg"> Some text in modal</span>
	               </div>
	               <div class="modal-footer" style="text-align:center">
	                  <button type="button" id="boardModalDeleteBtn"class="btn btn-success" data-dismiss="modal">삭제</button>
	                  <button type="button" class="btn btn-success" data-dismiss="modal">취소</button>
	               </div>
	            </div>
	         </div>
	     </div>
	</form>
</body>
</html>