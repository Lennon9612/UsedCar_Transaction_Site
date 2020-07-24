<%@page import="dto.Car"%>
<%@page import="dao.CarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="EUC-KR">
    <title>차 정보보기</title>
    </head>
<body>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	//데이터베이스에 접근
	CarDAO dao = CarDAO.getInstance();
	//차 하나에대한 정보를 얻어옴
	Car bean = dao.getOneCar1(no);  
	
	String temp="";
	if(bean.getCartype()==1)
		temp="소형";
	else if(bean.getCartype()==2)
		temp="준중형";
	else if(bean.getCartype()==3)
		temp="중형";
	else if(bean.getCartype()==4)
		temp="중대형";
	else if(bean.getCartype()==5)
		temp="대형";
	
%>
	<h2 class="text-center" id="carTitle"><%= bean.getName() %> 차량 선택</h2>         
<div class="container marketing" id="marketing">
   <!-- Three columns of text below the carousel -->
      <div class="row">
		<div class="col-xs-3 col-md-1"></div>
    	<div class="col-sm-7">
    		<img src="img/<%= bean.getImg() %>"  class="img-responsive img-rounded"> 		
    	</div>
    	
    	<div class="col-sm-4">
    	<div class="table-responsive">
    		<form action="DanCarMain.jsp">
    		<table class="table">
    			<tr>
    				<th>차량번호</th>
    				<td><%= bean.getCarnumber() %></td>
    			</tr>
    			<tr>
    				<th>차량이름</th>
    				<td><%= bean.getName() %></td>
    			</tr>
    			<tr>
    				<th>제조회사</th>
    				<td><%= bean.getCompany() %></td>
    			</tr>
    			<tr>
    				<th>차량 연료타입</th>
    				<td><%= bean.getFueltype() %></td>
    			</tr>
    			<tr>
    				<th>차량분류</th>
    				<td><%= temp %></td>
    			</tr>
    			<tr>
    				<th>차량 연식</th>
    				<td><%= bean.getModelyear() %></td>
    			</tr>
    			<tr>
    				<th>판매가격</th>
    				<td><%=bean.getPrice() %></td>
    			</tr>
    		
				<tr>					
    				<td colspan="2" class="text-center">
    				<input type="hidden" value="CarOptionSelect.jsp"   name="center">
    				<input type="hidden" value="<%= bean.getImg() %>"   name="img">
    				<input type="hidden" value="<%= bean.getNo() %>"   name="no">
    				<input type="submit" class="btn"  value="옵션선택">
    				</td>
    			</tr>
    			
    		</table>
    		</form>	
    		</div>
    	</div>
    	<div class="col-xs-1 col-md-1"></div>	
	</div>      
	
  <hr class="divider">
  <div class="row">
  <h3 class="text-center">차량 정보 보기</h3>
  <p  class="text-center"><b><%= bean.getName() %></b> 자동차 입니다.</p>
  </div>

</div>

</body>
</html>
