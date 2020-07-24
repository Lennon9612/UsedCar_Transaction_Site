<%@ page import="dto.Car"%>
<%@ page import="dao.CarDAO"%>
<%@ page import="jdbc.ConnectionProvider"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>


<%
	String mode = request.getParameter("mode");
	//System.out.println("petList mode=" + mode);
	//out.println("petList mode=" + mode);
%>
<%
	Connection conn = null;
	try {
		conn = ConnectionProvider.getConnection();
		
		CarDAO dao = CarDAO.getInstance();
		List<Car> carList = dao.selectList(conn);
%>
		<table class="table table-hover">
		<tr>
			<th>사진</th>
			<th>차량명</th>
			<th>제조회사</th>
			<th>가격</th>
			<th>상세설명</th>
			<th></th>
			
		</tr>
<%
		for (Car c : carList) {
%>
			<tr>
				
				<td>
				<img alt = "" src="img/<%=c.getImg() %>" width="200" height="150">
				</td>
				<td><h2><%=c.getName()%></h2></td>
				<td><h2><%=c.getCompany()%></h2></td>
				<td><h2><%=c.getPrice()%></h2></td>
				
			
				<td>
					   <p><a class="btn btn-default" href="DanCarMain.jsp?center=CarReserveInfo.jsp&no=<%= c.getNo() %>" role="button">상세보기 &raquo;</a></p>
			</tr>
<%
		}
%>
		</table>					
<%
	} catch (SQLException ex) {
		out.println("Fail to connection.<br>");
		out.println("SQLException: " + ex.getMessage());
	}
%>	