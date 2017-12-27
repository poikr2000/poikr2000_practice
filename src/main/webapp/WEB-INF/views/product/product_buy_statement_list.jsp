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
<form class="buystatement_form" name="buystatement_form" method="post"role="form">
	<div class="container col-sm-offset-3 col-sm-6" align="center">
		<div class="row" style="margin-top:20px">
			  <div align="center" style="font-size: 50px"><i class="fa fa-sign-in" aria-hidden="true"></i>${yyyy}년 ${mm}월 <c:if test="${dd !=null}">${dd}일</c:if> 매입장</div>
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
		        	<c:forEach var="buys" items="${buys}">
		        		<c:choose>
		        			<c:when test="${buys.no!=0 &&buys.hang==0 && buys.vendcode !=null}">
		        				<tr>
				        			<td class="text-center"></td>
				        			<td class="text-center"></td>
				        			<td class="text-center"></td>
				        			<td class="text-center bg-info text-white">소계</td>
				        			<td class="text-center"></td>
				        			<td class="text-center bg-info text-white">${buys.total}</td>
								</tr>
		        			</c:when>
		        			<c:when test="${buys.no==0 &&buys.hang==0 && buys.vendcode !=null}">
		        				<tr>
				        			<td class="text-center"></td>
				        			<td class="text-center"></td>
				        			<td class="text-center"></td>
				        			<td class="text-center bg-danger text-white">거래처소계</td>
				        			<td class="text-center"></td>
				        			<td class="text-center bg-danger text-white">${buys.total}</td>
								</tr>
		        			</c:when>
		        			<c:when test="${buys.no==0 &&buys.hang==0 && buys.vendcode ==null && buys.dd !=null}">
		        				<tr>
				        			<td class="text-center"></td>
				        			<td class="text-center"></td>
				        			<td class="text-center"></td>
				        			<td class="text-center bg-success text-white">일총계</td>
				        			<td class="text-center"></td>
				        			<td class="text-center bg-success text-white">${buys.total}</td>
								</tr>
		        			</c:when>
		        			<c:when test="${buys.no==0 &&buys.hang==0 && buys.vendcode ==null && buys.dd ==null}">
		        				<tr>
				        			<td class="text-center"></td>
				        			<td class="text-center"></td>
				        			<td class="text-center"></td>
				        			<td class="text-center bg-primary text-white">월총계</td>
				        			<td class="text-center"></td>
				        			<td class="text-center bg-primary text-white">${buys.total}</td>
								</tr>
		        			</c:when>
		        			<c:otherwise>
		        				<tr>
				        			<td class="text-center">${buys.yyyy}-${buys.mm}-${buys.dd}-${buys.no}-${buys.hang}</td>
				        			<td class="text-center">${buys.vendname}</td>
				        			<td class="text-center">${buys.proname}</td>
				        			<td class="text-center">${buys.price}</td>
				        			<td class="text-center">${buys.qty}</td>
				        			<td class="text-center">${buys.total}</td>
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