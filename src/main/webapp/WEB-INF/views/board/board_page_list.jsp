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
<form action="boardPageList" method="get">
	<div class="container col-sm-offset-2 col-sm-8" align="center">
			<div class="row" style="margin-top:20px">
				  <div align="center" style="font-size: 50px"><i class="fa fa-sign-in" aria-hidden="true"></i>게시판</div>
			</div>
			<div style="margin-top:40px">
				<table class="table table-striped table-bordered" id="example">
				<thead>
					<tr style="text-align:center;">
						<th class="col-sm-1">글번호</th>
						<th class="col-sm-2">E-mail</th>
						<th class="col-sm-1">작성자</th>
						<th class="col-sm-4">제목</th>
						<th class="col-sm-1">첨부</th>
						<th class="col-sm-2">작성일</th>
						<th class="col-sm-1">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="boards" items="${boards}">
						<tr>
							<td class="text-center">${boards.b_seq}</td>
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
			<div class="row" style="margin-top:10px">
				 <c:forEach var="page" items="${pages}">
				 	<span><a href="boardPageSelect?page=${page}&find=${find}">[${page}]</a></span>
				 </c:forEach>
			</div>
			<div class="row" style="margin-top:15px">
				<input type="text" id="find"name="find" style="size: 20">
			  	<button type="submit" class="btn btn-primary"><i class="fa fa-search" aria-hidden="true"></i>&nbsp검&nbsp&nbsp&nbsp&nbsp색</button>
			  	<c:choose>
		       		<c:when test="${sessionemail eq null}">
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-primary" onclick="location.href='board_insert'"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp글쓰기</button>
					</c:otherwise>
				</c:choose>	
			</div>
	</div>
</form>
</body>
</html>