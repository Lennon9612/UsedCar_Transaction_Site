<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Member"%>
<%@ page import="dao.MemberDAO"%>
<%@ page import="jdbc.ConnectionProvider"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.sql.*"%>
  
<%
	String id = request.getParameter("memberId");
	String password = request.getParameter("memberPassword");
	String name = request.getParameter("memberName");
	String phone = request.getParameter("memberPhone");
	Member member = new Member(id, password, name, phone);
	//out.println("<br>" + member + "<br>");
%>
<%
	Connection conn = null;
	try {
		conn = ConnectionProvider.getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.insert(conn, member);
		response.sendRedirect("index.jsp");
	} catch (SQLException ex) {
		out.println("Fail to connection.<br>");
		out.println("SQLException: " + ex.getMessage());
	}	
%>