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
		<h2>mysns 오류!</h2>
		<hr>
		<table>
			<tr bgcolor="pink"><td>
			관리자에게 문의해 주세요<br>
			빠른시일내에 복구하겠습니다.
			</td></tr>
			<tr><td>
			${now}<p>
			요청실패 uri:${pageContext.errorData.requestURI}<br>
			상태코드:${pageContext.errorData.statusCode }<br>
			예외유형:${pageContext.errorData.throwable}
			</p></td></tr>
		</table>
	</div>
</body>
</html>