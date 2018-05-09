<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<aside id="sidebar2">
	<!-- sidebar2 -->
	<h2>새로운 친구들</h2>
	<c:forEach items="${mList }" var="n">
	<ul>
		<li><a href="sns_control.jsp?action=getall&suid=${n }">${n }</a></li>
	</ul>
	</c:forEach>
	
	<br>
	<br>
	<h3>we're scocial too!</h3>
	<img src="img/facebook_32.png"><img src="img/twitter_32.png">
	<img src="img/youtube_32.png"><br><br><br><br>
	
	<h3>links</h3>
	<ul>
		<li><a href="#">jsp servlet</a></li>
		<li><a href="#">네이버</a></li>
		<li><a href="#">유튜브</a></li>
	</ul>
</aside>
