<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
<!-- Author Meta -->
<meta name="author" content="colorlib">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>Noriter</title>

			

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--
			CSS
			============================================= -->
<link rel="stylesheet" href="css/linearicons.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/main.css">
<style>
* {
	margin: 0;
	padding: 0;
}
ul, li {
	list-style: none;
}
.slide {
	height: 300px;
	overflow: hidden;
}
.slide ul {
	height: 100%;
}
.slide li {
	height: 100%;
}
.review_delete{
	background-color: white;
	border: none;
	margin-left: 10px;
	cursor: pointer;
	font-size: 13px;
}
.review_delete:focus {
	outline: none;
}
#modify_btn{
	cursor: pointer;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
		$(function(){
			$(".cahngeMonthBtn").click(function(){
				$(function(){
					$(".isDay").click(function(){
						 $.ajax({
				             url: "reserDateCheck",
				             type: "post",
				             data:{
				            	 "finfo_no":${param.finfo_no},
				             	"reserDate":$("#input_date").val()
				             	},
				             success: function(data){
				            	 var html = '';
				            	 html += '<ul id = "reserList">';
				            	 for(var i=0; i<data.reserTime.length;i++){
					            		 if(i == data.correctNum[i]){
					            			 html += '<li style="color:#808080;" class="noReser">'+data.reserTime[i]+'</li>';
					            			 
					            		 }else{
					            			 html += '<li>';
						            		 html += '<input type = "radio" name = "reser_time" value = "'+data.reserTime[i]+'"><label for = "'+data.reserTime[i]+'">'+data.reserTime[i]+'</label>';
					            			 html += '</li>';
					            			 
					            		 }
				            		 		 
				            	 }
					             html += '</ul>';
					            /*  html += '<div class="single-sidebar-widget tag-cloud-widget">';
					             html += '<button class="tagcloud-title" onclick = "reservation()">????????????!</button>';
				            	 html += '</div>'; */
				            	 
				            	 $("#reser_table").html(html);
				             },
				             error: function(){
				                alert("?????? ??????");
				             }
				         }); 
					});
				});
		
			});
		});
		$(function(){
			$(".isDay").click(function(){
				 $.ajax({
		             url: "reserDateCheck",
		             type: "post",
		             data:{
		            	 "finfo_no":${param.finfo_no},
		             	"reserDate":$("#input_date").val()
		             	},
		             success: function(data){
		            	 var html = '';
		            	 html += '<ul id = "reserList">';
		            	 for(var i=0; i<data.reserTime.length;i++){
			            		 if(i == data.correctNum[i]){
			            			 html += '<li style="color:#808080;" class="noReser">'+data.reserTime[i]+'</li>';
			            			 
			            		 }else{
			            			 html += '<li>';
				            		 html += '<a onclick = "reserInfo()"><input type = "radio" name = "reser_time" value = "'+data.reserTime[i]+'" class = "reserTime"></a><label for = "'+data.reserTime[i]+'">'+data.reserTime[i]+'</label>';
			            			 html += '</li>';
			            		 }
		            	 }
			             html += '</ul>';
		            	 
		            	 $("#reser_table").html(html);
		             },
		             error: function(){
		                alert("?????? ??????");
		             }
		         }); 
					});
		
		});
		function reserInfo(){
			$("#r_time").text($('input[name=reser_time]:checked').val());
			$("#r_price").text(${finfo.finfo_price}+"???");
		}
		
		function delete_review(r_no){
			if(confirm("????????? ?????????????????????????") == true){
			$.ajax({
	             url: "deleteReview",
	             type: "post",
	             data:{
             		 "r_no":r_no,
             		 "finfo_no":${param.finfo_no}
	             	},
	             success: function(data){
	         			$("#review"+r_no).remove();   	 
	         			$("#review_no").text(data.reviewNo);
          },
	             error: function(){
	                alert("?????? ??????");
	             }
	         });
				
			}else{
				return false;
			}
		}
		</script>
		<!--???  -->
							<script type="text/javascript">
						$(function(){
							$("#1").click(function(){
								$("#1").addClass("on");
								for(var i =2; i<=5; i++){
									$("#"+i).removeClass("on");
								}
								$("#star_rate").val(1);
							});
							$("#2").click(function(){
								var index = $("#2").attr("id");
								for(var i=1; i<=index; i++){
									$("#"+i).addClass("on");
								}
								for(var i =3; i<=5; i++){
									$("#"+i).removeClass("on");
								}
								$("#star_rate").val(2);
							});
							$("#3").click(function(){
								var index = $("#3").attr("id");
								for(var i=1; i<=index; i++){
									$("#"+i).addClass("on");
								}
								for(var i =4; i<=5; i++){
									$("#"+i).removeClass("on");
								}
								$("#star_rate").val(3);
							});
							
							$("#4").click(function(){
								var index = $("#4").attr("id");
								for(var i=1; i<=index; i++){
									$("#"+i).addClass("on");
								}
								$("#5").removeClass("on");
								$("#star_rate").val(4);
							});
							
							$("#5").click(function(){
								var index = $("#5").attr("id");
								for(var i=1; i<=index; i++){
									$("#"+i).addClass("on");
								}
								$("#star_rate").val(5);
							});
						});
					</script>
					<!-- ???????????? -->
					<script type="text/javascript">
					function writeReview(){
						if($("#review_content").val() == ""){
							alert("??????????????? ??????????????? ?????????.");
							$("#review_content").focus();
							
							return false;
						}else if($("#star_rate").val() == ""){
							alert("????????? ??????????????? ?????????.");
							return false;
						}
						  $.ajax({
				             url: "writeReview",
				             type: "post",
				             data:{
				            	 "m_no":${session_no},
			             		 "r_content":$("#review_content").val(),
			             		 "r_rate":$("#star_rate").val(),
			             		 "finfo_no":${param.finfo_no}
				             	},
				             success: function(data){
				            	var html = '';
				            	html += '<div class="comment-list" id = "review'+data.r_no+'">';
				            	html += '<div class="single-comment justify-content-between d-flex">';
				            	html += '<div class="user justify-content-between d-flex">';
				            	html += '<div class="desc">';
				            	html += '<h5>';
				            	html += data.name;
				            	html += '<button class = "review_delete" onclick = "delete_review('+data.r_no+')">??????</button>'
				            	html += '</h5>';
				            	html += '<div class="rating_star">';
				            	for(var i=0; i<data.star_on; i++){
					            	html += '<div class = "star_check"></div>';
				            		
				            	}
				            	for(var i=0; i<data.star_off;i++){
					            	html += '<div class = "star_non_check"></div>';
				            	}
				            	html += '</div>';
				            	html += '<p class="date">'+data.date+'</p>';
				            	html += '<p class="comment">'+data.content+'</p>';
				            	html += '</div>';
				            	html += '</div>';
				            	html += '<div class="details">';
				            	html += '</div>';
				            	html += '</div>';
				            	html += '</div>';
				            	 
										
											$("#comments-area").append(html);
											$("#review_no").text(data.reviewCount);
											$("#review_content").val("");
											$("#star_rate").val("");
											$(".star").removeClass("on");
				             },
				             error: function(){
				                alert("?????? ??????");
				             }
				         });  
					}
					function modifyFinfo(){
						location.href = "fac_modify?finfo_no=${param.finfo_no}"
					}
					</script>
