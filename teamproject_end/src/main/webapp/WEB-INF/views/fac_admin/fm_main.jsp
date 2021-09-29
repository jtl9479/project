<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="utf-8">
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="img/logo/logo.png" rel="icon">
  <title>Team of Yul</title>
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="css/ruang-admin.min.css" rel="stylesheet">
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  <link href="css/fac_register.css" rel="stylesheet">
   <c:if test="${session_member != 'seller' }">
 		 <script type="text/javascript">
  	 	 alert("잘못된 경로입니다")
  		 location.href="login"
  		 </script>
  	</c:if>
	<style type="text/css">
		.box_outline{
			display: inline-block;
			width: 100%;
			text-align: center;
		}
		.info_box_outline{
			width:250px;
			height: 250px;
			border-radius: 100%;
			text-align: center;
			background-color: #ffffff;
			display: inline-block;
			border:3px solid #f7f7f7;
			margin:2%;
			
		}
		.info_div{
			margin-top:10%;
			font-size: 20px;
			color: #555;
			font-weight: bold;
			display: inline-block;
			
		}
		.info_count{
			margin-top:35px;
			font-size: 50px;
		}
		.number_span{
			color:#9a61ff; 
			font-weight: bold;
			font-size:55px;
		}
	</style>
</head>

<body id="page-top">
  <div id="wrapper">
    <!-- Sidebar -->
    <jsp:include page="../include/sellerSideBar.jsp"></jsp:include>
    <!-- Sidebar -->
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <!-- TopBar -->
       <jsp:include page="../include/sellerTopBar.jsp"></jsp:include>
        <!-- Topbar -->
        <div id = "info_box">
	        <div class = "box_outline">
	        <a href = "fac_reserve">
	        	<div class = "info_box_outline">
	        		<div class = "info_div">예약 개수</div>
	        		<div class = "info_count"><span class = "number_span">${map.reserNo }</span>개</div>
	        	</div>
	        </a>
	        <a href = "fac_list">
	        	<div class = "info_box_outline">
	        		<div class = "info_div">시설등록 개수</div>
	        		<div class = "info_count"><span class = "number_span">${map.finfoNo }</span>개</div>
	        	</div>
	        </a>
	        <a href = "fac_comment">
	        	<div class = "info_box_outline">
	        		<div class = "info_div">리뷰 개수</div>
	        		<div class = "info_count"><span class = "number_span">${map.reviewNo }</span>개</div>
	        	</div>
	        </a>
	        </div>
	        <div class = "box_outline">
	        <a href = "fm_money">
	        	<div class = "info_box_outline">
	        		<div class = "info_div">결제 개수</div>
	        		<div class = "info_count"><span class = "number_span">${map.payNo }</span>개</div>
	        	</div>
	        </a>
	        <a href = "fm_money">
	        	<div class = "info_box_outline">
	        		<div class = "info_div">환불/취소 개수</div>
	        		<div class = "info_count"><span class = "number_span">${map.refundNo }</span>개</div>
	        	</div>
	        </a>
	        </div>
        </div>

  
      </div>

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>copyright &copy; <script> document.write(new Date().getFullYear()); </script> - developed by <b><a href="https://indrijunanda.gitlab.io/"
                  target="_blank">indrijunanda</a></b> </span>
          </div>
        </div>
      </footer>

    </div>
  </div>
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="js/ruang-admin.min.js"></script>
</body>

</html>