<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<jsp:include page="00_header.jsp"/>
<jsp:include page="10_nav.jsp"/>

<div id="wrapper">
	<section id="main">
	<section id="content">
	<jsp:include page="20_section.jsp"/>
	<br><Br>
	<jsp:include page="21_section.jsp"/>
	
	<div align="center">
	<a href="sns_control.jsp?action=getall&cnt=${cnt+5}&suid=${suid}">더보기&gt;&gt;</a>
	</div>
	</section>
	<jsp:include page="30_aside.jsp"/>
	<!-- end of sidebar -->
	</section>
</div>

<jsp:include page="90_footer.jsp"/>

<!-- <head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 -->
<!-- </body>
</html> -->