<!--????????? ????????????  -->
<script type="text/javascript" src="./js/imgSlide.js">
</script>
<style type="text/css">
	.user_info{
		height: 35px;
    width: 100px;
    border-right: 1px solid #ddd;
		background: #f9fafb;
	}
	.user_info,.user_info_txt{
		font-size: 16px;
	}
	.user_info_txt{
		text-align: left;
		padding-left:10px;
		
	}
	.reserTime:hover{
		cursor: pointer;
	}
	#reser_btn:hover {
	cursor: pointer;
}
</style>
</head>
		<body>
			<!-- ?????? ??? ?????? ?????? ?????? -->
	<jsp:include page="../include/mainHeader.jsp"></jsp:include>
			<!-- ?????? ??? ?????? ?????? ??? -->
		
			<!-- ?????? ?????? ?????? ?????? -->
			<section class="relative about-banner">
				<div class="overlay overlay-bg"></div>
				<div class="container">
					<div class="row d-flex align-items-center justify-content-center">
						<div class="about-content col-lg-12">
							<h1 class="text-white">?????? ???????????????!</h1>
							<p class="text-white link-nav">Complete Your Reservation!</p>
						</div>
					</div>
				</div>
			</section>
			<!-- ?????? ?????? ?????? ??? -->

	<!-- ???????????? ????????? ?????? -->
	<section class="post-content-area single-post-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<div class="col-lg-12">
							<div class = "feature-img slide">
								<ul>
									<li><img src = "/finfo/${finfo.finfo_pic1 }"style="width: 100%; height: 300px;"></li>
									<li><img src = "/finfo/${finfo.finfo_pic2 }"style="width: 100%; height: 300px;"></li>
									<li><img src = "/finfo/${finfo.finfo_pic3 }"style="width: 100%; height: 300px;"></li>
									<li><img src = "/finfo/${finfo.finfo_pic4 }"style="width: 100%; height: 300px;"></li>
									<li><img src = "/finfo/${finfo.finfo_pic5 }"style="width: 100%; height: 300px;"></li>
								</ul>
								</div>
						</div>
						<div class="col-lg-9 col-md-9">
							<h3 class="mt-20 mb-20" id="fac_id">${finfo.finfo_name }</h3>
							<p class="excert">${finfo.finfo_detail } </p>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 banner-right">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active" id="hotel-tab"
								data-toggle="tab" href="#hotel" role="tab" aria-controls="hotel"
								aria-selected="true">????????????</a></li>
							<li class="nav-item"><a class="nav-link "
								id="flight-tab" data-toggle="tab" href="#flight" role="tab"
								aria-controls="flight" aria-selected="false">????????????</a></li>
						</ul>
						<div class="tab-content" id="myTabContent" style="width: 670px;">
							<div class="tab-pane fade " id="flight"
								role="tabpanel" aria-labelledby="flight-tab">
								<form class="form-wrap">

									<br>
								</form>
							</div>
							<div class="map-wrap" style="width: 100%; height: 400px;"
                              id="map"></div>
                     <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dbdc7f5bfad5f722137da8b8f0f663f3&libraries=services"></script>
                           <script>
                           var mapContainer = document.getElementById('map'), // ????????? ????????? div 
                               mapOption = {
                                   center: new kakao.maps.LatLng(33.450701, 126.570667), // ????????? ????????????
                                   level: 3 // ????????? ?????? ??????
                               };  
                           
                           // ????????? ???????????????    
                           var map = new kakao.maps.Map(mapContainer, mapOption); 
                           
                           // ??????-?????? ?????? ????????? ???????????????
                           var geocoder = new kakao.maps.services.Geocoder();
                           
                           // ????????? ????????? ???????????????
                           geocoder.addressSearch('${finfo.finfo_add1}', function(result, status) {
                           
                               // ??????????????? ????????? ??????????????? 
                                if (status === kakao.maps.services.Status.OK) {
                           
                                   var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                           
                                   // ??????????????? ?????? ????????? ????????? ???????????????
                                   var marker = new kakao.maps.Marker({
                                       map: map,
                                       position: coords
                                   });
                           
                               
                           
                                   // ????????? ????????? ??????????????? ?????? ????????? ??????????????????
                                   map.setCenter(coords);
                               } 
                           });    
                           </script>
							<div class="tab-pane show active" id="hotel" role="tabpanel"
							
								aria-labelledby="hotel-tab">
								<form class="form-wrap">
									<br>
									<p>
									<h3>??????</h3>
									${finfo.finfo_add1 }
									</p>
									<br>
									<p>
									<h3>????????????</h3>
									${fm_phone }
									</p>
									<br>
								</form>
							</div>
						</div>
					</div>
					<!-- ???????????? ????????? ?????? -->
					
					<!-- ?????? ?????? ????????? ?????? -->
					<c:if test="${session_member == 'member' }">
						<div class = "comment_title">
							<h4>?????? ????????????</h4>
						</div>
						<div class = "comment_write">
							<div>
								<button class = "star" id = "1"></button>
								<button class = "star" id = "2"></button>
								<button class = "star" id = "3"></button>
								<button class = "star" id = "4"></button>
								<button class = "star" id = "5"></button>
							</div>
							<input type = "hidden" name = "rating" id = "star_rate">
								<br>
								<div class = "comment_write_outline">
									<textarea name = "review_content" class = "review_write" id = "review_content"></textarea>
									<button class = "comment_write_btn" onclick = "writeReview()">?????? ??????</button>
								</div>
						</div>
					</c:if>
					<!-- ?????? ?????? ????????? ??? -->
					
					<!-- ?????? ????????? ?????? -->
					<div class="comments-area" id = "comments-area">
						<h4><span id = "review_no">${review_no }</span>?????? ??????!</h4>
						<c:forEach items="${list }" var="reVo">
						<div class="comment-list" id = "review${reVo.r_no }">
							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="desc">
										<h5>
											${reVo.m_nickname }
											<c:if test="${(session_no == reVo.m_no) && (session_member == 'member') } ">
												<button class = "review_delete" onclick = "delete_review(${reVo.r_no})">??????</button> 
											</c:if>
										</h5>
										<div class="rating_star">
										<c:forEach begin="1" end="${reVo.r_rate}">
											<div class = "star_check"></div>
										</c:forEach>
										<c:forEach begin="1" end = "${5-(reVo.r_rate) }">
											<div class = "star_non_check"></div>
										</c:forEach>
										
										</div>
										<p class="comment">${reVo.r_content }</p>
										<p class="date">${reVo.r_date }</p>
									</div>
								</div>
								<div class="details">
								</div>
							</div>
						</div>
						</c:forEach>
						
						</div>
						
					
				</div>

				<!-- ????????? ?????? ????????? -->
				<div class="col-lg-4 sidebar-widgets">
					<div class="widget-wrap">
						<!-- ????????? ?????? ?????? ???????????? -->
						<div class="container">
							<h4 style="padding: 20px;">??????/?????? ????????????</h4>
							<div style="width: 300px; padding: 15px 10px 15px 10px;">
								<div>
									<button type="button" class = "cahngeMonthBtn" onclick="changeMonth(-1);" style="display: none">
										<i>???</i>
									</button>
									<input type="text" name="" id="year"  readonly
										style="width: 80px; display: initial;" class="form-control">
									<input type ="text" id = "month" style="width: 80px; display: initial;" readonly class="form-control">
									<!-- <select name="" id="month" class="form-control"
										style="width: 80px; display: initial;"
										onchange="changeMonth()">
										<option value="1">1???</option>
										<option value="2">2???</option>
										<option value="3">3???</option>
										<option value="4">4???</option>
										<option value="5">5???</option>
										<option value="6">6???</option>
										<option value="7">7???</option>
										<option value="8">8???</option>
										<option value="9">9???</option>
										<option value="10">10???</option>
										<option value="11">11???</option>
										<option value="12">12???</option>
									</select> -->
									<button type="button" class = "cahngeMonthBtn" onclick="changeMonth(1)" style="display: none">
										<i>???</i>
									</button>
								</div>
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>???</th>
											<th>???</th>
											<th>???</th>
											<th>???</th>
											<th>???</th>
											<th>???</th>
											<th>???</th>
										</tr>
									</thead>
									<tbody id="td_body">

									</tbody>
								</table>
							</div>
						</div>
						<script type="text/javascript">
							
						</script>
						<!-- ?????? ?????? ????????? -->
						<div class="container">
							<h4 id="reser_status" style="padding: 20px;"></h4>
							<form action="reservation" method="post" id="reserForm">
								<input type="hidden" id="input_date" name="reser_date">
								<input type="hidden" name="finfo_no" id="finfo_no" value="${param.finfo_no }">
								<input type="hidden" name="m_no" id="m_no" value="${session_no }">
								<input type="hidden" name="fm_id" id="fm_id" value="${finfo.fm_id }">
								<div id="reser_table">
								</div>
							</form>
						</div>
						
					<!-- ????????? ?????? -->
					<c:if test="${session_member == 'member'}">
						<div class="comment-form-1">
							<h4 style="margin: 20px;">????????? ??????</h4>
							<table id = "booking_table">
								<colgroup width="30%">
								<colgroup width="70%">
								<tr>
									<td class = "user_info">??????</td>
									<td class = "user_info_txt">${mVo.m_name }</td>
								</tr>
								<tr>
									<td class = "user_info">????????? ??????</td>
									<td class = "user_info_txt">${mVo.m_phone }</td>
								</tr>
								<tr>
									<td class = "user_info">????????? ??????</td>
									<td class = "user_info_txt">${mVo.m_email }</td>
								</tr>
							</table>
							<!-- ?????? ?????? -->
							<h4 style="margin: 20px;">?????? ??????</h4>
							<table id = "booking_table">
								<colgroup width="30%">
								<colgroup width="70%">
								<tr>
									<td class = "user_info">????????????</td>
									<td class = "user_info_txt" id= "r_date"></td>
								</tr>
								<tr>
									<td class = "user_info">?????? ??????</td>
									<td class = "user_info_txt" id ="r_time"></td>
								</tr>
								<tr>
									<td class = "user_info">????????????</td>
									<td class = "user_info_txt" id = "r_price"></td>
								</tr>
							</table>
						</div>

					<!-- ???????????? ?????? -->
						<div class="single-sidebar-widget tag-cloud-widget">
							<h4 class="tagcloud-title" id = "reser_btn"><a style="color:#fff;">????????????!</a></h4>
						<!-- ?????? -->
					</c:if>
					
					<c:if test="${(session_member == 'seller') && (session_id == finfo.fm_id)}">
					<!-- ???????????? ?????? -->
						<div class="single-sidebar-widget tag-cloud-widget">
							<h4 class="tagcloud-title" onclick="modifyFinfo()" id = "modify_btn"><a style="color:#fff;">?????? ??????</a></h4>
						<!-- ?????? -->
					</c:if> 
						<script type="text/javascript">
						
							$(function(){
								$("#reser_btn").click(function(){
									
									if($("input:hidden[name=reser_date]").val() == ""){
										alert("????????? ????????? ?????????");
										return false;
									}else if($("input[name=reser_time]:checked").length == 0){
										alert("????????? ??????????????????");
										return false;
									}
									 if(confirm("????????? ???????????????????") == true){
										
									$.ajax({
										url:"/kakaopay.cls",//????????? ????????????
										type:"post",
										dataType:"json",
										data:{//?????? ????????? ???
											"reser_time":$("#r_time").text(),
											"reser_date":$("#input_date").val(),
											"finfo_no":$("#finfo_no").val(),
											"m_no":$("#m_no").val(),
											"finfo_name":$("#fac_id").text(),
											"fm_id":$("#fm_id").val(),
											"finfo_price":${finfo.finfo_price}
										},
										success:function(data){
											var box =data.next_redirect_pc_url;
											window.open(box)
											
										},
										error:function(error){
											alert(error)
										}
									})
								}
								})
							})
						
						</script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ???????????? ????????? ?????? -->

	<!-- ?????? ?????? -->
	<footer class="footer-area section-gap">
		<div class="container">
			<div
				class="row footer-bottom d-flex justify-content-between align-items-center">
				<p class="col-lg-8 col-sm-12 footer-text m-0">
					Copyright &copy;
					<script>document.write(new Date().getFullYear());</script>
					????????? | This template is made with <i class="fa fa-heart-o"
						aria-hidden="true"></i> by <a href="https://colorlib.com"
						target="_blank">Colorlib</a>
				</p>
			</div>
		</div>
	</footer>
	<!-- ?????? ??? -->
	
	<script type="text/javascript" src="js/calendar.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/easing.min.js"></script>
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/main.js"></script>
</body>
</html>