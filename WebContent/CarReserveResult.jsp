<%@page import="dao.MemberDAO"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="dto.Car"%>
<%@page import="dto.Member"%>
<%@page import="dao.CarDAO"%> 
<%@page import="dto.CarReserveBean" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rbean" class="dto.CarReserveBean">
    <jsp:setProperty name="rbean" property="*" />
</jsp:useBean> 
 
    
<div class="container marketing" id="marketing2">
   <!-- Three columns of text below the carousel -->
      <div class="row">
<%
     
    String userID =(String)session.getAttribute("userID");
    if(userID==null){
    	
%> 
    <script>
        alert("로그인후 예약이 가능 합니다.");
        location.href="DanCarMain.jsp?center=login.jsp";
    </script>
     

             
<%       
        }else{
        	int no = Integer.parseInt(request.getParameter("no"));
   		 rbean.setId(userID);	

		//데이터 베이스에 빈클래스 저장
	
	CarDAO dao = CarDAO.getInstance();
	Car bean = dao.getOneCar1(no);
	String idd = bean.getId();
	
	CarReserveBean wbean = new CarReserveBean();


	Connection conn = null;
	Member memberVO = null;
	try {
		conn = ConnectionProvider.getConnection();
		MemberDAO member = MemberDAO.getInstance();
		memberVO = member.selectId(conn, idd);
		
		//데이터베이스에 접
		//차 하나에대한 정보를 얻어옴
		
	} catch (SQLException ex) {
		out.println("Fail to connection.<br>");
		out.println("SQLException: " + ex.getMessage());
	}	

	wbean.setId(userID);
	wbean.setReserveno(no);
	wbean.setUsehipass(Integer.parseInt(request.getParameter("usehipass")));
	wbean.setUsenavi(Integer.parseInt(request.getParameter("usenavi")));
	wbean.setUseseat(Integer.parseInt(request.getParameter("useseat")));
	wbean.setUsesuntanning(Integer.parseInt(request.getParameter("usesuntanning")));
	
	CarDAO c = CarDAO.getInstance();
	c.setReserveCar(conn, wbean);
%>
        
    <%  
        int usenavi=0;
        if(rbean.getUsenavi()==1)usenavi=300000;
        
        int useseat=0;
        if(rbean.getUseseat()==1)useseat=200000;
        
        int usesuntanning=0;
        if(rbean.getUsesuntanning()==1)usesuntanning=400000;
        
        int usehipass=0;
        if(rbean.getUsehipass()==1)usehipass=100000;
     
        int totaloption = (usenavi+useseat+usesuntanning+usehipass);
        	
        
        

       
        //차량 총 금액
        String totalcar = bean.getPrice() + (usenavi+useseat+usesuntanning+usehipass);
     
 
%>       
 
      <div class="col-sm-12">     
            <h2></h2>
            <div class="table-responsive">
            <table class="table">
                <caption></caption>
                <thead><tr><td colspan="2" class="text-center"><h2>차량 구매 완료 화면</h2></td></tr></thead>
                <tbody>
                 <tr>
                    <td colspan="2" class="text-right">
                     <img src="img/<%= bean.getImg() %>" class="img-responsive img-rounded" id="resultImg">
                    </td>
                 </tr>             
                 
                 <tr>
                  <th>차량 구매금액</th>
                  <td><%= Integer.parseInt(bean.getPrice().split("만원")[0]+"0000") %> 원</td>
                 </tr>
                  
             	  <tr>
                  <th>차량 옵션금액</th>
                  <td><%= totaloption %> 원</td>
                 </tr>

				<tr>
					<th>총 가격</th>
					<td><%= totaloption+Integer.parseInt(bean.getPrice().split("만원")[0]+"0000") %> 원</td>
				</tr>	
                 <tr>
					<th>판매자 번호</th>
					<td><%= memberVO.getPhone() %></td>
                 </tr>
     			
     				
     				
             
             </tbody>
             <th>
     				<td>거래를 하시려면 판매자에게 연락을 통하여 진행하세요. </td>
     				</th>
            </table>
            </div>
      </div>
 
 
<%

        }
    
%>
       
 </div>
  
</div>
  
  <hr class="divider">