<%@page import="dto.Car"%>
<%@page import="dao.CarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no =Integer.parseInt(request.getParameter("no"));
	
	//이미지
	String img =request.getParameter("img");
	
	//데이터베이스에 접근
		CarDAO dao = CarDAO.getInstance();
		//차 하나에대한 정보를 얻어옴
		Car bean = dao.getOneCar1(no);
%>
		<h2 class="text-center" id="carTitle">옵션 선택</h2>
<div class="container marketing" id="marketing">
   <!-- Three columns of text below the carousel -->
      <div class="row">
		
		<div class="col-xs-1 col-md-1"></div>
    	<div class="col-sm-5">
    		<img src="img/<%= img %>" width="400" height="300" id="infoImg">
    	</div>
    	<a>
    	
    	
    	</a>
    	<div class="col-sm-5">
    		<form action="DanCarMain.jsp" method="post">
    		<table class="table">
    			
    			<tr>
    				<th>네비게이션 적용</th>
    				<td>
    					<select name="usenavi" class="form-control">
    						<option value="1">적용 (+300000원)</option>
    						<option value="2">비적용</option>
    					</select>
    				</td>
    			</tr>
  
    			<tr>
    				<th>베이비시트 적용</th>
    				<td>
    					<select name="useseat" class="form-control">
    						<option value="1">적용 (+200000원)</option>
    						<option value="2">비적용</option>
    					</select>
    				</td>
    			</tr>
    			
    			<tr>
    				<th>차량 선탠 적용 </th>
    				<td>
    					<select name="usesuntanning" class="form-control">
    						<option value="1">적용 (+400000원)</option>
    						<option value="2">비적용</option>
    					</select>
    				</td>
    			</tr>
    			
    			<tr>
    				<th>차량 하이패스 적용 </th>
    				<td>
    					<select name="usehipass" class="form-control">
    						<option value="1">적용 (+100000원)</option>
    						<option value="2">비적용</option>
    					</select>
    				</td>
    			</tr>
    			
    			

    			<tr>
    				<th>판매가격</th>
    				<td><%=bean.getPrice() %></td>
    			</tr>
    	
    			<tr>
    				<td colspan="2" class="text-center">
    				
    				<input type="hidden" value="CarReserveResult.jsp" name="center">
    				<input type="hidden" value="<%= no %>"  name="no" >
    				<input type="submit" value="차량구매" class="form-control" style="background-color: #222222; color:#fff">
    				</td>
    			</tr>
    			
    			
    		</table>
    		</form>	
    	</div>
    	<div class="col-xs-1 col-md-1"></div>	
	</div>      
	


</div>