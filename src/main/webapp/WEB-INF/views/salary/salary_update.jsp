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
	<form class="salaryupdate_form" name="salaryupdate_form" 
	action="salaryUpdate" method="POST"role="form" data-parsley-validate="true">
		<div class="container col-sm-offset-3 col-sm-6" align="center">
			<div class="row" style="margin-top:20px">
				  <div align="center" style="font-size: 50px"><i class="fa fa-sign-in" aria-hidden="true"></i>Salary Update</div>
			</div>
			<div class="row" style="margin-top:10px">
		  	  <div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-id-card" aria-hidden="true"></i>&nbsp 사원번호</span>
			    <input id="empno" name="empno" type="text" value="${salary.empno}"  readonly="readonly" numberonly="true" data-parsley-error-message="사원번호를 입력해 주세요." data-parsley-errors-container="div[id='empnoError']" required="true" class="form-control" placeholder="Employee No">
			    <input type="hidden" name="empnoconfirmchk" id="empnoconfirmchk" value="no">
			  </div>
			</div>
			<div class="row">
				<div id="empnoError" style="color:#f00"></div>
			</div>
			<div class="row" style="margin-top:10px">
		  	  	<div class="input-group">
				    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i>&nbsp 이&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp름</span>
				    <input id="name" name="name" type="text" value="${salary.name}"required="true" data-parsley-error-message="이름을 입력해 주세요." data-parsley-errors-container="div[id='nameError']"class="form-control" placeholder="name">
			 	</div>
			</div>
			<div class="row">
				<div id="nameError" style="color:#f00"></div>
			</div>
			<div class="row" style="margin-top:10px">
		  	  	<div class="input-group">
				    <span class="input-group-addon"><i class="fa fa-building" aria-hidden="true"></i>&nbsp 부&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp서</span>
				    <select id="depart" name="depart" class="form-control"> 
			    	<option value="총무부" <c:if test="${salary.depart=='총무부'}">selected</c:if>>총무부</option>
			    	<option value="인사부" <c:if test="${salary.depart=='인사부'}">selected</c:if>>인사부</option>
			    	<option value="홍보부" <c:if test="${salary.depart=='홍보부'}">selected</c:if>>홍보부</option>
			    	<option value="영업부" <c:if test="${salary.depart=='영업부'}">selected</c:if>>영업부</option>
			    	<option value="기획실" <c:if test="${salary.depart=='기획실'}">selected</c:if>>기획실</option>
			    	<option value="경리부" <c:if test="${salary.depart=='경리부'}">selected</c:if>>경리부</option>
			    </select>
			 	 </div>
			</div>
			<div class="row" style="margin-top:10px">
		  	  	<div class="input-group">
				    <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i>&nbsp 입사날짜</span>
				    <input type="text" id="datepicker" name="input_date" value="${salary.input_date}"class="form-control" placeholder="yyyy/mm/dd">
			 	 </div>
			</div>
			<div class="row input-group" style="margin-top:10px">
			    <span class="input-group-addon"><i class="fa fa-users" aria-hidden="true"></i>&nbsp 공제대상</span>
			    <span class="input-group-addon">배우자</span>
			    <select id="partner" name="partner" class="form-control"> 
			    	<option value="1" <c:if test="${salary.partner=='1'}">selected</c:if>>유</option>
			    	<option value="0" <c:if test="${salary.partner=='0'}">selected</c:if>>무</option>
			    </select>
			    <span class="input-group-addon">20세 미만</span>
			    <input id="dependent20" numberonly="true" type="text" value="${salary.dependent20}"maxlength="2" class="form-control" name="dependent20">
			    <span class="input-group-addon">60세 미만</span>
			    <input id="dependent60" numberonly="true" type="text" value="${salary.dependent60}"maxlength="1" class="form-control" name="dependent60">
			</div>
			<div class="row input-group" style="margin-top:10px">
			    <span class="input-group-addon"><i class="fa fa-users" aria-hidden="true"></i>&nbsp 공제대상</span>
			    <span class="input-group-addon">장애인</span>
			    <input id="disabled" numberonly="true" type="text" value="${salary.disabled}"maxlength="1" data-parsley-type="number" class="form-control" name="disabled">
			    <span class="input-group-addon">여성가장</span>
			    <select id="womanpower" name="womanpower" class="form-control" style="width:100%"> 
			    	<option value="1" <c:if test="${salary.womanpower=='1'}">selected</c:if>>Yes</option>
			    	<option value="0" <c:if test="${salary.womanpower=='0'}">selected</c:if>>No</option>
			    </select>
			</div>
			<div class="row" style="margin-top:10px">
		  	  	<div class="input-group">
				    <span class="input-group-addon"><i class="fa fa-money" aria-hidden="true"></i>&nbsp 월&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp급</span>
				    <input id="pay" type="text" value="${salary.pay}"required="true"  data-parsley-error-message="금액을 입력해 주세요." data-parsley-errors-container="div[id='payError']"maxlength="9"class="form-control" name="pay" placeholder="pay">
			 	 </div>
			</div>
			<div class="row">
				<div id="payError" style="color:#f00"></div>
			</div>
			<div class="row" style="margin-top:10px">
		  	  	<div class="input-group">
				    <span class="input-group-addon"><i class="fa fa-star" aria-hidden="true"></i>&nbsp 수&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp당</span>
				    <input id="extra" type="text"value="${salary.extra}" maxlength="9"class="form-control" name="extra" placeholder="extra">
			 	 </div>
			</div>
			<div class="row" style="margin-top:10px">
		  	  	<div class="input-group">
				    <span class="input-group-addon radio"><i class="fa fa-calculator" aria-hidden="true"></i>&nbsp 계산여부</span>
				    <select id="yn" name="yn" class="form-control"> 
				    	<option value="1" <c:if test="${salary.womanpower=='1'}">selected</c:if>>Yes</option>
				    	<option value="9" <c:if test="${salary.womanpower=='9'}">selected</c:if>>No</option>
				    </select>
			 	 </div>
			</div>
			<div class="row" style="margin-top:10px">
			  	<button class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i>&nbsp저&nbsp&nbsp&nbsp&nbsp&nbsp장</button>
			  	<button type="button" id="salaryDeleteBtn" class="btn btn-primary"><i class="fa fa-trash-o" aria-hidden="true"></i>&nbsp삭&nbsp&nbsp&nbsp&nbsp&nbsp제</button>
			  	<button type="button" onclick="javascript:location.href='salaryList';" class="btn btn-primary"><i class="fa fa-reply" aria-hidden="true"></i>&nbsp돌아가기</button>
			  	<input type="hidden" id="salaryempno" name="salaryempno" value="${salary.empno}">
			</div>
		</div>
		<div id="salaryModal" class="modal fade" role="dialog">
	         <div class="modal-dialog modal-sm" role="document">
	            <div class="modal-content">
	               <div class="modal-header">
	                  <button type="button" class="close" data-dismiss="modal">&times;</button>
	                  <h4 class="modal-title">사원번호 Check</h4>
	               </div>
	               <div class="modal-body">
	               	<p><span id="modalmsg"> Some text in modal</span>
	               </div>
	               <div class="modal-footer" style="text-align:center">
	                  <button type="button" id="usebtn" class="btn btn-success" data-dismiss="modal">확인</button>
	               </div>
	            </div>
	         </div>
	     </div>
	     <div id="salaryDeleteModal" class="modal fade" role="dialog">
	         <div class="modal-dialog modal-sm" role="document">
	            <div class="modal-content">
	               <div class="modal-header">
	                  <button type="button" class="close" data-dismiss="modal">&times;</button>
	               </div>
	               <div class="modal-body">
	               	<p><span id="salarymodalmsg"> Some text in modal</span>
	               </div>
	               <div class="modal-footer" style="text-align:center">
	                  <button type="button" id="salaryModalDeleteBtn"class="btn btn-success" data-dismiss="modal">삭제</button>
	                  <button type="button" class="btn btn-success" data-dismiss="modal">취소</button>
	               </div>
	            </div>
	         </div>
	     </div>
	</form>
</body>
</html>