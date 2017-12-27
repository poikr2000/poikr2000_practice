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
<form class="venderinsert_form" name="venderinsert_form" 
	action="venderInsert" method="POST"role="form" data-parsley-validate="true">
	<div class="container col-sm-offset-4 col-sm-4" align="center">
		<div class="row">
			  <div align="center" style="font-size: 50px"><i class="fa fa-sign-in" aria-hidden="true"></i>거래처 등록</div>
		</div>
		<div class="row" style="margin-top:10px">
	  	  <div class="input-group">
		    <span class="input-group-addon"><i class="fa fa-barcode" aria-hidden="true"></i>&nbsp 코&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp드</span>
		    <input id="vendercode" name="code" type="text" numberonly="true" maxlength="4" data-parsley-error-message="코드를 입력해 주세요." data-parsley-errors-container="div[id='codeError']" required="true" class="form-control" placeholder="4자리">
		    <input type="hidden" name="venderconfirmchk" id="venderconfirmchk" value="no">
		    <div class="input-group-btn">
		      <button type="button" id="venderconfirmbtn" class="btn btn-default">중복검사</button>
		    </div>
		  </div>
		</div>
		<div class="row">
			<div id="codeError" style="color:#f00"></div>
		</div>
		<div class="row" style="margin-top:10px">
	  		<div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-user-circle" aria-hidden="true"></i>&nbsp 상&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp호</span>
			    <input id="name" name="name" type="text" data-parsley-error-message="필수로 입력해 주세요." data-parsley-errors-container="div[id='nameError']"class="form-control">
		  	</div>
		</div>
		<div class="row">
			<div id="nameError" style="color:#f00"></div>
		</div>
		<div class="row input-group" style="margin-top:10px">
		    <span class="input-group-addon"><i class="fa fa-address-card" aria-hidden="true"></i>&nbsp&nbsp&nbsp사업자번호</span>
		    <input id="busno1" numberonly="true" type="text" maxlength="3" data-parsley-type="number" required="true" 
		    onkeyup="busno1_lengthchk(this)"
		    data-parsley-error-message="필수로 입력해 주세요." data-parsley-errors-container="div[id='busnoError']" class="form-control" name="busno1" placeholder="3자리">
		    <span class="input-group-addon">-</span>
		    <input id="busno2" numberonly="true" type="text" maxlength="2" data-parsley-type="number" required="true" 
		    onkeyup="busno2_lengthchk(this)"
		    data-parsley-error-message="필수로 입력해 주세요." data-parsley-errors-container="div[id='busnoError']" class="form-control" name="busno2" placeholder="2자리">
		    <span class="input-group-addon">-</span>
		    <input id="busno3" numberonly="true" type="text" maxlength="5" data-parsley-type="number" required="true"
		    data-parsley-error-message="필수로 입력해 주세요." data-parsley-errors-container="div[id='busnoError']" class="form-control" name="busno3" placeholder="5자리">
		</div>
		<div class="row">
			<div id="busnoError" style="color:#f00"></div>
		</div>
		<div class="row" style="margin-top:10px">
	  		<div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i>&nbsp 사&nbsp&nbsp&nbsp&nbsp업&nbsp&nbsp&nbsp주&nbsp&nbsp&nbsp</span>
			    <input id="ceoname" name="ceoname" required="required" data-parsley-error-message="필수로 입력해 주세요." data-parsley-errors-container="div[id='ceonameError']"type="text" class="form-control">
		  	</div>
		</div>
		<div class="row">
			<div id="ceonameError" style="color:#f00"></div>
		</div>
		<div class="row" style="margin-top:10px">
	  		<div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-address-book" aria-hidden="true"></i>&nbsp 우&nbsp편&nbsp번&nbsp호&nbsp&nbsp</span>
			    <input id="zipcode" name="zipcode" required="required"data-parsley-error-message="필수로 입력해 주세요." data-parsley-errors-container="div[id='zipcodeError']"type="text" class="form-control">
			    <div class="input-group-btn">
			      <button type="button" onclick="sample4_execDaumPostcode()"class="btn btn-default">우편번호 찾기</button>
			    </div>
		  	</div>
		</div>
		<div class="row">
			<div id="zipcodeError" style="color:#f00"></div>
		</div>
		<div class="row" style="margin-top:10px">
	  		<div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-address-book" aria-hidden="true"></i>&nbsp 주&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp소</span>
			    <input id="newaddr" name="newaddr" data-parsley-error-message="필수로 입력해 주세요." data-parsley-errors-container="div[id='addrError']"type="text"required="true"type="text" class="form-control">
			    <input id="oldaddr" name="oldaddr" type="text" class="form-control">
			    <input id="detailaddr" name="detailaddr" type="text" class="form-control" placeholder="나머지 주소">
		  	</div>
		</div>
		<div class="row">
			<div id="addrError" style="color:#f00"></div>
		</div>
		<div class="row input-group" style="margin-top:10px">
		    <span class="input-group-addon"><i class="fa fa-phone" aria-hidden="true"></i>&nbsp 연&nbsp&nbsp&nbsp&nbsp락&nbsp&nbsp&nbsp&nbsp처&nbsp</span>
		    <select id="officeno1" name="officeno1" class="form-control" style="width:30%"> 
		    	<option value="010" selected>010</option>
		    	<option value="001">001</option> 
		    	<option value="011">011</option> 
		    	<option value="018">018</option> 
		    	<option value="019">019</option> 
		    </select>
		    <input id="officeno2" numberonly="true" style="width:70%"type="text" maxlength="4" data-parsley-type="number" required="true" 
		    onkeyup="officeno2_lengthchk(this)"
		    data-parsley-error-message="전화번호 앞자리를 입력해 주세요." data-parsley-errors-container="div[id='phoneError']" class="form-control" name="officeno2" placeholder="전화번호1">
		    <span class="input-group-addon">-</span>
		    <input id="officeno3" numberonly="true" type="text" maxlength="4" data-parsley-type="number" required="true"
		    data-parsley-error-message="전화번호 뒷자리를 입력해 주세요." data-parsley-errors-container="div[id='phoneError']" class="form-control" name="officeno3" placeholder="전화번호2">
		</div>
		<div class="row">
			<div id="phoneError" style="color:#f00"></div>
		</div>
		<div class="row" style="margin-top:10px">
		  	<button type="button" id="vendersave" class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i>&nbsp저&nbsp&nbsp&nbsp&nbsp&nbsp장</button>
		  	<button type="reset" id="" class="btn btn-primary"><i class="fa fa-eraser" aria-hidden="true"></i>&nbsp초&nbsp기&nbsp화</button>
		  	<button type="button" onclick="javascript:location.href='index';" class="btn btn-primary"><i class="fa fa-reply" aria-hidden="true"></i>&nbsp돌아가기</button>
		</div>
	</div>
	<div id="venderModal" class="modal fade" role="dialog">
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