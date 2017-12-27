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
var date = new Date();
var year = date.getFullYear();
var month = date.getMonth()+1;
$(document).ready(function(){
	$('#yyyy').attr('value',year);
	$('#mm').val(month).prop("selected",true);
});

</script>
</content>
<body>
<form class="salaryTaxlistform" action="salaryTaxList" method="get">
	<div class="container col-sm-offset-1 col-sm-10" align="center">
		<div class="row" style="margin-top:20px">
			  <div align="center" style="font-size: 50px"><i class="fa fa-sign-in" aria-hidden="true"></i>근로소득 간이세액표</div>
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
		<div style="margin-top:40px">
				<table id="salarytaxexample" class="table table-striped table-bordered" cellspacing="0" width="100%">
		        <thead>
		            <tr>
		                <th>date</th>
		                <th>사원번호</th>
		                <th>부서</th>
		                <th>성명</th>
						<th>연간 총급여액</th>
						<th>근로소득공제</th>
						<th>근로소득금액</th>
						<th>인적공제</th>
						<th>연금보험료공제</th>
						<th>특별소득공제</th>
						<th>과세표준</th>
						<th>산출세액</th>
						<th>근로소득세액공제</th>
						<th>결정세액</th>
						<th>간이세액</th>
		            </tr>
		        </thead>
		        <tbody>
		        	<c:forEach var="roll" items="${rolls}">
						<tr>
							<td class="text-center">${roll.yyyy}-${roll.mm}</td>
							<td class="text-center"><a href="salaryTaxDetail?yyyy=${roll.yyyy}&mm=${roll.mm}&empno=${roll.empno}">${roll.empno}</a></td>
							<td class="text-center">${roll.depart}</td>
							<td class="text-center">${roll.name}</td>
							<td class="text-center">${roll.pay12}</td>
							<td class="text-center">${roll.incomededuction}</td>
							<td class="text-center">${roll.incomeamount}</td>
							<td class="text-center">${roll.personaldeduction}</td>
							<td class="text-center">${roll.annuityinsurance}</td>
							<td class="text-center">${roll.specialdeduction}</td>
							<td class="text-center">${roll.standardamount}</td>
							<td class="text-center">${roll.calculatedtax}</td>
							<td class="text-center">${roll.incometaxdeduction}</td>
							<td class="text-center">${roll.decidetax}</td>
							<td class="text-center">${roll.simpletax}</td>
						</tr>
					</c:forEach>
		        </tbody>
		    </table>
		</div>
	</div>
</form>

</body>
</html>