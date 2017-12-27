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
	<form class="memberupdate_form" name="memberupdate_form" 
	action="memberUpdate" method="POST"role="form" data-parsley-validate="true"  enctype="multipart/form-data">
		<div class="container col-sm-offset-4 col-sm-4" align="center">
			<div class="row" style="margin-top:50px">
				  <div align="center" style="font-size: 50px">Member Update</div>
			</div>
			<div class="row" style="margin-top:10px">
				  <a href=#><img title="클릭후 이미지 변경"alt="클릭후 이미지 변경"class="img-circle"style="WIDTH: 30%; border:1px solid"
				  id="image"name="image"src="${member.photo}"></a>
				  <input type="hidden" name="beforephoto" value="${member.photo}">
			</div>
			<div class="row">
				<input type="file" id="photo"name="imgfile"
				style="visibility:hidden;">
			</div>
			<div class="row" style="margin-top:10px">
		  	  <div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-envelope" aria-hidden="true"></i>&nbsp E-mail &nbsp&nbsp&nbsp</span>
			    <input id="email" type="email" required="true"class="form-control" name="email" 
			    placeholder="Email" value="${member.email}" readonly="readonly">
			  </div>
			</div>
			<div class="row" style="margin-top:10px">
		  	  <div class="input-group">
			    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i>&nbsp 비밀번호</span>
			    <input id="password" type="password" required="true" data-parsley-error-message="비밀번호를 입력해 주세요." 
			    data-parsley-errors-container="div[id='passwordError']" class="form-control" name="password" placeholder="Password" value="${member.password}">
			    <input id="beforepassword" name="beforepassword" type="hidden" value="${member.password}">
			  </div>
			</div>
			<div class="row">
				<div id="passwordError" style="color:#f00"></div>
			</div>
			<div class="row" style="margin-top:10px">
		  		<div class="input-group">
				    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i>&nbsp 이&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp름</span>
				    <input id="name" type="text" required="true" data-parsley-error-message="이름을 입력해 주세요." 
				    data-parsley-errors-container="div[id='nameError']" class="form-control" name="name" value="${member.name}">
			  	</div>
			</div>
			<div class="row">
				<div id="nameError" style="color:#f00"></div>
			</div>
			<div class="row input-group" style="margin-top:10px">
			    <span class="input-group-addon"><i class="fa fa-phone" aria-hidden="true"></i>&nbsp&nbsp&nbsp전화번호</span>
			    <select id="phone1" name="phone1" class="form-control" style="width:30%" value="${member.phone1}"> 
			    	<option value="010" <c:if test="${member.phone1=='010'}">selected</c:if>>010</option>
			    	<option value="001" <c:if test="${member.phone1=='001'}">selected</c:if>>001</option> 
			    	<option value="011" <c:if test="${member.phone1=='011'}">selected</c:if>>011</option> 
			    	<option value="018" <c:if test="${member.phone1=='018'}">selected</c:if>>018</option> 
			    	<option value="019" <c:if test="${member.phone1=='019'}">selected</c:if>>019</option> 
			    </select>
			    <input id="phone2" numberonly="true" style="width:70%"type="text" maxlength="4" data-parsley-type="number" required="true" 
			    data-parsley-error-message="전화번호 앞자리를 입력해 주세요." data-parsley-errors-container="div[id='phoneError']" 
			    onkeyup="phone2_lengthchk(this)"
			    class="form-control" name="phone2" placeholder="전화번호1" value="${member.phone2}">
			    <span class="input-group-addon">-</span>
			    <input id="phone3" numberonly="true" type="text" maxlength="4" data-parsley-type="number" required="true"
			    data-parsley-error-message="전화번호 뒷자리를 입력해 주세요." data-parsley-errors-container="div[id='phoneError']" 
			    class="form-control" name="phone3" placeholder="전화번호2" value="${member.phone3}">
			    
			</div>
			<c:choose>
	       		<c:when test="${sessionemail eq 'admin@admin.com'}">
	       			<div class="row" style="margin-top:10px">
	       				<div class="input-group">
						    <span class="input-group-addon"><i class="fa fa-level-up" aria-hidden="true"></i>&nbsp 회원레벨</span>
						    <input id="name" type="text" required="true" value="${member.memlevel}" class="form-control" name="memlevel" >
					  	</div>
		       		</div>
		       		
				</c:when>
				<c:otherwise>
					<input type="hidden" value="${member.memlevel}" name="memlevel">
				</c:otherwise>
			</c:choose>	
			<div class="row">
				<div id="phoneError" style="color:#f00"></div>
			</div>
			<div class="row" style="margin-top:10px">
			  	<button id="membersave" class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i>&nbsp저&nbsp&nbsp&nbsp&nbsp&nbsp장</button>
			  	<button type="button" onclick="javascript:location.href='memberList';" class="btn btn-primary"><i class="fa fa-reply" aria-hidden="true"></i>&nbsp돌아가기</button>
			</div>
		</div>
		<div id="myModal" class="modal fade" role="dialog">
	         <div class="modal-dialog modal-sm" role="document">
	            <div class="modal-content">
	               <div class="modal-header">
	                  <button type="button" class="close" data-dismiss="modal">&times;</button>
	                  <h4 class="modal-title">E-mail Check</h4>
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