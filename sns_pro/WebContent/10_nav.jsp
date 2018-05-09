<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav>
	<div class="menu">
		<ul>
			<li><a href="index.jsp">home</a></li>
			<li><a href="javascript:newuser()">new user</a></li>
			<li><a href="sns_control.jsp?action=getall">전체글보기</a></li>
			
			<form name="loginform" method="post" action="user_control.jsp">
				<c:choose>
					<c:when test="${uid!=null}">
					<li><a href="#">::</a></li>
					<li><a href="sns_control.jsp?action=getall&suid=${uid}">${uid}님 글 모아보기 </a></li>
					<input type="hidden" name="action" value="logout">
					<input type="submit" value="로그아웃">
					</c:when>
					
					<c:otherwise>
					<li><a href="#">::</a></li>
					<li><a href="#">Login</a></li>
					<input type="hidden" name="action" value="login">&nbsp;
					<input type="text" name="uid" size="10">
					<input type="password" name="passwd" size="10">
					<input type="submit" value="로그인">
					</c:otherwise>		
				</c:choose>
			</form>
		</ul>
	</div>
</nav>