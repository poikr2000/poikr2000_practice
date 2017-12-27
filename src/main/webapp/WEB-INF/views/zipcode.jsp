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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
$(document).ready(function(){
	 $('#searchBtn').click(function(e){
         e.preventDefault();
         var dong = $('#dong').val()
         $.ajax({
             url: '<c:url value="/zipcode/list"/>',
             data: "dong="+dong,
             type: 'POST',
             dataType: 'json',
             success: function(result) {
                  
                 $("#zipcodeList").empty();
                  
                 var html = '';
                  
                 if (result.errorCode != null && result.errorCode != '') {
                     html += '<tr>';
                     html += '   <td colspan="2">';
                     html +=         result.errorMessage;
                     html += '   <td>';
                     html += '</tr>';
                      
                 } else {
                     var list = result.list;
                      
                     for(var i = 0; i < list.length ; i++) {
                         html += '<tr>';
                         html += '   <td>';
                          
                         var zipcode = list[i].zipcode;
                          
                         if (zipcode != null && zipcode.length > 5) {
                             var preZipcode = zipcode.substring(0, 3);
                             var afterZipcode = zipcode.substring(3, 6);
                              
                             zipcode = preZipcode + '-' + afterZipcode;
                         }
                          
                         html +=         zipcode;
                         html += '   </td>';
                         html += '   <td>';

                         if (list[i].lnmAddress != null && list[i].lnmAddress != '') {
                             html +=     list[i].lnmAddress;
                             html += '   <br/>';
                         }
                          
                         html +=         list[i].address;
                         html += '   </td>';
                         html += '</tr>';
                     }
                 }
                  
                 $("#zipcodeList").append(html);
             }
         });
     });
});
</script>
</content>
<body>
<form>
	<div class="container col-sm-offset-3 col-sm-6" align="center">
		   <input type="radio" name="target" value="post" checked=""> 지번 우편번호<br><br>
        <input type="radio" name="target" value="postRoad"> 도로명 우편번호<br><br>
        <strong>검색할 도로명과 건물번호를 정확히 입력하십시오!<br> 
        찾고자 하는 주소 : 서울특별시 종로구 세종로 17 세종문화회관 검색(입력)방법 
        예시 : 도로명 + 건물번호 => 세종로 17</strong><br><br>
        <input type="radio" name="target" value="newPost"> 지번 우편번호(2015년 8월 1일 시행되는 5자리 구역번호)<br>
        <input type="radio" name="target" value="newPostRoad"> 도로명 우편번호(2015년 8월 1일 시행되는 5자리 구역번호)
        <br><br>
        <input type="text" name="dong" id="dong">
        <input type="button" value="검색" id="searchBtn">
        <p>
    </p><div>
        <table border="1">
            <thead>
                <tr>
                    <th style="width:150px;">우편번호</th>
                    <th style="width:600px;">내용</th>
                </tr>
            </thead>
            <tbody id="zipcodeList"></tbody>
        </table>
    </div>
	</div>
</form>
    
</body>
</html>