<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
       <a class="sidebar-brand d-flex align-items-center justify-content-center" href="fm_main" style="background-color: floralwhite;">
        <div class="sidebar-brand-text mx-3"><img src="img/logo/a.png"></div>
      </a>
      
      <hr class="sidebar-divider">
      <div class="sidebar-heading">
        <h4 style="color: black; font-weight: bolder;">시설 관리자</h3>
      </div>
    
     

	<li class="nav-item">
        <a class="nav-link " href="fac_register">
          <i class="fas fa-fw fa-window-maximize"></i>
          <span>시설 등록</span>
        </a>
     </li>

	<li class="nav-item">
        <a class="nav-link " href="fac_list">
          <i class="fas fa-fw fa-window-maximize"></i>
          <span>시설 목록</span>
        </a>
     </li>

	<li class="nav-item">
        <a class="nav-link " href="fac_reserve">
          <i class="fas fa-fw fa-window-maximize"></i>
          <span>예약 목록</span>
        </a>
     </li>

	<li class="nav-item">
        <a class="nav-link " href="fm_money">
          <i class="fas fa-fw fa-window-maximize"></i>
          <span>정산 관리</span>
        </a>
     </li>

	<li class="nav-item">
        <a class="nav-link " href="fm_mypage">
          <i class="fas fa-fw fa-window-maximize"></i>
          <span>마이페이지 이동</span>
        </a>
      </li>

	<li class="nav-item">
        <a class="nav-link " href="fac_comment">
          <i class="fas fa-fw fa-window-maximize"></i>
          <span>리뷰 목록</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="fac_qna">
          <i class="fas fa-fw fa-window-maximize"></i>
          <span>문의 내역</span>
        </a>
      </li>
    
	<li class="nav-item">
        <a class="nav-link" href="freeBoardSellerList?fm_id=${session_id}">
          <i class="fas fa-fw fa-window-maximize"></i>
          <span>게시판 이동</span>
        </a>
      </li>
      <hr class="sidebar-divider">
      <div class="version" id="version-ruangadmin"></div>
    </ul>