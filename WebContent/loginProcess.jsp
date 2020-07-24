<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="dto.Member"%>
<%@ page import="dao.MemberDAO"%>
<%@ page import="dao.NotFoundException"%> 
<%@ page import="jdbc.ConnectionProvider"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.sql.*"%>
<%
	String id = request.getParameter("userID");
	String pw = request.getParameter("userPW");

	String save = request.getParameter("save");
	if (save != null && save.equals("on")) { // the latest user ID & PW
		Cookie cookieID = new Cookie("userID", id);
		response.addCookie(cookieID);
		Cookie cookiePW = new Cookie("userPW", pw);
		response.addCookie(cookiePW);
		//out.println("Cookie Creation Successful~");
	}
	
	Connection conn = null;
	try {
		conn = ConnectionProvider.getConnection();
		MemberDAO dao = MemberDAO.getInstance();
	
		Member member = dao.select(conn, id, pw);
		if (member == null) {
			throw new NotFoundException("Member Not Found with id=" + id);
		}
		session.setMaxInactiveInterval(10 * 60); // 10 minute
		session.setAttribute("userID", id);
		session.setAttribute("userPW", pw);
		System.out.println("Session Successful~");
		response.sendRedirect("index.jsp");
%>
<%
	} catch (NotFoundException e) {
%>

		<script>

		alert("회원 아이디 또는 패스워드가 틀립니다.");

		location.href="DanCarMain.jsp?center=login.jsp";

	</script>
		
<%		
	} catch (SQLException e) {	
%>
	<script>

		alert("회원 아이디 또는 패스워드가 틀립니다.");

		location.href="DanCarMain.jsp?center=login.jsp";

	</script>
<%
	} finally {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.getMessage();
			}
		}
	}
%>
