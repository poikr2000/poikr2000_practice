<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form class="salaryTaxlistform" action="salaryRegister" method="get">
	<div class="container col-sm-offset-1 col-sm-10" align="center">
		<div class="row" style="margin-top:20px">
			  <div align="center" style="font-size: 50px"><i class="fa fa-sign-in" aria-hidden="true"></i>${yyyy}년 ${mm}월 급여 대장</div>
		</div>
		<div class="row" style="margin-top:10px">
		  	  	<div align="center">
				    <input type="text" name="yyyy" id="yyyy"required="true" numberonly="true"maxlength="4"style="width: 100px;">
				    <span>년&nbsp&nbsp</span>
				    <select id="mm" name="mm" style="width: 100px;"> 
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
				    <span>월&nbsp&nbsp</span>
				    <button class="btn btn-default">검색</button>
			 	 </div>
			</div>
		<div style="margin-top:40px" align="center">
			<table id="salaryregisterexample" class="table table-striped table-bordered" cellspacing="0" width="100%">
		        <thead>
		            <tr>
		                <th>처리년월</th>
		                <th>사원번호</th>
		                <th>부서</th>
		                <th>성명</th>
						<th>월급여</th>
						<th>국민연금</th>
						<th>갑근세</th>
						<th>실수령액</th>
		            </tr>
		        </thead>
		        <tbody>
		        	<c:forEach var="register" items="${registers}">
			        	<c:choose>
			        		<c:when test="${register.name==null && register.depart !=null}">
			        			<tr>
									<td class="text-center"></td>
									<td class="text-center"></td>
									<td class="text-center"></td>
									<td class="text-center"><b>소계</b></td>
									<td class="text-center">${register.mmpay}</td>
									<td class="text-center">${register.insurance}</td>
									<td class="text-center">${register.tax}</td>
									<td class="text-center">${register.finalpay}</td>
								</tr>
			        		</c:when>
			        		<c:when test="${register.name==null && register.depart ==null}">
			        			<tr>
									<td class="text-center"></td>
									<td class="text-center"></td>
									<td class="text-center"></td>
									<td class="text-center"><b>총계</b></td>
									<td class="text-center">${register.mmpay}</td>
									<td class="text-center">${register.insurance}</td>
									<td class="text-center">${register.tax}</td>
									<td class="text-center">${register.finalpay}</td>
								</tr>
			        		</c:when>
			        		<c:otherwise>
			        			<tr>
									<td class="text-center">${register.yyyy}-${register.mm}</td>
									<td class="text-center">${register.empno}</td>
									<td class="text-center">${register.depart}</td>
									<td class="text-center">${register.name}</td>
									<td class="text-center">${register.mmpay}</td>
									<td class="text-center">${register.insurance}</td>
									<td class="text-center">${register.tax}</td>
									<td class="text-center">${register.finalpay}</td>
								</tr>
			        		</c:otherwise>
			        	</c:choose>
					</c:forEach>
		        </tbody>
		    </table>
		</div>
	</div>
</form>

</body>
</html>