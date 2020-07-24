<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Login Session</title>
</head>
<body>
<%!
	public Cookie getCookie(HttpServletRequest request, String name) {
	    Cookie[] cookies = request.getCookies();
	    Cookie cookie = null;
	    if (cookies != null) {
	        for (Cookie c : cookies) {
	            if (c.getName().equals(name)) {
	            	cookie = c;
	                break;
	            }
	        }
	    }
	    return cookie;
	}
%>
<%
	Cookie cookieID = getCookie(request, "userID");
	String id = "";
	if (cookieID != null)
		id = cookieID.getValue();
	Cookie cookiePW = getCookie(request, "userPW");
	String password = "";
	if (cookiePW != null)
		password = cookiePW.getValue();
%>


<form action="loginProcess.jsp" method="post">
	<div class="container marketing" id="marketing">
		<div class="row">
			<h2 class="text-center" id="carTitle">로그인</h2>

			<div class="col-xs-3 col-md-3"></div>

			<div class= "col-sm-6">
		</div>
	</div>
	

		</div>
		<div class="form-group">
			<label for="id" class="col-sm-2">아이디</label>
			<div class="col-sm-10">
			<input type="text" class="form-control" name="userID" value="<%= id %>">
			</div>
		</div>

		
		<div class="form-group">
			<label for="password" class="col-sm-2">패스워드</label>
			<div class="col-sm-10">	
			<input type="password" class="form-control" name="userPW" value="<%= password %>">
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-12">
				<div class="text-center">
				<input type="checkbox" name="save" checked>아이디/비밀번호 기억	
				<input type="submit" value="로그인" class= "btn btn-success">
				<a href = "index.jsp" class="btn btn-primary" role="button">취소</a>
				</div>
			
		</div>

	
</div>
<div class = "col-xs-3 col-md-1"></div>

<h2 class ="text center">
계정이 없으세요? 	<a href="DanCarMain.jsp?center=member.jsp" class="btn btn-danger" role="button">회원가입</a>
</h2>


</body>
</html>