<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer table {
		border: 1px solid;
		border-collapse: collapse;
	}
	.outer tr, .outer td {
		border: 1px solid;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="outer">
		<h2>게시판 상세보기</h2>
		
		<table align="center">
			<tr>
				<td width="100px;">글번호</td>
				<td width="400px;">${b.boardNo}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${b.boardTitle}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${b.boardWriter}</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${b.count}</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${b.createDate}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${b.boardContent}</td>
			</tr>
		</table>
		<br>
		<form action="insertReply.do" method="post">
			<table align="center">
				<tr>
					<th>댓글작성</th>
					<th>
						<textarea name="replyContent" rows="3" cols="50"></textarea>
					</th>
					<th>
						<input type="submit" value="댓글등록">
					</th>
				</tr>
			</table>
			<input type="hidden" name="boardNo" value="${board.boardNo}" />
			<input type="hidden" name="replyWriter" value="${loginUser.userId}" />
		</form>
	</div>
</body>
</html>