<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form class="salarytaxdetail_form" name="salarytaxdetail_form" 
	action="" method=""role="form">
	<div class="container col-sm-offset-3 col-sm-6" align="center">
		<div class="row" style="margin-top:20px">
			  <div align="center" style="font-size: 50px"><i class="fa fa-sign-in" aria-hidden="true"></i>${roll.yyyy}년 ${roll.mm}월 ${roll.name} 세액정보</div>
		</div>
		<div class="row" style="margin-top:10px">
	  	  <div class="input-group">
		    <span class="input-group-addon"><i class="fa fa-id-card" aria-hidden="true"></i>&nbsp 사원번호</span>
		    <input id="empno" name="empno" type="text"class="form-control" value="${roll.empno}">
		  </div>
		</div>
		<div class="row" style="margin-top:10px">
	  	  <div class="input-group">
		    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i>&nbsp 이&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp름</span>
		    <input id="empno" name="empno" type="text"class="form-control" value="${roll.name}">
		  </div>
		</div>
		<div class="row" style="margin-top:10px">
	  	  <div class="input-group">
		    <span class="input-group-addon"><i class="fa fa-building" aria-hidden="true"></i>&nbsp 부&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp서</span>
		    <input id="empno" name="empno" type="text"class="form-control" value="${roll.depart}">
		  </div>
		</div>
		<div class="row" style="margin-top:10px">
	  	  <div class="input-group">
		    <span class="input-group-addon"><i class="fa fa-usd" aria-hidden="true"></i>&nbsp&nbsp 총급여액</span>
		    <input id="empno" name="empno" type="text"class="form-control" value="${roll.pay12}">
		  </div>
		</div>
		<div class="row" style="margin-top:10px">
	  	  <div class="input-group">
		    <span class="input-group-addon">근&nbsp로&nbsp소&nbsp득&nbsp공&nbsp제</span>
		    <input id="empno" name="empno" type="text"class="form-control" value="${roll.incomededuction}">
		    <span class="input-group-addon">근&nbsp로&nbsp소&nbsp득&nbsp금&nbsp액&nbsp&nbsp</span>
		    <input id="empno" name="empno" type="text"class="form-control" value="${roll.incomeamount}">
		  </div>
		</div>
		<div class="row" style="margin-top:10px">
	  	  <div class="input-group">
		    <span class="input-group-addon">인&nbsp&nbsp&nbsp&nbsp적&nbsp&nbsp&nbsp&nbsp공&nbsp&nbsp&nbsp&nbsp제</span>
		    <input id="empno" name="empno" type="text"class="form-control" value="${roll.personaldeduction}">
		    <span class="input-group-addon">연금보험료공제&nbsp&nbsp&nbsp</span>
		    <input id="empno" name="empno" type="text"class="form-control" value="${roll.annuityinsurance}">
		  </div>
		</div>
		<div class="row" style="margin-top:10px">
	  	  <div class="input-group">
		    <span class="input-group-addon">&nbsp특별소득공제등&nbsp</span>
		    <input id="empno" name="empno" type="text"class="form-control" value="${roll.specialdeduction}">
		     <span class="input-group-addon">과&nbsp&nbsp&nbsp&nbsp세&nbsp&nbsp&nbsp&nbsp표&nbsp&nbsp&nbsp&nbsp준&nbsp&nbsp</span>
		    <input id="empno" name="empno" type="text"class="form-control" value="${roll.standardamount}">
		  </div>
		</div>
		<div class="row" style="margin-top:10px">
	  	  <div class="input-group">
		    <span class="input-group-addon">산&nbsp&nbsp&nbsp&nbsp출&nbsp&nbsp&nbsp&nbsp세&nbsp&nbsp&nbsp&nbsp액</span>
		    <input id="empno" name="empno" type="text"class="form-control" value="${roll.calculatedtax}">
		    <span class="input-group-addon">근로소득세액공제</span>
		    <input id="empno" name="empno" type="text"class="form-control" value="${roll.incometaxdeduction}">
		  </div>
		</div>
		<div class="row" style="margin-top:10px">
	  	  <div class="input-group">
		    <span class="input-group-addon">결&nbsp&nbsp&nbsp&nbsp정&nbsp&nbsp&nbsp&nbsp세&nbsp&nbsp&nbsp&nbsp액</span>
		    <input id="empno" name="empno" type="text"class="form-control" value="${roll.decidetax}">
		     <span class="input-group-addon">간&nbsp&nbsp&nbsp&nbsp이&nbsp&nbsp&nbsp&nbsp세&nbsp&nbsp&nbsp&nbsp액&nbsp&nbsp</span>
		    <input id="empno" name="empno" type="text"class="form-control" value="${roll.simpletax}">
		  </div>
		</div>
		<div class="row" style="margin-top:10px">
		  	<button type="button" onclick="javascript:location.href='salaryTaxList?yyyy&mm';" class="btn btn-primary"><i class="fa fa-reply" aria-hidden="true"></i>&nbsp돌아가기</button>
		</div>
	</div>
</form>
</body>
</html>