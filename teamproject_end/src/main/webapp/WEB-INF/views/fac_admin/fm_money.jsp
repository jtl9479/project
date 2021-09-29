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
   <link href="css/member/fm_money.css" rel="stylesheet"> 
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
   <c:if test="${session_member != 'seller' }">
        <script type="text/javascript">
          alert("잘못된 경로입니다")
         location.href="login"
         </script>
     </c:if>
     
     <script type="text/javascript">
     	
     	var dayresult1 = "${map.dateresult1}";
     	var dayresult2 = "${map.dateresult2}";
     	var dayresult3 = "${map.dateresult3}";
     	var dayresult4 = "${map.dateresult4}";
     	var dayresult5 = "${map.dateresult5}";
     	var dayresult6 = "${map.dateresult6}";
     	
     	$(function(){
     		
     		$(".bar1").css("height",dayresult1*15+20);
     		$(".bar1 span").text(dayresult1);

     		$(".bar2").css("height",dayresult2*15+20);
     		$(".bar2 span").text(dayresult2);
     		
     		$(".bar3").css("height",dayresult3*15+20);
     		$(".bar3 span").text(dayresult3);
     		
     		$(".bar4").css("height",dayresult4*15+20);
     		$(".bar4 span").text(dayresult4);
     		
     		$(".bar5").css("height",dayresult5*15+20);
     		$(".bar5 span").text(dayresult5);
     		
     		$(".bar6").css("height",dayresult6*15+20);
     		$(".bar6 span").text(dayresult6);
     		
     	})
     
     
     </script>

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
        
        
        <!-- 정산 시작 -->
       <div class="container-fluid" id="container-wrapper">
          <!-- Row -->
          <div class="row">
            <!-- Datatables -->
            <div class="col-lg-12">
              <div class="card mb-4" id="mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h3 class="m-0 font-weight-bold text-primary">정산 관리</h3>
                </div>
                 <div>
					    <ul class="graph">
					        <li class="graph-bar bar1"><span>0</span></li>
					        <li class="graph-bar bar2"><span>0</span></li>
					        <li class="graph-bar bar3"><span>0</span></li>
					        <li class="graph-bar bar4"><span>0</span></li>   
					        <li class="graph-bar bar5"><span>0</span></li>   
					        <li class="graph-bar bar6"><span>0</span></li>   
					    </ul>
					    <ul class="graph1">
					        <li class="graph-name name1" >
					            <span id="name1">09/23</span>
					        </li>
					        <li class="graph-name name2">
					            <span id="name2">09/24</span>
					        </li>
					        <li class="graph-name name3">
					            <span id="name3">09/25</span>
					        </li>
					        <li class="graph-name name4">
					            <span id="name4">09/26</span>
					        </li>
					        <li class="graph-name name5">
					            <span id="name5">09/27</span>
					        </li>
					        <li class="graph-name name6">
					            <span id="name6">09/28</span>
					        </li>
					        
					    </ul>
					</div>
    
                
             <table class="table align-items-center table-flush table-hover" style="border:1px solid black; padding: 20px;">
                <thead class="thead-light">
                      <tr>
                        <th>판매 금액(A)</th>
                        <th>환불 금액(B)</th>
                        <th>정산 예정금액(A-B)</th>
                      </tr>
                 </thead>
                 <tbody>
                       <tr>
                        <td>${map.totalPrice }원</td>
                        <td>${map.totalRefund }원</td>
                        <td>${map.totalPrice-map.totalRefund}원</td>
                      </tr>
                 </tbody>
              </table>   
             <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
               <h3 class="m-0 font-weight-bold text-primary">판매 리스트</h3>
             </div>
             <div class="table-responsive p-3">
               <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                 <thead class="thead-light">
                   <tr>
                     <th>예약 번호</th>
                     <th>구매자 이름</th>
                     <th>결제 상태</th>
                     <th>결제 금액</th>
                     <th>환불 금액</th>
                     <th>결제 완료일</th>
                     <th>환불 완료일</th>
                   </tr>
                 </thead>
                 <tbody>
                 <c:forEach items="${map.list }" var = "paymentVo">
                   <c:if test="${paymentVo.pay_status == '0' }">
                   <tr>
                     <td>${paymentVo.reser_no }</td>
                     <td>${paymentVo.m_name }</td>
                     <c:if test="${paymentVo.pay_status == '0' }">
	                     <td>결제완료</td>
                     </c:if>
                     <c:if test="${paymentVo.pay_status == '1' }">
	                     <td>결제취소</td>
                     </c:if>
                     <td>${paymentVo.pay_price }원</td>
                     <td></td>
                     <td>${paymentVo.pay_date }</td>
                     <td></td>
                   </tr>
                   </c:if>
                   <c:if test="${paymentVo.pay_status == '1' }">
                   <tr>
                     <td>${paymentVo.reser_no }</td>
                     <td>${paymentVo.m_name }</td>
                     <td>결제완료</td>
                     <td>${paymentVo.pay_price }원</td>
                     <td></td>
                     <td>${paymentVo.pay_date }</td>
                     <td></td>
                   </tr>
                   <tr>
                     <td>${paymentVo.reser_no }</td>
                     <td>${paymentVo.m_name }</td>
                     <td><span class = "cancel_span">결제취소</span></td>
                     <td></td>
                     <td><span class = "cancel_span">${paymentVo.pay_price }</span>원</td>
                     <td></td>
                     <td>${paymentVo.refund_date }</td>
                   </tr>
                   </c:if>
                 </c:forEach>
                 </tbody>
               
               </table>
             </div>
           </div>
             
        </DIV>

      </div>
   <!-- 정산 끝 -->
      
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