<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
  <link href="css/member/ruang-admin.min.css" rel="stylesheet">



  
      <c:if test="${session_member != 'member' }">
 		 <script type="text/javascript">
  	 	 alert("잘못된 경로입니다")
  		 location.href="login"
  		 </script>
  		</c:if>
  		
  		<style type="text/css">
  		
  		.row{
  			height: 1000px;
  			width: 95%;
  			margin: auto;
  		}
  		.text-primary{
  			font-size: 22px;
  		}
  		
  		</style>

</head>

<body id="page-top">
  <div id="wrapper">
    <!-- Sidebar -->
    <jsp:include page="../include/memberSideBar.jsp"></jsp:include>
    <!-- Sidebar -->
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <!-- TopBar -->
       <jsp:include page="../include/memberTopBar.jsp"></jsp:include>
        <!-- Topbar -->
        
        <div class="row">
            <!-- Datatables -->
            <div class="col-lg-12">
              <div class="card mb-4" id="mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <a href="member_reserve"><h3 class="m-0 font-weight-bold text-primary">예약 리스트 목록 (최근3개만 조회됩니다)</h3></a>
                </div>
          
          <div class="table-responsive p-3">
            <table class="table align-items-center table-flush table-hover" id="dataTableHover">
              <thead class="thead-light">
                <tr>
                  <th>NO.</th>
                  <th>시설 이름</th>
                  <th>시설 가격</th>
                  <th>신청 날짜</th>
                  <th>예약 날짜</th>
                  <th>예약 시간</th>
                  <th>예약상태</th>
                  <th>VIEW</th>
                </tr>
              </thead>
             
            <!-- 데이터 들어오는 부분 -->
              <tbody>
                    <c:set value="${fn:length(reserlist) }" var="a"/>
              		<c:if test="${a >=4 }">
              		
              <c:set value="${reserlist}" var="rVo"/>
  				<tr>
                  <td>${rVo[a-1].reser_no }</td>
                  <td>${rVo[a-1].finfo_name }</td>
                  <td>${rVo[a-1].finfo_price }원</td>
                  <td>${rVo[a-1].apply_date }</td>
                  <td>${rVo[a-1].reser_date }</td>
                  <td>${rVo[a-1].reser_time }</td>
                  <c:if test="${rVo[a-1].reser_status == '0' }">
                  	<td>예약완료</td>
                  </c:if>
                  <c:if test="${rVo[a-1].reser_status == '1' }">
                  	<td>예약취소</td>
                  </c:if>
                  <td><a href="payment?reser_no=${rVo[a-1].reser_no }">VIEW</a></td> 
                </tr>	<tr>
                  <td>${rVo[a-2].reser_no }</td>
                  <td>${rVo[a-2].finfo_name }</td>
                  <td>${rVo[a-2].finfo_price }원</td>
                  <td>${rVo[a-2].apply_date }</td>
                  <td>${rVo[a-2].reser_date }</td>
                  <td>${rVo[a-2].reser_time }</td>
                  <c:if test="${rVo[a-2].reser_status == '0' }">
                  	<td>예약완료</td>
                  </c:if>
                  <c:if test="${rVo[a-2].reser_status == '1' }">
                  	<td>예약취소</td>
                  </c:if>
                  <td><a href="payment?reser_no=${rVo[a-2].reser_no }">VIEW</a></td> 
                </tr>	<tr>
                  <td>${rVo[a-3].reser_no }</td>
                  <td>${rVo[a-3].finfo_name }</td>
                  <td>${rVo[a-3].finfo_price }원</td>
                  <td>${rVo[a-3].apply_date }</td>
                  <td>${rVo[a-3].reser_date }</td>
                  <td>${rVo[a-3].reser_time }</td>
                  <c:if test="${rVo[a-3].reser_status == '0' }">
                  	<td>예약완료</td>
                  </c:if>
                  <c:if test="${rVo[a-3].reser_status == '1' }">
                  	<td>예약취소</td>
                  </c:if>
                  <td><a href="payment?reser_no=${rVo[a-3].reser_no }">VIEW</a></td> 
                </tr>	
               
              </c:if>
              <c:if test="${a<4 }">
             <c:forEach items="${reserlist }" var = "rVo">
                <tr>
                  <td>${rVo.reser_no }</td>
                  <td>${rVo.finfo_name }</td>
                  <td>${rVo.finfo_price }원</td>
                  <td>${rVo.apply_date }</td>
                  <td>${rVo.reser_date }</td>
                  <td>${rVo.reser_time }</td>
                  <c:if test="${rVo.reser_status == '0' }">
                  	<td>예약완료</td>
                  </c:if>
                  <c:if test="${rVo.reser_status == '1' }">
                  	<td>예약취소</td>
                  </c:if>
                  <td><a href="payment?reser_no=${rVo.reser_no }">VIEW</a></td> 
                </tr>
              </c:forEach>
              </c:if>
              </tbody>
            </table>
           </div>
          </div>
          </div>
          
          <!-- ------------------------------------------ -->
            <!-- DataTable with Hover -->
            <div class="col-lg-12">
              <div class="card mb-4" id="mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <a href="member_qua"><h3 class="m-0 font-weight-bold text-primary">관리자 1대1문의 현황 (최근3개만 조회됩니다)</h3></a>
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
              <c:set value="${fn:length(map.list) }" var="a"/>
              		<c:if test="${a >=4 }">
              <c:set value="${map.list}" var="qBoardVo"/>
  				<tr>
            	  <td>${qBoardVo[a-1].q_title }</td>
                  <td>${qBoardVo[a-1].q_date }</td>
					<c:if test="${qBoardVo[a-1].q_status == '0'}">
	                  <td>답변대기</td>
                  </c:if>
                  <c:if test="${qBoardVo[a-1].q_status == '1'}">
	                  <td>답변완료</td>
                  </c:if>
                   <td><a href="qBoardView?q_num=${qBoardVo[a-1].q_num }">VIEW</a></td>
            	</tr>	
  				<tr>
            	  <td>${qBoardVo[a-2].q_title }</td>
                  <td>${qBoardVo[a-2].q_date }</td>
					<c:if test="${qBoardVo[a-2].q_status == '0'}">
	                  <td>답변대기</td>
                  </c:if>
                  <c:if test="${qBoardVo[a-2].q_status == '1'}">
	                  <td>답변완료</td>
                  </c:if>
                   <td><a href="qBoardView?q_num=${qBoardVo[a-2].q_num }">VIEW</a></td>
            	</tr>	
  				<tr>
            	  <td>${qBoardVo[a-3].q_title }</td>
                  <td>${qBoardVo[a-3].q_date }</td>
					<c:if test="${qBoardVo[a-3].q_status == '0'}">
	                  <td>답변대기</td>
                  </c:if>
                  <c:if test="${qBoardVo[a-3].q_status == '1'}">
	                  <td>답변완료</td>
                  </c:if>
                   <td><a href="qBoardView?q_num=${qBoardVo[a-3].q_num }">VIEW</a></td>
            	</tr>	
              </c:if>
              <c:if test="${a < 4 }">
              <c:forEach items="${map.list }" var = "qBoardVo">
                <tr>
                  <td>${qBoardVo.q_title }</td>
                  <td>${qBoardVo.q_date }</td>
                  <c:if test="${qBoardVo.q_status == '0'}">
	                  <td>답변대기</td>
                  </c:if>
                  <c:if test="${qBoardVo.q_status == '1'}">
	                  <td>답변완료</td>
                  </c:if>
                  <td><a href="qBoardView?q_num=${qBoardVo.q_num }">VIEW</a></td>
                </tr>
              </c:forEach>
              </c:if>
              </tbody>
            </table>
         </div>
          </div>
          </div>
             <!-- DataTable with Hover -->
            <div class="col-lg-12">
              <div class="card mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <a href="member_board"><h6 class="m-0 font-weight-bold text-primary">자유게시판 작성 목록 (최근3개만 조회됩니다)</h6></a>
                </div>
                <div class="table-responsive p-3">
                  <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                    <thead class="thead-light">
                      <tr>
                  <th>게시판 제목</th>
                  <th>카테고리</th>
                  <th>게시판 날짜</th>
                  <th>조회수</th>
                  <th>VIEW</th>
                </tr>
                    </thead>
                    <!-- 데이터 들어오는 부분 -->
              <tbody>
                    <c:set value="${fn:length(list) }" var="a"/>
              		<c:if test="${a >=4 }">
              <c:set value="${list}" var="board"/>
  				<tr>
            	  <td>${board[a-1].fbm_title }</td>
                  <td>${board[a-1].fbm_category }</td>
                  <td>${board[a-1].fbm_date }</td>
                  <td>${board[a-1].fbm_hit }</td>
                  <td><a href="freeBoardMemberView?fbm_num=${board[a-1].fbm_num }">VIEW</a></td>
            	</tr>	
                <tr>
            	  <td>${board[a-2].fbm_title }</td>
                  <td>${board[a-2].fbm_category }</td>
                  <td>${board[a-2].fbm_date }</td>
                  <td>${board[a-2].fbm_hit }</td>
                  <td><a href="freeBoardMemberView?fbm_num=${board[a-2].fbm_num }">VIEW</a></td>
            	</tr>	
            	<tr>
            	  <td>${board[a-3].fbm_title }</td>
                  <td>${board[a-3].fbm_category }</td>
                  <td>${board[a-3].fbm_date }</td>
                  <td>${board[a-3].fbm_hit }</td>
                  <td><a href="freeBoardMemberView?fbm_num=${board[a-3].fbm_num }">VIEW</a></td>
            	</tr>	
              </c:if>
              
              
              
              		<c:if test="${a <4 }">
            			<c:forEach items="${list }" var="board">
			            	 <tr>
			            	  <td>${board.fbm_title }</td>
			                  <td>${board.fbm_category }</td>
			                  <td>${board.fbm_date }</td>
			                  <td>${board.fbm_hit }</td>
			                  <td><a href="freeBoardMemberView?fbm_num=${board.fbm_num }">VIEW</a></td>
			            	</tr>	
            			</c:forEach>
            		</c:if>
              </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <!--Row-->
        
        <!-- 구현 부분-->
  
  
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