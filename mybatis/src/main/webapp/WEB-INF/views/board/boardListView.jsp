<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<style>
	#list-area {
		border: 1px solid;
		border-collapse: collapse;
	}
	#list-area tr, #list-area th, #list-area td {
		border: 1px solid;
	}
	#paging-area a {
		text-decoration: none;
		color: black;
	}
</style>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<div class="outer" align="center">
		<h2>게 시 판</h2>
	</div>
	
	<div id="search-area" align="center">
			<form action="search.bo">
				<select name="keyField">
					<option value="writer">작성자</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input name="keyWord" value="${ keyWord }">
				<input type="submit" value="검색">
				<input type="hidden" name="nowPage" value="1">
			</form>
		</div>
	<br>
		
	<table id="list-area"  align="center">
		<thead>
			<tr>
				<th width="100px">글번호</th>
				<th width="300px">제목</th>
				<th width="100px">작성자</th>
				<th width="100px">조회수</th>
				<th width="170px">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="b" items="${list}">
				<tr>
					<td>${b.boardNo}</td>
					<td><a href="detail.bo?bno=${b.boardNo}">${b.boardTitle}</a></td>
					<td>${b.boardWriter}</td>
					<td>${b.count}</td>
					<td>${b.createDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		
	<div id="paging-area" align="center">
			<c:if test="${ pi.nowPage ne 1 }">
				<c:choose>
					<c:when test="${ empty keyField }">
						<a href="list.bo?nowPage=${ pi.nowPage-1 }">[이전]</a>
					</c:when>
					<c:otherwise>
						<a href="search.bo?nowPage=${pi.nowPage-1}&keyField=${keyField}&keyWord=${keyWord}">[이전]</a>
					</c:otherwise>
				</c:choose>
			</c:if>
			
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:choose>
					<c:when test="${ empty keyField }">
						<c:choose>
							<c:when test="${p eq pi.nowPage}">
								<a href="list.bo?nowPage=${p}" style="color:hotpink;">[${p}]</a>
							</c:when>
							<c:otherwise>
								<a href="list.bo?nowPage=${p}">[${p}]</a>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${p eq pi.nowPage}">
								<a href="search.bo?nowPage=${p}&keyField=${keyField}&keyWord=${keyWord}" style="color:hotpink;">[${p}]</a>
							</c:when>
							<c:otherwise>
								<a href="search.bo?nowPage=${p}&keyField=${keyField}&keyWord=${keyWord}">[${p}]</a>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:if test="${ pi.nowPage ne pi.totalPage }">
				<c:choose>
					<c:when test="${ empty keyField }">
						<a href="list.bo?nowPage=${ pi.nowPage+1 }">[다음]</a>
					</c:when>
					<c:otherwise>
						<a href="search.bo?nowPage=${pi.nowPage+1}&keyField=${keyField}&keyWord=${keyWord}">[다음]</a>
					</c:otherwise>
				</c:choose>
			</c:if>
		</div>
</body>
</html>