<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<!-- ����ڵ����͸� �о�帮�� ��Ŭ��������  -->
<jsp:useBean id="boardbean" class="dto.BoardBean">
  <jsp:setProperty name="boardbean" property="*" />
</jsp:useBean>
<%
 	//������ ���̽��� ����
 	BoardDAO bdao = BoardDAO.getInstance();
	//�ش� �Խñ��� �н����尪�� ����
	String pass=bdao.getPass(boardbean.getNum());
	
	//���� �н����尪�� update �� �ۼ��ߴ� password ���� ������ ��
	if(pass.equals(boardbean.getPassword())){
		
		//������ �����ϴ� �޼ҵ� ȣ��
		bdao.updateBoard(boardbean);
		//������ �Ϸ�Ǹ� ��ü �Խñ� ����
		%>
	
<script>
	location.href="DanCarMain.jsp?center=BoardList.jsp";
</script>

<%	
	}else{ //�н����尡 Ʋ���ٸ�
%>
<script>
	alert("�н����尡 ��ġ ���� �ʽ��ϴ�. �ٽ� Ȯ�� �� �������ּ���.");
	history.go(-1);
</script>
<%
	}
%>