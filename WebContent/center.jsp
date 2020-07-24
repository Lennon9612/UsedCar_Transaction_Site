<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.Car"%>
<%@ page import="java.sql.*"%>
<%@ page import="jdbc.ConnectionProvider"%>
<%@page import="java.util.Vector"%>
<%@page import="dao.CarDAO"%>    
<%

	
	CarDAO dao = CarDAO.getInstance();
	
	Vector<Car> v = dao.getSelectCar();
%>
    
   <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
       

              
      	<%
      		for(int i=0; i< v.size() ; i++ ){
      			Car bean =v.get(i);
      			
      			String temp="";
      			String Temp="";
      			if(i==0){
      				temp="first-slide";
      				Temp="First slide";
      			}else if(i==1){
      				temp="second-slide";
      				Temp="Second slide";
      			}else if(i==2){
      				temp="third-slide";
      				Temp="Third slide";
      			}
      			
      			
      	%>
      
        <div class="item<%  if(i==0) out.write(" active");%>">
        <center> <img class="<%= temp %>" src="img/<%= bean.getImg() %>" style="width:70%;height: 480px;"> </center>
          <div class="container">
            <div class="carousel-caption">
              <h1><%=bean.getName() %></h1>
              <h1><%=bean.getCompany() %></h1>
              <h1><%=bean.getPrice() %></h1>
             
              <p><a class="btn btn-lg btn-primary" href="DanCarMain.jsp?center=CarReserveInfo.jsp&no=<%= bean.getNo() %>" role="button">상세보기</a></p>
            </div>
          </div>
        </div>
        

		<% } %>
        
        
        
      </div>
      
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span id="slideLeft"><< </span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span id="slideRight">>></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->


<div class="container">

	<div id="demo" class="carousel slide" data-ride="carousel">

		<!-- Indicators -->
		<ul class="carousel-indicators mb-0 pb-0">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
		</ul>

		<!-- The slideshow -->
		<div class="carousel-inner no-padding my-5">
			<div class="carousel-item active">
				<div class="col-xs-4 col-sm-4 col-md-4">
					<a href="#" onclick=abc(this) class="slider_info"> <img
						src="img/1.jpg" width="200" height="200" class="ui tiny left floated image">
						<div class="card-img-overlay t_img"></div>
					</a>
					<p>
					<h2>제 값을 받는다.</h2>
					</p>
					<p><h5>삶이 그대를 속일지라도 중고차 만큼은 정직하게!!</h5></p>

				</div>
				<div class="col-xs-4 col-sm-4 col-md-4">
					<a href="#" onclick=abc(this) class="slider_info"> <img
						src="img/2.jpg" width="200" height="200" class="ui tiny left floated image">
						<div class="card-img-overlay t_img"></div>
					</a>
					<p>
					<h2>처음부터 끝까지.</h2>
					</p>
					<p><h5>모든 순간 감동, 친절한 응대와 빠르고 정확한 진행과정</h5></p>

				</div>
				<div class="col-xs-4 col-sm-4 col-md-4">
					<a href="#" onclick=abc(this) class="slider_info"> <img
						src="img/3.jpg" width="200" height="200" class="ui tiny left floated image">
						<div class="card-img-overlay t_img"></div>
					</a>
					<p>
					<h2>거래는 신뢰가 생명.</h2>
					</p>
					<p><h5>고객이 좋다, 단카의 노하우는 고객사랑입니다.</h5></p>
				</div>
			</div>
			


		</div>
	</div>
</div>

        <div class="ui hidden divider"></div>

       
    </div>
</div>
