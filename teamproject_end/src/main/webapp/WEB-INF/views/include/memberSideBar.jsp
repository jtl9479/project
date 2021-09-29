<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>



<ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="member_Main" style="background-color: floralwhite;">
        <div class="sidebar-brand-text mx-3"><img src="img/logo/a.png"></div>
      </a>
     
      <hr class="sidebar-divider">
      <div class="sidebar-heading">
        <h3 style="color: black; font-weight: bolder;">회원</h3>
      </div>

      <li class="nav-item">
        <a class="nav-link" href="main">
          <i class="far fa-fw fa-window-maximize"></i>
          <span>예약하러가기</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="member_mypage">
          <i class="far fa-fw fa-window-maximize"></i>
          <span>마이페이지</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="member_reserve">
          <i class="fab fa-fw fa-wpforms"></i>
          <span>예약확인</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="member_qua" >
          <i class="fas fa-fw fa-palette"></i>
          <span>관리자 문의</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="member_board">
          <i class="fab fa-fw fa-wpforms"></i>
          <span>게시판 작성글 보기</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="freeBoardMemberList?m_id=${session_id}">
          <i class="fab fa-fw fa-wpforms"></i>
          <span>게시판</span>
        </a>
      </li>
      <hr class="sidebar-divider">

      <div class="version" id="version-ruangadmin"></div>
    </ul>