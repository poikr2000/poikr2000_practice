<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">
<script src="resources/js/jquery-1.12.4.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#example').DataTable({
    	"order":[[0,"desc"]]
    });
} );
</script>
<title>Insert title here</title>

</head>
<body>
	<form action="">
		<div class="container col-sm-offset-2 col-sm-8" align="center">
			<div class="row" style="margin-top:20px">
				  <div align="center" style="font-size: 50px"><i class="fa fa-sign-in" aria-hidden="true"></i>게시판</div>
			</div>
			<div style="margin-top:40px">
					<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
			        <thead>
			            <tr>
			                <th>글번호</th>
							<th>E-mail</th>
							<th>작성자</th>
							<th>제목</th>
							<th>첨부</th>
							<th>작성일</th>
							<th>조회수</th>
			            </tr>
			        </thead>
			        <tbody>
			        	<c:forEach var="boards" items="${boards}">
							<tr>
								<td class="text-center">${boards.b_ref}</td>
								<td>${boards.b_email}</td>
								<td class="text-center">${boards.b_name}</td>
								<td><a href="boardDetail?b_seq=${boards.b_seq}&b_email=${boards.b_email}"><c:if test="${boards.b_step==1}"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i></c:if>${boards.b_title}</a></td>
								<td class="text-center">
								<c:if test="${!empty boards.b_attach}"><a href="boardDownload?b_attach=${boards.b_attach}"><i class="fa fa-file" aria-hidden="true"></i></a></c:if>
								</td>
								<td>${boards.b_date}</td>
								<td class="text-center">${boards.b_hit}</td>
							</tr>
						</c:forEach>
			        </tbody>
			    </table>
			</div>
		</div>
	</form>
</body>
</html>