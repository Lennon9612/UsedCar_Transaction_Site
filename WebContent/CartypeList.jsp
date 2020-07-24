<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@page import="dto.Car" %>
<%@page import="dao.CarDAO" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	

	String cartype = new String(request.getParameter("cartype").getBytes("8859_1"), "UTF-8");
	String query = new String(request.getParameter("query").getBytes("8859_1"), "UTF-8");

		
	CarDAO dao = CarDAO.getInstance();
	List<Car> t = dao.CartypeList(cartype,query);



%>
<div class="container marketing" id="marketing">
		<h2 class="text-center" id="carTitle"><%=cartype%> 자동차</h2>
   <!-- Three columns of text below the carousel -->
      <div class="row">

	<%
		for(int i=0; i <t.size(); i++){
			Car bean = t.get(i);
	%> 
        <div class="col-lg-4">
          <img class="img-circle" src="img/<%=bean.getImg() %>" alt="Generic placeholder image" width="300" height="200" 
             onclick="location.href='DanCarMain.jsp?center=CarReserveInfo.jsp&no=<%= bean.getNo() %>'" >
          <h2><%=bean.getName() %></h2>
          
          <p><a class="btn btn-default" href="DanCarMain.jsp?center=CarReserveInfo.jsp&no=<%=bean.getNo() %>" role="button">상세보기 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->

 
   <% }  %>
      </div><!-- /.row -->  
      
</div>      


  <hr class="divider">





<div class="row">
	<div class="col-xs-2 col-md-2"></div>
	<div class="col-xs-8 col-md-8 text-center" >
	  
		  <form class="form-inline" action="DanCarMain.jsp?center=CartypeList.jsp" method="post">
			<div class="form-group"  >
				<h4>제조사 검색 &nbsp;</h4>
			</div>
			<div class="form-group">
				<input type="hidden" name="query" value="company">
				<select name="cartype" class="form-control">
					<option value="벤츠">벤츠</option>
					<option value="재규어">재규어</option>
					<option value="현대">현대</option>
					<option value="기아">기아</option>
					<option value="쉐보레">쉐보레</option>
					<option value="아우디">아우디</option>
					<option value="인피니티">인피니티</option>
					<option value="람보르기니">람보르기니</option>
					<option value="렉서스">렉서스</option>
					<option value="제네시스">제네시스</option>
					<option value="포르쉐">포르쉐</option>
				</select>
			</div>
			<div class="form-group">
				<input type="submit" value="검색하기" class="btn btn-success">
			</div>
			<div class="form-group">
			    <input type="button" value="전체검색" class="btn btn-danger" onclick="location.href='DanCarMain.jsp?center=CarListView.jsp'">
			</div>			
		</form>
		<form class="form-inline" action="DanCarMain.jsp?center=CartypeList.jsp" method="post">
			<div class="form-group">
				<h4>차량 크기 검색 &nbsp;</h4>
			</div>
			<div class="form-group">
				<input type="hidden" name="query" value="cartype">
				<select name="cartype" class="form-control">
					<option value="1">소형</option>
					<option value="2">준중형</option>
					<option value="3">중형</option>
					<option value="4">중대형</option>
					<option value="5">대형</option>
				</select>
			</div>
			<div class="form-group">
				<input type="submit" value="검색하기" class="btn btn-success">
			</div>
			<div class="form-group">
			    
			</div>			
		</form>

	  	
		<form class="form-inline" action="DanCarMain.jsp?center=CartypeList.jsp" method="post">
			<div class="form-group">
				<h4>연료방식 검색 &nbsp;</h4>
			</div>
			<div class="form-group">
				<input type="hidden" name="query" value="fueltype">
				<select name="cartype" class="form-control">
					<option value="가솔린">가솔린</option>
					<option value="디젤">디젤</option>
					<option value="LPG">LPG</option>
				</select>
			</div>
			<div class="form-group">
				<input type="submit" value="검색하기" class="btn btn-success">
			</div>
			<div class="form-group">
	
			</div>			
		</form>

	  	
	</div>

</div>

</body>
</html>