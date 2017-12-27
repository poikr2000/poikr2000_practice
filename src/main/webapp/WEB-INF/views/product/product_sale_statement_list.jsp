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
<form class="salestatementlist_form" name="salestatementlist_form" method="post"role="form">
	<div class="container col-sm-offset-3 col-sm-6" align="center">
		<div class="row" style="margin-top:20px">
			  <div align="center" style="font-size: 50px"><i class="fa fa-sign-in" aria-hidden="true"></i>${yyyy}년 ${mm}월 <c:if test="${dd !=null}">${dd}일</c:if> 매출장</div>
		</div>
		<div class="row" style="margin-top:10px">
			<table class="table table-striped table-bordered" cellspacing="0"  width="100%" >
		        <thead>
		            <tr>
		                <th>날짜</th>
		                <th>거래처</th>
		                <th>품명</th>
		                <th>단가</th>
						<th>수량</th>
						<th>금액</th>
		            </tr>
		        </thead>
		        <tbody>
		        	<c:forEach var="sales" items="${sales}">
		        		<c:choose>
		        			<c:when test="${sales.no!=0 &&sales.hang==0 && sales.vendcode !=null}">
		        				<tr>
				        			<td class="text-center"></td>
				        			<td class="text-center"></td>
				        			<td class="text-center"></td>
				        			<td class="text-center bg-info text-white">소계</td>
				        			<td class="text-center"></td>
				        			<td class="text-center bg-info text-white">${sales.total}</td>
								</tr>
		        			</c:when>
		        			<c:when test="${sales.no==0 &&sales.hang==0 && sales.vendcode !=null}">
		        				<tr>
				        			<td class="text-center"></td>
				        			<td class="text-center"></td>
				        			<td class="text-center"></td>
				        			<td class="text-center bg-danger text-white">거래처소계</td>
				        			<td class="text-center"></td>
				        			<td class="text-center bg-danger text-white">${sales.total}</td>
								</tr>
		        			</c:when>
		        			<c:when test="${sales.no==0 &&sales.hang==0 && sales.vendcode ==null && sales.dd !=null}">
		        				<tr>
				        			<td class="text-center"></td>
				        			<td class="text-center"></td>
				        			<td class="text-center"></td>
				        			<td class="text-center bg-success text-white">일총계</td>
				        			<td class="text-center"></td>
				        			<td class="text-center bg-success text-white">${sales.total}</td>
								</tr>
		        			</c:when>
		        			<c:when test="${sales.no==0 &&sales.hang==0 && sales.vendcode ==null && sales.dd ==null}">
		        				<tr>
				        			<td class="text-center"></td>
				        			<td class="text-center"></td>
				        			<td class="text-center"></td>
				        			<td class="text-center bg-primary text-white">월총계</td>
				        			<td class="text-center"></td>
				        			<td class="text-center bg-primary text-white">${sales.total}</td>
								</tr>
		        			</c:when>
		        			<c:otherwise>
		        				<tr>
				        			<td class="text-center">${sales.yyyy}-${sales.mm}-${sales.dd}-${sales.no}-${sales.hang}</td>
				        			<td class="text-center">${sales.vendname}</td>
				        			<td class="text-center">${sales.proname}</td>
				        			<td class="text-center">${sales.price}</td>
				        			<td class="text-center">${sales.qty}</td>
				        			<td class="text-center">${sales.total}</td>
								</tr>
		        			</c:otherwise>
		        		</c:choose>
					</c:forEach>
		        </tbody>
		    </table>
		</div>
		<div class="row" style="margin-top:10px">
		  	<button type="button" onclick="javascript:history.back();" class="btn btn-primary"><i class="fa fa-reply" aria-hidden="true"></i>&nbsp돌아가기</button>
		</div>
	</div>
</form>
</body>
</html>