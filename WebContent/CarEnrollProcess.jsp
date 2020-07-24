<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Car"%>
<%@ page import="dao.CarDAO"%>
<%@ page import="jdbc.ConnectionProvider"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.sql.*"%>

  
<%
	String savePath = request.getSession().getServletContext().getRealPath("img");
	System.out.println(savePath);
	
	//파일 크기 15MB로 제한
	int sizeLimit = 1024*1024*15;
	
	//↓ request 객체,               ↓ 저장될 서버 경로,       ↓ 파일 최대 크기,    ↓ 인코딩 방식,       ↓ 같은 이름의 파일명 방지 처리
	//(HttpServletRequest request, String saveDirectory, int maxPostSize, String encoding, FileRenamePolicy policy)
	//아래와 같이 MultipartRequest를 생성만 해주면 파일이 업로드 된다.(파일 자체의 업로드 완료)
	MultipartRequest multi= new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());


	int no = 0;
	String carnumber = multi.getParameter("carnumber");
	String name = multi.getParameter("name");
	int cartype = Integer.parseInt(multi.getParameter("cartype"));
	String price = multi.getParameter("price");
	String company = multi.getParameter("company");
	String fueltype = multi.getParameter("fueltype");
	String modelyear = multi.getParameter("modelyear");
	String img = multi.getFilesystemName("img");
	String id =(String) session.getAttribute("userID");
	System.out.println("company 확인1 : "+ company);
	
	Car car = new Car(no, carnumber, name, cartype, price, company, fueltype, modelyear, img);
	
	//out.println("<br>" + member + "<br>");
%>
<%
	Connection conn = null;
	try {
		conn = ConnectionProvider.getConnection();
		CarDAO dao = CarDAO.getInstance();
		dao.insert(conn, car,id);
		response.sendRedirect("index.jsp");
	} catch (SQLException ex) {
		out.println("Fail to connection.<br>");
		out.println("SQLException: " + ex.getMessage());
	}	
%>