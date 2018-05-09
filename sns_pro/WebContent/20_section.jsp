<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<b>내소식 업데이트</b>
	<form class="m_form" method="post" action="sns_control.jsp?action=newmsg">
		<input type="hidden" name="uid" value="${uid}">
		<c:set var="type" value="msg"/>
		<c:if test="${uid != null}">
		<c:choose>
		<c:when test="${type=='msg'}">
		<input type="text" name="msg" maxlength="100">
		</c:when>
		<c:when test="${type =='rmsg'}">댓글달기<input type="text" name="rmsg" maxlength="50" size="60">
		</c:when>
		</c:choose>
		</c:if>
		
		<c:if test="${uid ==null}">
		<c:choose>
		<c:when test="${type=='msg' }">
		<input type="text" name="msg" maxlength="100" disabled="disabled" value="작성하려면 로그인 하세요!">
		</c:when>
		
		<c:when test="${type=='rmsg'}">댓글달기<input type="text" name="rmsg" maxlength="50" size="60" disabled="disabled" value="작성하려면 로그인 하세요">
		</c:when>
		</c:choose>
		</c:if>
		
		<button class="submit" type="submit">등록</button>
	</form>
</div>