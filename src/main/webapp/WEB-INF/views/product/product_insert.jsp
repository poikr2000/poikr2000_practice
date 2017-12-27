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
<form class="productinsert_form" name="productinsert_form" 
	action="productInsert" method="POST"role="form" data-parsley-validate="true">
	<div class="container col-sm-offset-3 col-sm-6" align="center">
		<div class="row">
			  <div align="center" style="font-size: 50px"><i class="fa fa-sign-in" aria-hidden="true"></i>상품 등록</div>
		</div>
		<div class="row" style="margin-top:10px">
	  	  <div class="input-group">
		    <span class="input-group-addon"><i class="fa fa-barcode" aria-hidden="true"></i>&nbsp 상품코드</span>
		    <input id="code" name="code" type="text" numberonly="true" maxlength="13" data-parsley-error-message="코드를 입력해 주세요." data-parsley-errors-container="div[id='codeError']" required="true" class="form-control" placeholder="ex)8801234567890">
		    <input type="hidden" name="codeconfirmchk" id="codeconfirmchk" value="no">
		    <div class="input-group-btn">
		      <button type="button" id="productconfirmbtn" class="btn btn-default">중복검사</button>
		    </div>
		  </div>
		</div>
		<div class="row">
			<div id="empnoError" style="color:#f00"></div>
		</div>
		<div class="row" style="margin-top:10px">
	  		<div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp 상품설명</span>
			    <input id="explanation" name="explanation" type="text" class="form-control">
		  	</div>
		</div>
		<div class="row" style="margin-top:10px">
	  	  	<div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-archive" aria-hidden="true"></i>&nbsp 이&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp름</span>
			    <input id="name" name="name" type="text" required="true" data-parsley-error-message="필수로 입력해 주세요." data-parsley-errors-container="div[id='nameError']"class="form-control" placeholder="name">
			    <span class="input-group-addon"><i class="fa fa-gift" aria-hidden="true"></i>&nbsp 상품규격</span>
			    <input id="capacity" name="capacity" type="text" required="true" data-parsley-error-message="필수로 입력해 주세요." data-parsley-errors-container="div[id='capacityError']"class="form-control" placeholder="capacity">
		 	</div>
		</div>
		<div class="row">
			<div id="nameError" style="color:#f00"></div>
		</div>
		<div class="row">
			<div id="capacityError" style="color:#f00"></div>
		</div>
		<div class="row" style="margin-top:10px">
	  	  	<div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-krw" aria-hidden="true"></i>&nbsp 매&nbsp&nbsp입&nbsp&nbsp가</span>
			    <input id="buyprice" name="buyprice" type="text" required="true" data-parsley-error-message="필수로 입력해 주세요." data-parsley-errors-container="div[id='buypriceError']"class="form-control" placeholder="buyprice">
			    <span class="input-group-addon"><i class="fa fa-krw" aria-hidden="true"></i>&nbsp 매&nbsp&nbsp출&nbsp&nbsp가</span>
			    <input id="saleprice" name="saleprice" type="text" required="true" data-parsley-error-message="필수로 입력해 주세요." data-parsley-errors-container="div[id='salepriceError']"class="form-control" placeholder="saleprice">
		 	</div>
		</div>
		<div class="row">
			<div id="buypriceError" style="color:#f00"></div>
		</div>
		<div class="row">
			<div id="salepriceError" style="color:#f00"></div>
		</div>
		<div class="bg-warning text-white" style="margin-top:20px">재고 현황</div>
		<div class="row" style="margin-top:10px">
	  	  	<div class="input-group">
			    <span class="input-group-addon">전년말재고</span>
			    <input id="preyystock" name="preyystock" value="0" type="text"class="form-control">
			    <span class="input-group-addon">전월말재고</span>
			    <input id="premmstock" name="premmstock" value="0" type="text"class="form-control">
			     <span class="input-group-addon">전일재고</span>
			    <input id="preddstock" name="preddstock" value="0" type="text"class="form-control">
			    <span class="input-group-addon">현재재고</span>
			    <input id="stock" name="stock" value="0" type="text"class="form-control">
		 	</div>
		</div>
		<div class="bg-warning text-white" style="margin-top:20px">매입 매출 현황</div>
		<div class="row" style="margin-top:10px">
	  	  	<div class="input-group">
			    <span class="input-group-addon">&nbsp1월매입&nbsp</span>
			    <input id="buy01" name="buy01" type="text"value="0" class="form-control">
			    <span class="input-group-addon">&nbsp1월매출&nbsp</span>
			    <input id="sale01" name="sale01" type="text"value="0" class="form-control">
			     <span class="input-group-addon">&nbsp7월매입&nbsp</span>
			    <input id="buy07" name="buy07" type="text"value="0" class="form-control">
			    <span class="input-group-addon">&nbsp7월매출&nbsp</span>
			    <input id="sale07" name="sale07" type="text"value="0" class="form-control">
		 	</div>
		</div>
		<div class="row" style="margin-top:10px">
	  	  	<div class="input-group">
			    <span class="input-group-addon">&nbsp2월매입&nbsp</span>
			    <input id="buy02" name="buy02" type="text"value="0" class="form-control">
			    <span class="input-group-addon">&nbsp2월매출&nbsp</span>
			    <input id="sale02" name="sale02" type="text"value="0" class="form-control">
			     <span class="input-group-addon">&nbsp8월매입&nbsp</span>
			    <input id="buy08" name="buy08" type="text"value="0" class="form-control">
			    <span class="input-group-addon">&nbsp8월매출&nbsp</span>
			    <input id="sale08" name="sale08" type="text"value="0" class="form-control">
		 	</div>
		</div>
		<div class="row" style="margin-top:10px">
	  	  	<div class="input-group">
			    <span class="input-group-addon">&nbsp3월매입&nbsp</span>
			    <input id="buy03" name="buy03" type="text"value="0" class="form-control">
			    <span class="input-group-addon">&nbsp3월매출&nbsp</span>
			    <input id="sale03" name="sale03" type="text"value="0" class="form-control">
			     <span class="input-group-addon">&nbsp9월매입&nbsp</span>
			    <input id="buy09" name="buy09" type="text"value="0" class="form-control">
			    <span class="input-group-addon">&nbsp9월매출&nbsp</span>
			    <input id="sale09" name="sale09" type="text"value="0" class="form-control">
		 	</div>
		</div>
		<div class="row" style="margin-top:10px">
	  	  	<div class="input-group">
			    <span class="input-group-addon">&nbsp4월매입&nbsp</span>
			    <input id="buy04" name="buy04" type="text"value="0" class="form-control">
			    <span class="input-group-addon">&nbsp4월매출&nbsp</span>
			    <input id="sale04" name="sale04" type="text"value="0" class="form-control">
			     <span class="input-group-addon">10월매입</span>
			    <input id="buy10" name="buy10" type="text"value="0" class="form-control">
			    <span class="input-group-addon">10월매출</span>
			    <input id="sale10" name="sale10" type="text"value="0" class="form-control">
		 	</div>
		</div>
		<div class="row" style="margin-top:10px">
	  	  	<div class="input-group">
			    <span class="input-group-addon">&nbsp5월매입&nbsp</span>
			    <input id="buy05" name="buy05" type="text"value="0" class="form-control">
			    <span class="input-group-addon">&nbsp5월매출&nbsp</span>
			    <input id="sale05" name="sale05" type="text"value="0" class="form-control">
			     <span class="input-group-addon">11월매입</span>
			    <input id="buy11" name="buy11" type="text"value="0" class="form-control">
			    <span class="input-group-addon">11월매출</span>
			    <input id="sale11" name="sale11" type="text"value="0" class="form-control">
		 	</div>
		</div>
		<div class="row" style="margin-top:10px">
	  	  	<div class="input-group">
			    <span class="input-group-addon">&nbsp6월매입&nbsp</span>
			    <input id="buy06" name="buy06" type="text"value="0" class="form-control">
			    <span class="input-group-addon">&nbsp6월매출&nbsp</span>
			    <input id="sale06" name="sale06" type="text"value="0" class="form-control">
			     <span class="input-group-addon">12월매입</span>
			    <input id="buy12" name="buy12" type="text"value="0" class="form-control">
			    <span class="input-group-addon">12월매출</span>
			    <input id="sale12" name="sale12" type="text"value="0" class="form-control">
		 	</div>
		</div>
		
		<div class="row" style="margin-top:10px">
		  	<button type="button" id="productsave" class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i>&nbsp저&nbsp&nbsp&nbsp&nbsp&nbsp장</button>
		  	<button type="reset" id="" class="btn btn-primary"><i class="fa fa-eraser" aria-hidden="true"></i>&nbsp초&nbsp기&nbsp화</button>
		  	<button type="button" onclick="javascript:location.href='index';" class="btn btn-primary"><i class="fa fa-reply" aria-hidden="true"></i>&nbsp돌아가기</button>
		</div>
	</div>
	<div id="productModal" class="modal fade" role="dialog">
         <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title">코드 체크</h4>
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
</form>
</body>
</html>