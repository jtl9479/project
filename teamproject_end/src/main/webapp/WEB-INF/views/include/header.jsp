<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<div id="header_div">
			<div id="header_img">
				<c:if test="${session_member == 'member' }">
				<h1 style="color: white; font-size: 50px; margin-left: 100px; padding-top: 10px;"><a href="member_Main">노리</a></h1>
				</c:if>
				<c:if test="${session_member == 'admin' }">
				<h1 style="color: white; font-size: 50px; margin-left: 100px; padding-top: 10px;"><a href="admin_main">노리</a></h1>
				</c:if>
				<c:if test="${session_member == 'seller' }">
				<h1 style="color: white; font-size: 50px; margin-left: 100px; padding-top: 10px;"><a href="fm_main">노리</a></h1>
			</c:if>
			</div>
		</div>
