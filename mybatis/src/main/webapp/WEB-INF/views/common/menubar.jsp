<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible+Next:ital,wght@0,200..800;1,200..800&family=Gothic+A1&family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=Nanum+Myeongjo&family=Shafarik&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible+Next:ital,wght@0,200..800;1,200..800&family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=Nanum+Myeongjo&family=Shafarik&display=swap');
    .login-area {
        border: 2px solid;
        font-weight: bold;
        font-family: Gothic A1;
        background-color: lightgray;
    }
    .login-area a {
        text-decoration: none;
        color: black;
        font-size: 14px;
    }
    .loginInfo {
        font-size: 18px;
    }
    .nav-area {
        display: flex;
        justify-content: space-between;
        margin: 0 auto;
        width: 100%;
        background-color: black;
        color: white;
        height: 20px;
        line-height: 20px;
    }
    .menu {
        padding-right: 70px;
        padding-left: 70px;
        font-family : Nanum Myeongjo, serif;
        cursor : pointer;
    }
    .main-Logo {
    	font-family : Nanum Myeongjo;
    	text-align: center;
    }
    /* .outer {
    	text-align: center;
    }
    .outer table tr {
    	text-align: left;
    	height: 30px;
    } */
</style>
<body>
	<h1 class="main-Logo">Welcome to KING KI-CHAN world!</h1>

	<div class="login-area" align="center">
		<c:choose>      
			<c:when test="${empty loginUser}">
				<form action="login.me" method="post">
					<table>
						<tr>
							<td>아이디</td>
          		 	        <td><input name="userId" required></td>
       		            	<td rowspan="2"><input type="submit" value="로그인" style="height: 46px; font-weight: bold;"></td>
						</tr>
           			    <tr>
               				<td>비밀번호</td>
          					<td><input type="password" name="userPwd" required></td>
    		            </tr>
         		        <tr>
     		            	<td colspan="3" align="right">
        	        	    	<a href="enrollForm.me">회원가입</a>&emsp;
       		     	        	<a href="">아이디/비밀번호 찾기</a>
    	        	        </td>
    		            </tr>
					</table>
				</form>
			</c:when>
        	<c:otherwise>
     			<table>
          			<tr>
         	 	    	<td colspan="2"><b class="loginInfo">${loginUser.userName}님 환영합니다</b></td>
					</tr>
      			    <tr>
          				<td><a href="">마이페이지</a></td>
          		 	    <td><a href="logout.me">로그아웃</a></td>
          			</tr>
       			</table>
         	</c:otherwise>
		</c:choose>     
	</div>
    <br>
    <div class="nav-area" align=""center>
        <div class="menu">HOME</div>
        <div class="menu">공지사항</div>
        <div class="menu" onclick="location.href='list.bo?nowPage=1'">게시판</div>
        <div class="menu">ETC</div>
    </div>
</body>
</html>