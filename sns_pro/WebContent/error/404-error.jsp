<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<jsp:useBean id="now" class="java.util.Date"/>

<body>
	<div align=center>
		<h2>mysns:404-error 발생</h2>
		<hr>
		<table>
		<tr bgcolor="pink"><td>
		요청하신 파일을 찾을수 없습니다.<br>
		url주소를 다시한번 확인해 주세요!
		</td></tr>
		<tr><td>
		${now}<p>
		요청 실패 uri:%{pageContext.errorData.requestURI}<br>
		상태코드 : ${pageContext.errorData.statusCode }<br>
		</p></td></tr>
		</table>
	</div>
</body>
</html>