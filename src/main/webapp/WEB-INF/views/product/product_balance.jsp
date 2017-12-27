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
<form class="productbalance_form" method="post" data-parsley-validate="true">
	<div class="container col-sm-offset-1 col-sm-10" align="center">
		<div class="row" style="margin-top:20px">
			  <div align="center" style="font-size: 50px"><i class="fa fa-sign-in" aria-hidden="true"></i>거래 현황</div>
		</div>
		<div style="margin-top:40px">
				<table id="example" class="table table-striped table-bordered" cellspacing="0">
		        <thead>
		            <tr>
		                <th>거래년도</th>
		                <th>/</th>
		                <th>거래처명</th>
		                <th>전년이월잔액</th>
						<th>1월</th>
						<th>2월</th>
						<th>3월</th>
						<th>4월</th>
						<th>5월</th>
						<th>6월</th>
						<th>7월</th>
						<th>8월</th>
						<th>9월</th>
						<th>10월</th>
						<th>11월</th>
						<th>12월</th>
						<th>현재잔액</th>
		            </tr>
		        </thead>
		        <tbody>
		        	<c:forEach var="balance" items="${balances}">
						<tr>
							<td class="text-center">${balance.yyyy}</td>
							<td class="text-center" style="vertical-align:middle;">
								<div class="bg-primary text-white">월별잔액</div>
								<div class="bg-success text-white">거래금액</div>
								<div class="bg-info text-white">지불금액</div>
							</td>
							<td class="text-center"><a href="balanceDetail?yyyy=${balance.yyyy}&vendcode=${balance.vendcode}">${balance.vendname}</a></td>
							<td class="text-center">${balance.preyybalance}</td>
							<td class="text-center">${balance.balance01}<br>${balance.deal01}<br>${balance.pay01}</td>
							<td class="text-center">${balance.balance02}<br>${balance.deal02}<br>${balance.pay02}</td>
							<td class="text-center">${balance.balance03}<br>${balance.deal03}<br>${balance.pay03}</td>
							<td class="text-center">${balance.balance04}<br>${balance.deal04}<br>${balance.pay04}</td>
							<td class="text-center">${balance.balance05}<br>${balance.deal05}<br>${balance.pay05}</td>
							<td class="text-center">${balance.balance06}<br>${balance.deal06}<br>${balance.pay06}</td>
							<td class="text-center">${balance.balance07}<br>${balance.deal07}<br>${balance.pay07}</td>
							<td class="text-center">${balance.balance08}<br>${balance.deal08}<br>${balance.pay08}</td>
							<td class="text-center">${balance.balance09}<br>${balance.deal09}<br>${balance.pay09}</td>
							<td class="text-center">${balance.balance10}<br>${balance.deal10}<br>${balance.pay10}</td>
							<td class="text-center">${balance.balance11}<br>${balance.deal11}<br>${balance.pay11}</td>
							<td class="text-center">${balance.balance12}<br>${balance.deal12}<br>${balance.pay12}</td>
							<td class="text-center">${balance.balance}</td>
						</tr>
					</c:forEach>
		        </tbody>
		    </table>
		</div>
    </div>
</form>
</body>
</html>