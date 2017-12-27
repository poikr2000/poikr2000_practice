<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<content tag="local_script">
<script>
$(document).ready(function(){
	$('#allchk').on("click",function(){
		if($(this).is(':checked')){
			$('input[name=unitchk]').prop('checked',true);
		}else{
			$('input[name=unitchk]').prop('checked',false);
		}
	});
	$('#salaryexample').DataTable( {
        dom: 'Brftip',
        buttons: [
            {
                text: 'insert',
                action: function ( e, dt, node, config ) {
                	var url="salaryInsertForm";
        			$(location).attr('href',url);
                }
            },
            {
                text: 'delete',
                action: function ( e, dt, node, config ) {
                	var checkboxarr=[];
                	$("input[name='unitchk']:checked").each(function(){
                		checkboxarr.push($(this).val());
                	});
                	if(checkboxarr.length>0){
                		$('#salaryselectedmodalmsg').text("삭제 하시겠습니까?")
                		$('#salarySelectedDeleteModal').modal('show');
                		$('#salarySelectedModalDeleteBtn').on('click',function(){
                			$('.salarylistform').submit();
                		});
                	}else{
            			$('#salaryNoticeModalMsg').text("선택된 항목이 없습니다.")
                		$('#salaryNoticeModal').modal('show');
            			return;
            		}
                }
            }
        ]
    } );
});
</script>
</content>
</head>
<body>
	<form class="salarylistform" action="salarySelectedDelete" method="post">
		<div class="container col-sm-offset-2 col-sm-8" align="center">
			<div class="row" style="margin-top:20px">
				  <div align="center" style="font-size: 50px"><i class="fa fa-sign-in" aria-hidden="true"></i>급여 리스트</div>
			</div>
			<div style="margin-top:40px">
					<table id="salaryexample" class="table table-striped table-bordered" cellspacing="0" width="100%">
			        <thead>
			            <tr>
			                <th><input type="checkbox" id="allchk"></th>
			                <th>사원번호</th>
			                <th>부서</th>
			                <th>성명</th>
			                <th>기본급</th>
							<th>수당</th>
							<th>배우자</th>
							<th>부양20</th>
							<th>부양60</th>
							<th>장애인</th>
							<th>여성가장</th>
							<th>처리유무</th>
			            </tr>
			        </thead>
			        <tbody>
			        	<c:forEach var="salarys" items="${salarys}">
							<tr>
								<td class="text-center"><input type="checkbox" id="unitchk" name="unitchk" value="${salarys.empno}"></td>
								<td class="text-center"><a href="salaryUpdateForm?empno=${salarys.empno}"><c:if test="${boards.b_step==1}"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i></c:if>${salarys.empno}</a></td>
								<td class="text-center">${salarys.depart}</td>
								<td class="text-center">${salarys.name}</td>
								<td class="text-center">${salarys.pay}</td>
								<td class="text-center">${salarys.extra}</td>
								<td class="text-center">${salarys.partner}</td>
								<td class="text-center">${salarys.dependent20}</td>
								<td class="text-center">${salarys.dependent60}</td>
								<td class="text-center">${salarys.disabled}</td>
								<td class="text-center">${salarys.womanpower}</td>
								<td class="text-center">${salarys.yn}</td>
							</tr>
						</c:forEach>
			        </tbody>
			    </table>
			</div>
		</div>
		<div id="salarySelectedDeleteModal" class="modal fade" role="dialog">
	         <div class="modal-dialog modal-sm" role="document">
	            <div class="modal-content">
	               <div class="modal-header">
	                  <button type="button" class="close" data-dismiss="modal">&times;</button>
	               </div>
	               <div class="modal-body">
	               	<p><span id="salaryselectedmodalmsg"> Some text in modal</span>
	               </div>
	               <div class="modal-footer" style="text-align:center">
	                  <button type="button" id="salarySelectedModalDeleteBtn"class="btn btn-success" data-dismiss="modal">삭제</button>
	                  <button type="button" class="btn btn-success" data-dismiss="modal">취소</button>
	               </div>
	            </div>
	         </div>
	     </div>
	     <div id="salaryNoticeModal" class="modal fade" role="dialog">
	         <div class="modal-dialog modal-sm" role="document">
	            <div class="modal-content">
	               <div class="modal-header">
	                  <button type="button" class="close" data-dismiss="modal">&times;</button>
	               </div>
	               <div class="modal-body">
	               	<p><span id="salaryNoticeModalMsg"> Some text in modal</span>
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