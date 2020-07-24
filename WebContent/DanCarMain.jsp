<%@page import="dto.Car"%>
<%@page import="java.util.Vector"%>
<%@page import="dao.CarDAO"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
<jsp:include page="header.jsp" />
  </head>
 <body>
  <!-- top 메뉴 -->
<jsp:include page="top2.jsp" />

<%
	String center =request.getParameter("center");
	
	if(center==null){
		center="center.jsp";
	}
%>

<jsp:include page="<%= center %>" />
 
<body>
<%
	if(request.getParameter("center")==null){
		
	
	CarDAO dao = CarDAO.getInstance();
    //벡터를 이용하여 자동차를 저장
    List<Car> v = dao.getAllCar();
%>


<div class="container marketing" id="marketing">
	<h2 class="text-center" id="carTitle"></h2>
   <!-- Three columns of text below the carousel -->
      <div class="row">


      
</div>    
 
<% } %>
 
 </body>
<!--  Bottom -->
 <jsp:include page="bottom.jsp"/>
 
 