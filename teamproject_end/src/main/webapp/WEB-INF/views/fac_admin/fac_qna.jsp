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
  
    <c:if test="${session_member != 'seller' }">
 		 <script type="text/javascript">
  	 	 alert("잘못된 경로입니다")
  		 location.href="login"
  		 </script>
  	</c:if>
  	  <style>
  	  .container-fluid{
  		height: 85%;
  	}
  	.row{
  		height: 100%;
  	}
  	#mb-4{
  		height: 100%;
  	}
  	.table-responsive{
  		height: 100%;
  	}
    .fac_view_btn{
      width: 50px;
      height: 30px;
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
        
        
        <!-- 구현 부분-->
          <!-- 구현 부분-->
        <div class="container-fluid" id="container-wrapper">
          <!-- Row -->
          <div class="row">
            <!-- Datatables -->
            <div class="col-lg-12">
              <div class="card mb-4" id="mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h3 class="m-0 font-weight-bold text-primary">문의 현황</h3>
				  <a href="qBoardWrite" class="btn btn-primary" id="fac_save">문의하러 가기</a>
                </div>
          <div class="table-responsive p-3">
            <table class="table align-items-center table-flush table-hover" id="dataTableHover">
              <thead class="thead-light">
                <tr>
                  <th>문의 제목</th>
                  <th>문의 날짜</th>
                  <th>답변 여부</th>
                  <th>VIEW</th>
                </tr>
              </thead>
            <!-- 데이터 들어오는 부분 -->
              <tbody>
              <c:forEach items="${map.list }" var = "qBoardVo">
                <tr>
                  <td>${qBoardVo.q_title }</td>
                  <td>${qBoardVo.q_date }</td>
                  <c:if test="${qBoardVo.q_status == '0' }">
	                  <td>답변대기</td>
                  </c:if>
                  <c:if test="${qBoardVo.q_status == '1' }">
	                  <td>답변완료</td>
                  </c:if>
                  <td><a href="qBoardView?q_num=${qBoardVo.q_num }">VIEW</a></td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
          
		        </DIV>
		</div>
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

   <!-- Page level plugins -->
   <script src="vendor/datatables/jquery.dataTables.min.js"></script>
   <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
 
   <!-- Page level custom scripts -->
   <script>
     $(document).ready(function () {
       $('#dataTable').DataTable(); // ID From dataTable 
       $('#dataTableHover').DataTable(); // ID From dataTable with Hover
     });
   </script>
</body>

</html>