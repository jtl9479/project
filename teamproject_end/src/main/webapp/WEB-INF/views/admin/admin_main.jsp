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
  <link href="css/ruang-admin.min.css" rel="stylesheet">
  
  
  <c:if test="${session_member != 'admin' }">
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
    <jsp:include page="../include/adminSideBar.jsp"></jsp:include>
    <!-- Sidebar -->
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <!-- TopBar -->
        <jsp:include page="../include/adminTopBar.jsp"></jsp:include>
        <!-- Topbar -->
        
        <!-- 구현 부분-->
       <div id = "info_box">
	        <div class = "box_outline">
	        <a href = "admin_member_list">
	        	<div class = "info_box_outline">
	        		<div class = "info_div">회원 수</div>
	        		<div class = "info_count"><span class = "number_span">${map.memberCount }</span>명</div>
	        	</div>
	        </a>
	        <a href = "admin_fac_list">
	        	<div class = "info_box_outline">
	        		<div class = "info_div">시설관리자 수</div>
	        		<div class = "info_count"><span class = "number_span">${map.fmanagerCount }</span>명</div>
	        	</div>
	        </a>
	        </div>
	  </div>
	  <!-- 테이블 공지사항 -->
	  
	   <div class="container-fluid" id="container-wrapper">
          <!-- Row -->
          <div class="row">
            <!-- Datatables -->
            <div class="col-lg-12">
              <div class="card mb-4" id="mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <a href="noticeboard_list"><h3 class="m-0 font-weight-bold text-primary">공지사항 게시판 리스트 (상위 3개만 보입니다)</h3></a>
		            <a href="/noticeBoardWrite?n_num=${NoticeBoardVo.n_num }" class="btn btn-primary" id="fac_save">공지사항 작성</a>
                </div>
          <div class="table-responsive p-3">
            <table class="table align-items-center table-flush table-hover" id="dataTableHover">
              <thead class="thead-light">
                <tr>
                  <th>NO.</th>
                  <th>공지사항 제목</th>
                  <th>관리자 아이디</th>
                  <th>작성일</th>
                  <th>조회수</th>
                  <th>VIEW</th>
                </tr>
              </thead>
            <!-- 데이터 들어오는 부분 -->
              <tbody>
              <c:set value="${fn:length(Noticelist) }" var="a"/>
              <c:if test="${a >=4 }">
              <c:set value="${Noticelist}" var="NoticeBoardVo"/>
  				<tr>
                  <td>${NoticeBoardVo[0].n_num }</td>
                  <td>${NoticeBoardVo[0].n_title }</td>
                  <td>${NoticeBoardVo[0].a_id }</td>
                  <td>${NoticeBoardVo[0].n_date }</td>
                  <td>${NoticeBoardVo[0].n_hit}</td>
                  <td><a href="/noticeBoardView?n_num=${NoticeBoardVo[0].n_num  }">VIEW</a></td>
                </tr><tr>
                  <td>${NoticeBoardVo[1].n_num }</td>
                  <td>${NoticeBoardVo[1].n_title }</td>
                  <td>${NoticeBoardVo[1].a_id }</td>
                  <td>${NoticeBoardVo[1].n_date }</td>
                  <td>${NoticeBoardVo[1].n_hit}</td>
                  <td><a href="/noticeBoardView?n_num=${NoticeBoardVo[1].n_num  }">VIEW</a></td>
                </tr><tr>
                  <td>${NoticeBoardVo[2].n_num }</td>
                  <td>${NoticeBoardVo[2].n_title }</td>
                  <td>${NoticeBoardVo[2].a_id }</td>
                  <td>${NoticeBoardVo[2].n_date }</td>
                  <td>${NoticeBoardVo[2].n_hit}</td>
                  <td><a href="/noticeBoardView?n_num=${NoticeBoardVo[2].n_num  }">VIEW</a></td>
                </tr>
              </c:if>
              <c:if test="${a <4 }">
              <c:forEach items="${Noticelist }" var="NoticeBoardVo">
              <tr>
                  <td>${NoticeBoardVo.n_num }</td>
                  <td>${NoticeBoardVo.n_title }</td>
                  <td>${NoticeBoardVo.a_id }</td>
                  <td>${NoticeBoardVo.n_date }</td>
                  <td>${NoticeBoardVo.n_hit}</td>
                  <td><a href="/noticeBoardView?n_num=${NoticeBoardVo.n_num  }">VIEW</a></td>
                </tr>
             </c:forEach>
              </c:if>
           </tbody>
            </table>
          </div>
          </div>
          </div>
          </div>
        </div>
	  
	  
	  <div class="container-fluid" id="container-wrapper">
          <!-- Row -->
          <div class="row">
            <!-- Datatables -->
            <div class="col-lg-12">
              <div class="card mb-4" id="mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <a href="eventboard_list"><h3 class="m-0 font-weight-bold text-primary">이벤트 게시판 리스트 (상위 3개만 보입니다)</h3></a>
		             <a href="eventBoardWrite?eb_num=${EventBoardVo.eb_num}" class="btn btn-primary" id="fac_save">이벤트 작성</a>
                </div>
           
          <div class="table-responsive p-3">
            <table class="table align-items-center table-flush table-hover" id="dataTableHover">
              <thead class="thead-light">
                <tr>
                  <th>NO.</th>
                  <th>이벤트 제목</th>
                  <th>관리자 아이디</th>
                  <th>이벤트 기간</th>
                  <th>조회수</th>
                  <th>VIEW</th>
                </tr>
              </thead>
            <!-- 데이터 들어오는 부분 -->
              <tbody>
              <c:set value="${fn:length(Eventlist) }" var="a"/>
              <c:if test="${a >=4 }">
              <c:set value="${Eventlist}" var="EventBoardVo"/>
  				<tr>
                  <td>${EventBoardVo[0].eb_num }</td>
                  <td>${EventBoardVo[0].eb_title }</td>
                  <td>${EventBoardVo[0].a_id }</td>
                  <td>${EventBoardVo[0].eb_start_date }~${EventBoardVo.eb_end_date }</td>
                  <td>${EventBoardVo[0].eb_hit}</td>
                  <td><a href="eventBoardView?eb_num=${EventBoardVo[0].eb_num  }">VIEW</a></td>
                </tr>
               <tr>
                  <td>${EventBoardVo[1].eb_num }</td>
                  <td>${EventBoardVo[1].eb_title }</td>
                  <td>${EventBoardVo[1].a_id }</td>
                  <td>${EventBoardVo[1].eb_start_date }~${EventBoardVo.eb_end_date }</td>
                  <td>${EventBoardVo[1].eb_hit}</td>
                  <td><a href="eventBoardView?eb_num=${EventBoardVo[1].eb_num  }">VIEW</a></td>
                </tr>
           		  <tr>
                  <td>${EventBoardVo[2].eb_num }</td>
                  <td>${EventBoardVo[2].eb_title }</td>
                  <td>${EventBoardVo[2].a_id }</td>
                  <td>${EventBoardVo[2].eb_start_date }~${EventBoardVo.eb_end_date }</td>
                  <td>${EventBoardVo[2].eb_hit}</td>
                  <td><a href="eventBoardView?eb_num=${EventBoardVo[2].eb_num  }">VIEW</a></td>
                </tr>
              </c:if>
              <c:if test="${a <4 }">
              <c:forEach items="${Eventlist }" var="EventBoardVo">
           	  <tr>
                  <td>${EventBoardVo.eb_num }</td>
                  <td>${EventBoardVo.eb_title }</td>
                  <td>${EventBoardVo.a_id }</td>
                  <td>${EventBoardVo.eb_start_date }~${EventBoardVo.eb_end_date }</td>
                  <td>${EventBoardVo.eb_hit }</td>
                  <td><a href="eventBoardView?eb_num=${EventBoardVo.eb_num }">VIEW</a></td>
                </tr>
             </c:forEach>
              </c:if>
           </tbody>
            </table>
          </div>
          </div>
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
</body>

</html>
