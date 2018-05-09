<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<title>my sns</title>
	<link rel="stylesheet" href="css/styles.css" type="text/css" media="screen"/>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"/>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script>
		$(function(){
			$("#accordion").accordion({
				heightStyle:"content",
				active:parseInt("${curmsg==null?0:curmsg}")
			});
		});
		
		function newuser(){
			window.open("new_user.jsp","newuser","titlebar=no,location=no,scrollbars=no,resizeable=no,menubar=no,toolbar=no,width=300,height=240");
			
		}
	</script>
	<!-- [if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif] -->		
</head>	
<body>
	<header>
		<div class="container1">
			<h1 class="fontface" id="title">My Simple SNS</h1>
		</div>
	</header>
</body>
