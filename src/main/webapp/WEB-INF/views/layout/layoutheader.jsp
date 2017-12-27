<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
</head>
<script type="text/javascript">
$(document).ready(function() {
	$(function(){
	  var current_page_URL = location.href;
	  $("a").each(function() {
	     if ($(this).attr("href") !== "#") {
	       var target_URL = $(this).prop("href");
	       if (target_URL == current_page_URL) {
	          $('nav a').parents('li, ul').removeClass('active');
	          $(this).parent('li').addClass('active');
	          return false;
	       }
	     }
	  });
	});
});
</script>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav" >
        <li class="active"><a href="index">Home</a></li>
        <li><a href="boardPageList?find">게시판</a></li>
        <li><a href="boardDatatable">DataTable</a></li>
        <li><a href="locationMap">찾아오는 길</a></li>
        <c:choose>
       		<c:when test="${sessionemail==null}">
			</c:when>
			<c:when test="${sessionemail=='admin@admin.com'}">
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Salary <span class="caret">
					<ul class="dropdown-menu">
			         	<li><a href="salaryInsertForm">급여 등록</a></li>
						<li><a href="salaryList">급여 리스트</a></li>
						<li><a href="salaryTaxForm">급여 계산</a></li>
						<li><a href="salaryTaxList?yyyy&mm">급여 계산 리스트</a></li>
						<li><a href="salaryRegister?yyyy&mm">급여 대장</a></li>
			        </ul>
				</li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">&nbsp재고관리 <span class="caret">
					<ul class="dropdown-menu">
			         	<li><a href="productInsertForm">상품 등록</a></li>
			         	<li><a href="productBuyForm">매입 관리</a></li>
			         	<li><a href="productSaleForm">매출 관리</a></li>
			         	<li><a href="buyStatement">매입장</a></li>
			         	<li><a href="saleStatement">매출장</a></li>
			         	<li><a href="productList">수불장</a></li>
			         	<li><a href="taskCloseForm">월말(년말)마감</a></li>
			         	<li><a href="balanceForm">거래현황</a></li>
			        </ul>
				</li>
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">&nbsp거래처 관리 <span class="caret">
					<ul class="dropdown-menu">
			         	<li><a href="venderInsertForm">거래처등록</a></li>
			         	<li><a href="venderList">거래처리스트</a></li>
			        </ul>
				</li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp설정 <span class="caret">
					<ul class="dropdown-menu">
			         	<li><a href="memberList">회원정보</a></li>
						<li><a href="memberDirectUpdate?email=${member.email}">정보수정</a></li>
			        </ul>
				</li>
			</c:when>
			<c:otherwise>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">설정 <span class="caret">
					<ul class="dropdown-menu">
						<li><a href="memberDirectUpdate?email=${member.email}">정보수정</a></li>
			        </ul>
				</li>
			</c:otherwise>
		</c:choose>	
      </ul>
      <ul class="nav navbar-nav navbar-right">
      		<c:choose>
				<c:when test="${sessionemail==null}">
					<li><a href="member_insert"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					<li><a href="loginForm"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
				</c:when>
				<c:when test="${sessionemail=='admin@admin.com'}">
					<li><a href="member_insert"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					<li><a href="logout"><span>${sessionname}</span>&nbsplogout</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="logout"><span>${sessionname}</span>&nbsplogout</a></li>
				</c:otherwise>
			</c:choose>	
      </ul>
    </div>
  </div>
</nav>
</body>
</html>