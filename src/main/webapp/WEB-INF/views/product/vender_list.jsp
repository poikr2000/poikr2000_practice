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
	$('#venderallchk').on("click",function(){
		if($(this).is(':checked')){
			$('input[name=venderunitchk]').prop('checked',true);
		}else{
			$('input[name=venderunitchk]').prop('checked',false);
		}
	});
	$('#venderexample').DataTable( {
        dom: 'Brftip',
        buttons: [
            {
                text: 'insert',
                action: function ( e, dt, node, config ) {
                	var url="venderInsertForm";
        			$(location).attr('href',url);
                }
            },
            {
                text: 'delete',
                action: function ( e, dt, node, config ) {
                	var checkboxarr=[];
                	$("input[name='venderunitchk']:checked").each(function(){
                		checkboxarr.push($(this).val());
                	});
                	if(checkboxarr.length>0){
                		$('#venderselectedmodalmsg').text("삭제 하시겠습니까?")
                		$('#venderSelectedDeleteModal').modal('show');
                		$('#venderSelectedModalDeleteBtn').on('click',function(){
                			$('.venderlist_form').submit();
                		});
                	}else{
            			$('#venderNoticeModalMsg').text("선택된 항목이 없습니다.")
                		$('#venderNoticeModal').modal('show');
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
<form class="venderlist_form" action="venderSelectedDelete" method="post">
		<div class="container col-sm-offset-1 col-sm-10" align="center">
			<div class="row" style="margin-top:20px">
				  <div align="center" style="font-size: 50px"><i class="fa fa-sign-in" aria-hidden="true"></i>거래처 리스트</div>
			</div>
			<div style="margin-top:40px">
					<table id="venderexample" class="table table-striped table-bordered" cellspacing="0" width="100%">
			        <thead>
			            <tr>
			                <th>코드</th>
			                <th>상호</th>
			                <th>사업자 번호</th>
			                <th>사업주</th>
							<th>전화번호</th>
			            </tr>
			        </thead>
			        <tbody>
			        	<c:forEach var="vender" items="${venders}">
			        		<c:choose>
			        			<c:when test="${vender.ceoname=='0'}">
			        				<tr>
			        					<td class="text-center" colspan="5"><strong>매입처</strong></td>
			        				</tr>
			        			</c:when>
			        			<c:when test="${vender.ceoname=='00'}">
			        				<tr>
			        					<td class="text-center" colspan="5"><strong>매출처</strong></td>
			        				</tr>
			        			</c:when>
			        			<c:otherwise>
				        			<tr>
										<td class="text-center"><a href="venderUpdateForm?code=${vender.code}">${vender.code}</a></td>
										<td class="text-center" style="vertical-align:middle;">${vender.name}</td>
										<td class="text-center" style="vertical-align:middle;">${vender.busno1}-${vender.busno2}-${vender.busno3}</td>
										<td class="text-center" style="vertical-align:middle;">${vender.ceoname}</td>
										<td class="text-center" style="vertical-align:middle;">${vender.officeno1}-${vender.officeno2}-${vender.officeno3}</td>
									</tr>
				        		</c:otherwise>
				        	</c:choose>
						</c:forEach>
			        </tbody>
			    </table>
			</div>
		</div>
		<div id="venderSelectedDeleteModal" class="modal fade" role="dialog">
	         <div class="modal-dialog modal-sm" role="document">
	            <div class="modal-content">
	               <div class="modal-header">
	                  <button type="button" class="close" data-dismiss="modal">&times;</button>
	               </div>
	               <div class="modal-body">
	               	<p><span id="venderselectedmodalmsg"> Some text in modal</span>
	               </div>
	               <div class="modal-footer" style="text-align:center">
	                  <button type="button" id="venderSelectedModalDeleteBtn"class="btn btn-success" data-dismiss="modal">삭제</button>
	                  <button type="button" class="btn btn-success" data-dismiss="modal">취소</button>
	               </div>
	            </div>
	         </div>
	     </div>
	     <div id="venderNoticeModal" class="modal fade" role="dialog">
	         <div class="modal-dialog modal-sm" role="document">
	            <div class="modal-content">
	               <div class="modal-header">
	                  <button type="button" class="close" data-dismiss="modal">&times;</button>
	               </div>
	               <div class="modal-body">
	               	<p><span id="venderNoticeModalMsg"> Some text in modal</span>
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