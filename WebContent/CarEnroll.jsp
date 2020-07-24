<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

<%
	 String userID =(String)session.getAttribute("userID");	
   	 if(userID==null){
%>
	<script>
	  alert("로그인을 먼저 해주세요");
	  location.href="DanCarMain.jsp?center=login.jsp";
	</script>

<% } %>

<div class="container marketing" id="marketing">
		<div class="row">
			<h2 class="text-center">차량판매하기</h2>
			
			<div class="col-xs-4 col-md-4"></div>
			
			<div class ="col-sm-7"></div>
		</div>
	</div>
	
	<div class="form-group">
		<form name="form-horizontal" action="CarEnrollProcess.jsp" enctype="multipart/form-data" method="post" onsubmit="return checkForm()">

			<div class="form-group">
				<label class="col-sm-2">차량번호</label>
				<div class="col-sm-10">
					<input type="text" name= "carnumber" placeholder="ex)17나1595" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2">차량명</label>
				<div class="col-sm-10">
					<input type="text" name= "name" placeholder="ex)소나타,K5" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2">제조회사</label>
				<div class="col-sm-10">
					<input type="text" name="company" placeholder="ex)현대,아우디" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-10">
					<input type="text" name = "price" placeholder="ex>----만원" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2">연료방식</label>
				<div class="col-sm-10">
					<input type="text" name = "fueltype" placeholder="가솔린/디젤/LPG"class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2">차량연식</label>
				<div class="col-sm-10">
					<input type="text" name = "modelyear" placeholder="ex)2001-01" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2">차량 크기 </label>
				<div class="col-sm-15"> 
					<select name="cartype" size=1 style="margin-left: 15px; margin-top: 5px;">
    					<option value="1">소형</option>
    					<option value="2">준중형</option>
    					<option value="3">중형</option>
    					<option value="4">중대형</option>
    					<option value="5">대형</option>
            	 	</select>
            	</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2">차량이미지</label>
				<div class="col-sm-10">
					<input class= "col-sm-8" type="file" name = "img" class="form-control" style="margin-left: -15px;">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-14 " style="margin-left: 17.65%;  margin-top: 50px;">
					<input type="submit" class="btn btn-success" value="판매등록">
					<a href = "index.jsp" class="btn btn-danger" role="button">취소</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
