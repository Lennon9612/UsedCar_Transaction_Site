<%@page import="dto.CarViewBean"%>
<%@page import="dto.CarReserveBean"%>
<%@page import="java.util.*"%>
<%@page import="dao.CarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%
	 String userID =(String)session.getAttribute("userID");	
   	 if(userID==null){
 	
%>
	<script>
	  alert("로그인을 먼저 해주세요");
	  location.href="DanCarMain.jsp?center=login.jsp";
	</script>

<%
	}else {
    //로그인되어있는 아이디를 가지고 옴
  	 CarDAO dao = CarDAO.getInstance();
  	List<Map<String,String>> list = dao.getBuyList(userID);
    
%>
<div class="container marketing" id="marketing2">
   <!-- Three columns of text below the carousel -->
      <div class="row">
	  <div class="col-sm-12"> 	
			<h2></h2>
			<div class="table-responsive">
			
			<table class="table text-center">
			<caption></caption>
			<thead><tr><td colspan="11" class="text-center" >
					<h2 >차량 주문 완료 화면</h2></td>
				</tr>
			</thead>	
			<tbody >
				<tr>
				 <th >이미지</th>
				 <th class="text-center">이 름</th>
				 <th class="text-center">금액</th>			 
				 <th class="text-center">네비게이션</th>
				 <th class="text-center">베이비시트</th>
				 <th class="text-center">차량선탠</th>
				 <th class="text-center">하이패스</th>
				 <th class="text-center">판매자번호</th>
				 <th class="text-center">삭제</th>
				</tr>
<%
			for(Map<String,String> map : list){
			  	String phone = dao.getBuyListPhone(map.get("id"));
%>				
			<tr>	
				<td><img src="img/<%=map.get("img") %>" class="img-responsive img-rounded" width="150" id="resultImg"></td>
				<td><%=map.get("name") %></td>
				<td><%=map.get("price") %> 원</td>
				<td><%=map.get("usenavi") %></td>
				<td><%=map.get("useseat") %></td>
				<td><%=map.get("usesuntanning") %></td>
				<td><%=map.get("usehipass")%></td>
				<td><%=phone %> </td>
				<td><button class="btn" onclick="location.href='CarReserveDel.jsp?reserveno=<%= map.get("reserveno") %>'">삭제</button></td>
				
			</tr>
<%
			}
%>

			</tbody>
			</table>
			
			</div>
	  </div>

 </div>
</div>
 
  <hr class="divider">
  <%}%>