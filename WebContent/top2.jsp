<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>top</title>
</head>
<body>
<% 
		String userID =(String)session.getAttribute("userID");
		String userPW =(String)session.getAttribute("userPW");
		//로그인이 되어있지 않다면, 
		if(userID==null && userPW==null){
			userID="GUEST";
		}
%>
<div class="contatiner">
	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp"><h3>Dan Car</h3></a>
			</div>
		
		
			<h5><a href="DanCarMain.jsp?center=CarListView.jsp" style="color: #fff">차량목록</a></h5>
			<h5><a href="DanCarMain.jsp?center=CarReserveView.jsp" style="color: #fff">차량구매확인</a></h5>
			<h5><a href="DanCarMain.jsp?center=BoardList.jsp" style="color: #fff">게시판</a></h5>	
			<h5><a href="DanCarMain.jsp?center=CarEnroll.jsp" style="color: #fff">차량판매하기</a></h5>

			<h5><a href="#" style="color: #fff"><b><%= userID %></b> 님 반갑습니다.</a></h5>
				<%
					if(userID.equals("GUEST")){
				%>
				<li><a href="DanCarMain.jsp?center=login.jsp" ><button class="btn btn-primary">로그인</button></a></li>
				<li><a href="DanCarMain.jsp?center=member.jsp" ><button class="btn btn-primary">회원가입</button></a></li>
				<%		
					}else{ 
				%>		
				<li><a href="logout.jsp" ><button class="btn btn-danger">로그아웃</button></a></li>						
			   <%			
					}
				%>
				
			</div></nav>
			</div>
		


</body>
</html>