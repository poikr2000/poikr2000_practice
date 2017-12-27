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
function myFunction() {
	var qty = document.forms[0].qty.value;
	var price = document.forms[0].price.value;
	$('#total').attr("value",qty*price);
}
function selectedSeq(seq){
	$.ajax({
		type:'Post',
		data:"seq="+seq,
		datatype:'json',
		url : 'buyDetail',
		success : function(data){
			$("#buyinsertbtn").hide();
			$("#buyreset").hide();
			$("#buyupdate").show();
			
			$("#selectvender").val(data.vendcode).prop("selected", true);
			$('#yyyy').attr("value",data.yyyy);
			$('#mm').attr("value",data.mm);
			$('#dd').attr("value",data.dd);
			$('#no').attr("value",data.no);
			$('#hang').attr("value",data.hang);
			$("#selectproduct").val(data.procode).prop("selected", true);
			$('#procode').attr("value",data.procode);
			$('#beforeprocode').attr("value",data.procode);
			$('#price').attr("value",data.price);
			$('#qty').attr("value",data.qty);
			$('#beforeqty').attr("value",data.qty);
			var total = data.price*data.qty;
			$('#total').attr("value",total);
			$('#memo').attr("value",data.memo);
			$('#seq').attr("value",data.seq);
		},
		error : function(xhr,status,error){
			alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
		}
	});
}
$(document).ready(function(){
	var today = new Date();
	var year = today.getFullYear();
	var mm = today.getMonth()+1;
	var dd= today.getDate();
	$('#searchyyyy').attr("value",year);
	$('#searchmm').val(mm).prop("selected", true);
	$('#searchdd').val(dd).prop("selected", true);
	$('#buyupdate').click(function(){
		var selectedvender = $('#selectvender').val();
		var selectedproduct = $('#selectproduct').val();
		if(selectedvender == '0000'){
			$('#modalmsgvender').text('- 매입처를 선택하세요! -');
			
		}else{
			$('#modalmsgvender').text('');
		}
		if(selectedproduct == '0000000000000'){
			$('#modalmsgproduct').text('- 매입 상품을 선택하세요! -');
		}else{
			$('#modalmsgproduct').text('');
		}
		if($('#qty').val()==0){
			$('#qtyConfirmModalMsg').text('- 수량을 입력하세요! -');
		}else{
			$('#qtyConfirmModalMsg').text('');
		}
		if(selectedvender == '0000'||selectedproduct == '0000000000000'||$('#qty').val()==""){
			$('#qtyConfirmModal').modal('show');
			return;
		}else{
			$('.productbuy_form').attr('action','buyUpdate');
			$('.productbuy_form').submit();
		}
	});
	
	$('#buysearch_btn').click(function(){
		var vendercode = $('#searchvender').val();
		var searchyyyy = $('#searchyyyy').val();
		var searchmm = $('#searchmm').val();
		var searchdd = $('#searchdd').val();
		if(vendercode == '0000'){
			$('#modalmsgvender').text('- 매입처를 선택하세요! -');
			
		}else{
			$('#modalmsgvender').text('');
		}
		if(searchyyyy == ""||searchdd == ""){
			$('#modalmsgproduct').text('- 날짜를 입력하세요! -');
			
		}else{
			$('#modalmsgproduct').text('');
		}
		if(vendercode == '0000'||searchyyyy == ""||searchdd == ""){
			$('#qtyConfirmModal').modal('show');
			return;
		}else{
			$('.buysearch_form').submit();
		}
	});
	$('#buyinsertbtn').click(function(){
		var selectedvender = $('#selectvender').val();
		var selectedproduct = $('#selectproduct').val();
		if(selectedvender == '0000'){
			$('#modalmsgvender').text('- 매입처를 선택하세요! -');
			
		}else{
			$('#modalmsgvender').text('');
		}
		if(selectedproduct == '0000000000000'){
			$('#modalmsgproduct').text('- 매입 상품을 선택하세요! -');
		}else{
			$('#modalmsgproduct').text('');
		}
		if($('#qty').val()==0){
			$('#qtyConfirmModalMsg').text('- 수량을 입력하세요! -');
		}else{
			$('#qtyConfirmModalMsg').text('');
		}
		if(selectedvender == '0000'||selectedproduct == '0000000000000'||$('#qty').val()==""){
			$('#qtyConfirmModal').modal('show');
			return;
		}else{
			$('.productbuy_form').attr('action','buyInsert');
			$('.productbuy_form').submit();
		}
	});
	$( "#selectvender" ).change(function() {
		var vendcode = $(this).val();
		var vendname = $(this).children('option:selected').text();
		$('#vendname').attr("value",vendname);
		$.ajax({
			type:'Post',
			data:"vendcode="+vendcode,
			datatype:'json',
			url : 'buyNew',
			success : function(data){
				$('#yyyy').attr("value",data.yyyy);
				$('#mm').attr("value",data.mm);
				$('#dd').attr("value",data.dd);
				$('#no').attr("value",data.no);
				$('#hang').attr("value",data.hang);
			},
			error : function(xhr,status,error){
				alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
			}
		});
	});
	$("#selectproduct").change(function() {
		var productcode = $(this).val();
		$.ajax({
			type:'Post',
			data:"productcode="+productcode,
			datatype:'json',
			url : 'productSelected',
			success : function(data){
				$('#procode').attr("value",data.code);
				$('#price').attr("value",data.buyprice);
				$('#stock').attr("value",data.stock);
				$('#qty').focus();
			},
			error : function(xhr,status,error){
				alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
			}
		});
	});
	//ajax로 form데이터 넘기기
	$('#buyupdatesubmit').click(function(){
		var selectedvender = $('#selectvender').val();
		var selectedproduct = $('#selectproduct').val();
		if(selectedvender == '0000'){
			$('#modalmsgvender').text('- 매입처를 선택하세요! -');
			
		}else{
			$('#modalmsgvender').text('');
		}
		if(selectedproduct == '0000000000000'){
			$('#modalmsgproduct').text('- 매입 상품을 선택하세요! -');
		}else{
			$('#modalmsgproduct').text('');
		}
		if($('#qty').val()==0){
			$('#qtyConfirmModalMsg').text('- 수량을 입력하세요! -');
		}else{
			$('#qtyConfirmModalMsg').text('');
		}
		if(selectedvender == '0000'||selectedproduct == '0000000000000'||$('#qty').val()==""){
			$('#qtyConfirmModal').modal('show');
			return;
		}else{
			$('.productbuy_form').attr('action','buyUpdate');
			$.ajax({
				type:'Post',
				data:$('.productbuy_form').serialize(),
				datatype:'json',
				url :$('.productbuy_form').attr('action'),
				success : function(data){
					alert(11111111);
				},
				error : function(xhr,status,error){
					alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
				}
			});
		}
	});
});
</script>
</content>
<body>
	<div class="container col-sm-offset-2 col-sm-8" align="center">
		<div class="row" style="margin-top:20px">
			  <div align="center" style="font-size: 50px"><i class="fa fa-sign-in" aria-hidden="true"></i>매입 관리</div>
		</div>
		<form class="productbuy_form" name="productbuy_form" method="POST"role="form" data-parsley-validate="true">
			<div class="container col-sm-5">
			  	<div class="row" style="margin-top:10px">
			  	  	<div class="input-group">
					    <span class="input-group-addon">거&nbsp&nbsp래&nbsp&nbsp처</span>
					    <select id="selectvender" name="vendcode" class="form-control"> 
					    	<c:forEach var="vender" items="${venders}">
								<option value="${vender.code}"<c:if test="${vender.code ==buy.vendcode}">selected</c:if>>${vender.name}</option>
							</c:forEach>
					    </select>
					    <input type="hidden" id="vendname" name="vendname">
					    <input type="hidden" id="seq" name="seq" value="0">
					    <input type="hidden" id="beforeprocode" name="beforeprocode">
					    <input type="hidden" id="beforeqty" name="beforeqty" value="0">
				 	</div>
				</div>
				<div class="row" style="margin-top:10px">
			  	  	<div class="input-group">
					    <span class="input-group-addon">매입번호</span>
					    <input id="yyyy" name="yyyy" readonly="readonly" value="${buy.yyyy}"type="text" class="form-control" >
					    <span class="input-group-addon">-</span>
					    <input id="mm" name="mm" readonly="readonly" value="${buy.mm}"type="text" class="form-control" >
					    <span class="input-group-addon">-</span>
					    <input id="dd" name="dd" readonly="readonly" value="${buy.dd}"type="text" class="form-control" >
					    <span class="input-group-addon">-</span>
					    <input id="no" name="no" readonly="readonly" value="${buy.no}"type="text" class="form-control" >
					    <span class="input-group-addon">-</span>
					    <input id="hang" name="hang" readonly="readonly" value="${buy.hang}"type="text" class="form-control" >
				 	</div>
				</div>
				<div class="row" style="margin-top:30px">
				</div>
				<div class="row" style="margin-top:10px">
			  	  	<div class="input-group">
					    <span class="input-group-addon">품&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp명</span>
					    <select id="selectproduct" class="form-control"> 
					    	<c:forEach var="product" items="${products}">
								<option value="${product.code}">${product.name}</option>
							</c:forEach>
					    </select>
				 	</div>
				</div>
				<div class="row" style="margin-top:10px">
			  	  	<div class="input-group">
					    <span class="input-group-addon">상품코드</span>
					    <input id="procode" name="procode" readonly="readonly" type="text" class="form-control">
					    <span class="input-group-addon">현&nbsp&nbsp재&nbsp&nbsp고</span>
					    <input id="stock" name="stock" type="text" readonly="readonly" class="form-control">
				 	</div>
				</div>
				<div class="row" style="margin-top:10px">
			  	  	<div class="input-group">
					    <span class="input-group-addon">단&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp가</span>
					    <input id="price" name="price" type="text" readonly="readonly" class="form-control">
				 	</div>
				</div>
				<div class="row" style="margin-top:10px">
			  	  	<div class="input-group">
					    <span class="input-group-addon">수&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp량</span>
					    <input id="qty" name="qty" type="text" numberonly="true"class="form-control" onkeyup="myFunction()">
				 	</div>
				</div>
				<div class="row" style="margin-top:10px">
			  	  	<div class="input-group">
					    <span class="input-group-addon">금&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp액</span>
					    <input id="total" name="total"value="0"readonly="readonly" type="text" class="form-control">
				 	</div>
				</div>
				<div class="row" style="margin-top:10px">
			  	  	<div class="input-group">
					    <span class="input-group-addon">비&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp고</span>
					    <input id="memo" name="memo" type="text" class="form-control">
				 	</div>
				</div>
			</div>
		</form>
		<div class="container col-sm-1"></div>
		<form class="buysearch_form" name="buysearch_form" action="buySearch" method="POST"role="form" data-parsley-validate="true">
			<div class="container col-sm-6" style="height: 420px;">
			<table width="100%">
				<tr>
					<td>
						 <input id="vendername" name="vendername" type="text" value="<c:if test="${buy.vendcode!=null}">(${buy.vendcode})${buy.vendname}</c:if>"class="form-control">
					</td>
					<td>
						 <input id="yymmdd" name="yymmdd" type="text" value="<c:if test="${buy.yyyy!=null}">${buy.yyyy}-${buy.mm}-${buy.dd}</c:if>"class="form-control">
					</td>
				</tr>
			</table>
			<div class="pre-scrollable">
					<table class="table table-striped table-bordered" cellspacing="0"  width="100%" >
			        <thead>
			            <tr>
			                <th>no</th>
			                <th>항번</th>
			                <th>품명</th>
			                <th>단가</th>
							<th>수량</th>
							<th>금액</th>
							<th></th>
			            </tr>
			        </thead>
			        <tbody>
			        	<c:forEach var="buys" items="${buys}">
			        		<c:choose>
			        			<c:when test="${buys.hang==0 && buys.no !=0}">
			        				<tr>
					        			<td class="text-center"></td>
					        			<td class="text-center"></td>
					        			<td class="text-center"></td>
					        			<td class="text-center bg-info text-white">소계</td>
					        			<td class="text-center"></td>
					        			<td class="text-center bg-info text-white">${buys.total}</td>
					        			<td class="text-center"></td>
									</tr>
			        			</c:when>
			        			<c:when test="${buys.hang==0 && buys.no ==0}">
			        				<tr>
					        			<td class="text-center"></td>
					        			<td class="text-center"></td>
					        			<td class="text-center"></td>
					        			<td class="text-center bg-primary text-white">총계</td>
					        			<td class="text-center"></td>
					        			<td class="text-center bg-primary text-white">${buys.total}</td>
					        			<td class="text-center"></td>
									</tr>
			        			</c:when>
			        			<c:otherwise>
			        				<tr>
					        			<td class="text-center">${buys.no}</td>
					        			<td class="text-center">${buys.hang}</td>
					        			<td class="text-center"><a href="#" onclick="selectedSeq(${buys.seq});">${buys.proname}</a></td>
					        			<td class="text-center">${buys.price}</td>
					        			<td class="text-center">${buys.qty}</td>
					        			<td class="text-center">${buys.total}</td>
					        			<td class="text-center"><a href="buyListDelete?seq=${buys.seq}"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
									</tr>
			        			</c:otherwise>
			        		</c:choose>
						</c:forEach>
							
			        </tbody>
			    </table>
			</div>
		</div>
		
		<div class="col-sm-5">
			<div class="row" style="margin-top:10px">
			  	<button type="button" id="buyinsertbtn" class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i>&nbsp저&nbsp&nbsp&nbsp&nbsp&nbsp장</button>
			  	<button type="reset" id="buyreset" class="btn btn-primary"><i class="fa fa-eraser" aria-hidden="true"></i>&nbsp초&nbsp기&nbsp화</button>
			  	<button type="button" id="buyupdate" class="btn btn-primary" style="display: none"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp수&nbsp&nbsp&nbsp&nbsp&nbsp정</button>
			  	<button type="button" onclick="javascript:location.href='index';" class="btn btn-primary"><i class="fa fa-reply" aria-hidden="true"></i>&nbsp돌아가기</button>
			  	&nbsp&nbsp&nbsp&nbsp
			  	<button type="button" onclick="javascript:location.href='productBuyForm';"id="" class="btn btn-primary"><i class="fa fa-plus" aria-hidden="true"></i>&nbspNew</button>
			</div>
		</div>
		<div class="col-sm-1"></div>
		<div class="col-sm-6">
			<div class="input-group" style="margin-top:10px">
				<select id="searchvender" name="searchvender" class="form-control" style="width: 100px;"> 
			    	<c:forEach var="vender" items="${venders}">
						<option value="${vender.code}">${vender.name}</option>
					</c:forEach>
			    </select>
			    <span class="input-group-addon"></span>
				<input width="20" id="searchyyyy" name="searchyyyy" type="text" class="form-control" placeholder="yyyy">
				<span class="input-group-addon">-</span>
				<select id="searchmm" name="searchmm" class="form-control" style="width: 80px;"> 
					<c:forEach var="i" begin="1" end="12" step="1">
						<option value="${i}">${i}</option>
					</c:forEach>
			    </select>
				<span class="input-group-addon">-</span>
				<select id="searchdd" name="searchdd" class="form-control" style="width: 80px;"> 
					<c:forEach var="i" begin="1" end="31" step="1">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>
				<div class="input-group-btn">
					<button type="button" id="buysearch_btn" class="btn btn-primary"><i class="fa fa-search" aria-hidden="true"></i>&nbsp검&nbsp&nbsp&nbsp&nbsp&nbsp색</button>
				</div>
			</div>
		</div>
	</form>
		
	</div>
	<div id="qtyConfirmModal" class="modal fade" role="dialog">
	         <div class="modal-dialog modal-sm" role="document">
	            <div class="modal-content">
	               <div class="modal-header">
	                  <button type="button" class="close" data-dismiss="modal">&times;</button>
	               </div>
	               <div class="modal-body">
	               	<p><span id="modalmsgvender"></span>
	               	<p><span id="modalmsgproduct"></span>
	               	<p><span id="qtyConfirmModalMsg"></span>
	               </div>
	               <div class="modal-footer" style="text-align:center">
	                  <button type="button" class="btn btn-success" data-dismiss="modal">확인</button>
	               </div>
	            </div>
	         </div>
	     </div>

</body>

</html>