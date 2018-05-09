<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<h3>친구들의 최신 소식</h3>
<div id="accordion">
	<c:forEach varStatus="mcnt" var="msgs" items="${msgList}">
	<c:set var="m" value="${msgs.message}"/>
	<h3>[${m.uid}]${m.msg} :: [좋아요 ${m.favcount}| 댓글 ${m.replycount }]</h3>
	<div>
	<p></p>
	<p>
	<c:set var="mid" value="${m.mid }"/>
	<c:set var="auid" value="${m.uid }"/>
	<c:set var="curmsg" value="${mcnt.index }"/>
	<c:if test="${uid==auid }">
	[<a
	href="sns_control.jsp?action=delmsg&mid=${mid}&curmsg=${curmsg}&cnt=${cnt}&suid=${suid}">삭제</a>]
	</c:if>
	[<a
	href="sns_control.jsp?action=fav&mid=${mid}&curmsg=${curmsg}&cnt=${cnt}&suid=${suid}">좋아요</a>]
	/${m.date}에 작성된 글입니다.
	</p>
	<c:if test="${msgs.rlist.size()!=0 }">
	<ul class="reply">
		<c:forEach var="r" items="${msgs.rlist}">
		<li>${r.uid }::${r.rmsg }-${r.date }
		<c:set var="rid" value="${r.rid }"/>
		<c:set var="ruid" value="${r.uid }"/>
		<c:set var="curmsg" value="${mcnt.index }"/>
		<c:if test="${uid==ruid }">
		[<a
		href="sns_control.jsp?action=delreply&rid=${rid}&curmsg=${curmsg }&cnt=${cnt }&suid=${suid }">삭제</a>]
		</c:if>
		</li>
		</c:forEach>
	</ul>
	</c:if>
	<form action="sns_control.jsp?action=newreply&cnt=${cnt }" method="post">
		<input type="hidden" name="mid" value="${m.mid }">
		<input type="hidden" name="uid" value="${uid }">
		<input type="hidden" name="suid" value="${suid }">
		<input type="hidden" name="curmsg" value="${mcnt.index }">
		<c:set var="type" value="rmsg"/>
		<c:if test="${uid!=null }">
		<c:choose>
		
		<c:when test="${type=='msg'}">
		<input type="text" name="msg" maxlength="100">
		</c:when>
		<c:when test="${type=='rmsg' }">댓글달기
		<input type="text" name="rmsg" maxlength="50" size="60">
		</c:when>
		</c:choose>
		</c:if>
		<c:if test="${uid==null }">
		<c:choose>
		
		<c:when test="${type=='msg' }">
		<input type="text" name="msg" maxlength="100" disabled="disabled" value="작성하려면 로그인 하세요">
		</c:when>
		<c:when test="${type=='rmsg' }">댓글달기
		<input type="text" name="rmsg" maxlength="50" size="60" disabled="disabled" value="작성하려면 로그인 하세요">
		</c:when>
		</c:choose>
		</c:if>	
	</form>
	</div>
	</c:forEach>
</div>