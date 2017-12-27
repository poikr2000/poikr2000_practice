<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<form class="memberlist_form" name="memberlist_form" method="POST" action="memberDelete">
		<input type="hidden" name="email" value="testemail">
		<div class="container col-sm-offset-3 col-sm-6" align="center">
			<div class="row" style="margin-top:50px">
				  <div align="center" style="font-size: 50px">Member List 접속 : (${sessionname})</div>
			</div>
			<table class="table table-striped table-bordered" id="example">
				<thead>
					<tr style="text-align:center;">
						<th>image</th>
						<th>E-mail</th>
						<th>name</th>
						<th>전화번호</th>
						<th>Option</th>
					</tr>
				</thead>
				<c:if test="${fn:length(members)==0}">
					<tfoot>
						<tr>
							<td colspan="5" style="text-align:center">현재 데이터가 없습니다.</td>
						</tr>
					</tfoot>
				</c:if>
				<tbody>
					<c:forEach var="member" items="${members}">
						<tr>
							<td><img src="${member.photo}" width="50" height="50"></td>
							<td style="text-align:left;vertical-align:middle;"><a href="memberDetail?email=${member.email}">${member.email}</a></td>
							<td style="text-align:left;vertical-align:middle;">${member.name}</td>
							<td style="text-align:left;vertical-align:middle;">${member.phone1}-${member.phone2}-${member.phone3}</td>
							<td style="text-align:left;vertical-align:middle;"><button type="button" id="deletebtn" class="btn btn-default" value="${member.email}"><i class="fa fa-trash-o" aria-hidden="true"></i>&nbspDelete</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="row" style="margin-top:10px">
			  	<button type="button" id="membersave" class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i>&nbsp저&nbsp&nbsp&nbsp&nbsp&nbsp장</button>
			  	<button type="button" onclick="javascript:location.href='index';" class="btn btn-primary"><i class="fa fa-reply" aria-hidden="true"></i>&nbsp돌아가기</button>
			</div>
		</div>
		<div id="deleteModal" class="modal fade" role="dialog">
	         <div class="modal-dialog modal-sm" role="document">
	            <div class="modal-content">
	               <div class="modal-header">
	                  <button type="button" class="close" data-dismiss="modal">&times;</button>
	               </div>
	               <div class="modal-body">
	               	<p><span id="modalmsg"> Some text in modal</span>
	               </div>
	               <div class="modal-footer" style="text-align:center">
	                  <button type="button" id="delbtn" class="btn btn-success" data-dismiss="modal">삭제</button>
	                  <button type="button" id="usebtn" class="btn btn-success" data-dismiss="modal">취소</button>
	               </div>
	            </div>
	         </div>
	     </div>
	</form>
</body>
</html>