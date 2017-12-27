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
$(document).ready(function(){
	$('#productallchk').on("click",function(){
		if($(this).is(':checked')){
			$('input[name=productunitchk]').prop('checked',true);
		}else{
			$('input[name=productunitchk]').prop('checked',false);
		}
	});
	$('#productexample').DataTable( {
        dom: 'Brftip',
        buttons: [
            {
                text: 'insert',
                action: function ( e, dt, node, config ) {
                	var url="productInsertForm";
        			$(location).attr('href',url);
                }
            },
            {
                text: 'delete',
                action: function ( e, dt, node, config ) {
                	var checkboxarr=[];
                	$("input[name='productunitchk']:checked").each(function(){
                		checkboxarr.push($(this).val());
                	});
                	if(checkboxarr.length>0){
                		$('#productselectedmodalmsg').text("삭제 하시겠습니까?")
                		$('#productSelectedDeleteModal').modal('show');
                		$('#productSelectedModalDeleteBtn').on('click',function(){
                			$('.productlist_form').submit();
                		});
                	}else{
            			$('#productNoticeModalMsg').text("선택된 항목이 없습니다.")
                		$('#productNoticeModal').modal('show');
            			return;
            		}
                }
            }
        ]
    } );
});
</script>
</content>
<body>
<form class="productlist_form" action="productSelectedDelete" method="post">
		<div class="container col-sm-offset-1 col-sm-10" align="center">
			<div class="row" style="margin-top:20px">
				  <div align="center" style="font-size: 50px"><i class="fa fa-sign-in" aria-hidden="true"></i>수불장</div>
			</div>
			<div style="margin-top:40px">
					<table id="productexample" class="table table-striped table-bordered" cellspacing="0" width="100%">
			        <thead>
			            <tr>
			            	<th><input type="checkbox" id="productallchk"></th>
			                <th>코드</th>
			                <th>품명</th>
			                <th>전년말</th>
			                <th>구분</th>
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
							<th>현재고</th>
			            </tr>
			        </thead>
			        <tbody>
			        	<c:forEach var="product" items="${products}">
			        		<c:choose>
			        			<c:when test="${product.code=='0000000000000'}">
			        			</c:when>
			        			<c:otherwise>
			        				<tr>
										<td class="text-center"><input type="checkbox" id="productunitchk" name="productunitchk" value="${product.code}"></td>
										<td class="text-center"><a href="productUpdateForm?code=${product.code}">${product.code}</a></td>
										<td class="text-center" style="vertical-align:middle;">${product.name}</td>
										<td class="text-center" style="vertical-align:middle;">${product.preyystock}</td>
										<td class="text-center" style="vertical-align:middle;">
											<div class="bg-info text-white">매입</div>
											<div class="bg-primary text-white">매출</div>
										</td>
										<td class="text-center">${product.buy01}<br>${product.sale01}</td>
										<td class="text-center">${product.buy02}<br>${product.sale02}</td>
										<td class="text-center">${product.buy03}<br>${product.sale03}</td>
										<td class="text-center">${product.buy04}<br>${product.sale04}</td>
										<td class="text-center">${product.buy05}<br>${product.sale05}</td>
										<td class="text-center">${product.buy06}<br>${product.sale06}</td>
										<td class="text-center">${product.buy07}<br>${product.sale07}</td>
										<td class="text-center">${product.buy08}<br>${product.sale08}</td>
										<td class="text-center">${product.buy09}<br>${product.sale09}</td>
										<td class="text-center">${product.buy10}<br>${product.sale10}</td>
										<td class="text-center">${product.buy11}<br>${product.sale11}</td>
										<td class="text-center">${product.buy12}<br>${product.sale12}</td>
										<td class="text-center bg-primary text-white" style="vertical-align:middle;">${product.stock}</td>
									</tr>
			        			</c:otherwise>
			        		</c:choose>
						</c:forEach>
			        </tbody>
			    </table>
			</div>
		</div>
		<div id="productSelectedDeleteModal" class="modal fade" role="dialog">
	         <div class="modal-dialog modal-sm" role="document">
	            <div class="modal-content">
	               <div class="modal-header">
	                  <button type="button" class="close" data-dismiss="modal">&times;</button>
	               </div>
	               <div class="modal-body">
	               	<p><span id="productselectedmodalmsg"> Some text in modal</span>
	               </div>
	               <div class="modal-footer" style="text-align:center">
	                  <button type="button" id="productSelectedModalDeleteBtn"class="btn btn-success" data-dismiss="modal">삭제</button>
	                  <button type="button" class="btn btn-success" data-dismiss="modal">취소</button>
	               </div>
	            </div>
	         </div>
	     </div>
	     <div id="productNoticeModal" class="modal fade" role="dialog">
	         <div class="modal-dialog modal-sm" role="document">
	            <div class="modal-content">
	               <div class="modal-header">
	                  <button type="button" class="close" data-dismiss="modal">&times;</button>
	               </div>
	               <div class="modal-body">
	               	<p><span id="productNoticeModalMsg"> Some text in modal</span>
	               </div>
	               <div class="modal-footer" style="text-align:center">
	                  <button type="button" class="btn btn-success" data-dismiss="modal">확인</button>
	               </div>
	            </div>
	         </div>
	     </div>
	</form>
</body>
</html>