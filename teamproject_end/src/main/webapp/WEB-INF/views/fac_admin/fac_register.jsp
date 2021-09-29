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
  <link href="css/fac_register.css" rel="stylesheet">
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$('input[type=file]').on('change',function(){
		//$(".fileInputClass").change(function(){
			var files1 = $("#customFile1").val().replace(/C:\\fakepath\\/i,'');
			var files2 = $("#customFile2").val().replace(/C:\\fakepath\\/i,'');
			var files3 = $("#customFile3").val().replace(/C:\\fakepath\\/i,'');
			var files4 = $("#customFile4").val().replace(/C:\\fakepath\\/i,'');
			var files5 = $("#customFile5").val().replace(/C:\\fakepath\\/i,'');
			
			
			$(".fileLabelClass1").text(files1);
			$(".fileLabelClass2").text(files2);
			$(".fileLabelClass3").text(files3);
			$(".fileLabelClass4").text(files4);
			$(".fileLabelClass5").text(files5);
			
		});//function2
		
	})
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("finfo_add1").value = addr + extraAddr;
            
            } else {
                document.getElementById("finfo_add1").value = addr;
            }

        }
    }).open();
}
	
  </script> 
  
  <style type="text/css">
  #content-wrapper{
  		height: 1400px; 
  		
  	}
  	
  	#content{
  		height: 800px;
  	}
  	
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
  	label{
  		font-size: 20px;
  		font-weight: bolder;
  		color: #6777ef;
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
        
        <!-- 게시물 라인-->
        <div class="container-fluid" id="container-wrapper">
          <!-- Row -->
          <div class="row">
            <!-- Datatables -->
            <div class="col-lg-12">
              <div class="card mb-4" id="mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h3 class="m-0 font-weight-bold text-primary">시설 등록 수정</h3>
                </div>
              <div id="fac_inform_input">
                <div id="fac_inform_input1">
                  <form action="fac_register" method="post" enctype="multipart/form-data">
                  <table>
                  
                    <div class="form-group" id="fac_input">
                      <label for="fm_id">시설 관리자 아이디</label>
                      <input type="text" class="form-control" id="fm_id" name="fm_id" value="${session_id }" readonly="readonly"> 
                      
                      <label for="finfo_name">시설 이름</label>
                      <input type="text" class="form-control" id="finfo_name" name="finfo_name" placeholder="시설 이름">

                        <label for="finfo_sport">종목</label>
                        <select class="select2-single form-control" name="finfo_sport" id="finfo_sport">
                          <option value="">선택하세요</option>
                          <option value="soccer">축구</option>
                          <option value="baseball">야구</option>
                          <option value="tennis">테니스</option>
                          <option value="badminton">배트민턴</option>
                          <option value="futsal">풋살장 대여</option>
                        </select>
                      
                      <label for="finfo_add1">시설 주소</label>
                      <div class="form-control" style="height: auto;">
                      	<div style="margin-bottom: 5px;" >
                      		<input type="text" id="sample6_postcode" name="post" placeholder="우편번호" >
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                      	</div>
				      <input type="text" id="finfo_add1" name="finfo_add1" placeholder="주소" style="width: 50%;">
				      </div>
                      
                      </script>
                      
                      <label for="finfo_price">시설 가격</label>
                      <input type="text" class="form-control" id="finfo_price" name="finfo_price" placeholder="시설 가격">
                      
                      
                        <label for="finfo_people">최대 인원</label>
                        <select multiple class="form-control" id="finfo_people" name="finfo_people">
                          <option value="1">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                          <option value="5">5</option>
                          <option value="6">6</option>
                          <option value="7">7</option>
                          <option value="8">8</option>
                          <option value="9">9</option>
                          <option value="10">10</option>
                          <option value="11">11</option>
                          <option value="12">12</option>
                          <option value="13">13</option>
                          <option value="14">14</option>
                          <option value="15">15</option>
                          <option value="16">16</option>
                          <option value="17">17</option>
                          <option value="18">18</option>
                          <option value="19">19</option>
                          <option value="20">20</option>
                          <option value="21">21</option>
                          <option value="22">22</option>
                          <option value="23">23</option>
                          <option value="24">24</option>
                          <option value="25">25</option>
                          <option value="26">26</option>
                          <option value="27">27</option>
                          <option value="28">28</option>
                          <option value="29">29</option>
                          <option value="30">30</option>
                        </select>
                     
                      
                        <label for="finfo_detail">상세 정보</label>
                        <textarea class="form-control" id="finfo_detail" name="finfo_detail" rows="3"></textarea>
                    </div>
                    

                      <div class="custom-file">
                        <input type="file" class="custom-file-input customFile1" id="customFile1" name="files">
                        <label class="custom-file-label fileLabelClass1" for="customFile1">파일 업로드</label>
                      </div>
                      <div class="custom-file">
                        <input type="file" class="custom-file-input customFile2" id="customFile2" name="files">
                        <label class="custom-file-label fileLabelClass2" for="customFile2">파일 업로드</label>
                      </div>
                      <div class="custom-file">
                        <input type="file" class="custom-file-input customFile3" id="customFile3" name="files">
                        <label class="custom-file-label fileLabelClass3" for="customFile3">파일 업로드</label>
                      </div>
                      <div class="custom-file">
                        <input type="file" class="custom-file-input customFile4" id="customFile4" name="files">
                        <label class="custom-file-label fileLabelClass4" for="customFile4">파일 업로드</label>
                      </div>
                      <div class="custom-file" style="margin-bottom: 10px;">
                        <input type="file" class="custom-file-input customFile5" id="customFile5" name="files">
                        <label class="custom-file-label fileLabelClass5" for="customFile5">파일 업로드</label>
                      </div>

                    
                    <button type="submit" class="btn btn-primary checkForm" id="fac_save" style="margin-right: 5px;">등록</button>
                    <a href="fac_list" class="btn btn-primary" id="fac_save">리스트</a>
                   </table>
                  </form>
                </div>

              </div>
            </div>
          </div>
        </DIV>
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
