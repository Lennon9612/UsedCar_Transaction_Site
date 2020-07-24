package dao;


import java.sql.Connection;
import dto.BoardBean;
import jdbc.ConnectionProvider;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;



public class BoardDAO {
	private BoardDAO() { 
	}
	
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance(){
		return instance;
	} 
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public String getDate() { 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			String sql = "select NOW()";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {

				return rs.getString(1);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //�����ͺ��̽� ����

	}
	
	//�ϳ��� ���ο� �Խñ��� �Ѿ�ͼ� ����Ǵ� �޼ҵ�
	public void insertBoard(BoardBean bean){
		//��Ŭ������ �Ѿ���� �ʾҴ� �����͵��� �ʱ�ȭ ���־�� �մϴ�.
		
		//��Ŭ������ �Ѿ���� �ʾҴ� �����͵��� �ʱ�ȭ ���־�� �մϴ�.
		int ref=0; //�۱׷��� �ǹ� = ������ ������Ѽ� ����ū ref ���� ������ ��  +1�� �����ָ��
		int re_step=1; //�����̱⿡ = �θ��
		int re_level=1; 
		try{
			conn = ConnectionProvider.getConnection();
			String refsql ="select max(ref) from board ";
			pstmt =conn.prepareStatement(refsql);
			//���������� ����� ����
			rs=pstmt.executeQuery();
			if(rs.next()){ //��� ���� ���ٸ�
				ref =rs.getInt(1)+1;//�ִ밪�� +1 �� ���ؼ� �۱׷��� ����
			}
			//������ �Խñ� ��ü���� ���̺� ����
//			String sql =" insert into board values( board_seq.NEXTVAL, ?, ? , ?, ? , )";
			
			String sql =" insert into BOARD VALUES((select IFNULL(max(num+1),0) from board a),?,?,?,?,?,?,?,?,0,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setString(5, getDate());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			pstmt.setString(9, bean.getContent());
			//������ �����Ͻÿ�
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//�ڿ� �ݳ�
			closed();
		}
	}
	
	
	
	//��� �Խñ��� �������ִ� 
	public Vector<BoardBean> getAllBoard(int start, int end){	
		Vector<BoardBean> v =new Vector<>();
		
		try{
			//���� �غ�
			String sql ="select *  from (select A.* from (select * from board order by ref desc, re_step asc) A ) aa where num >= ? and num <= ?;";
					
			conn = ConnectionProvider.getConnection();
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();
			//������ ������ ����� �𸣱⿡ �ݺ����� �̿��Ͽ� �����͸� ����
			while(rs.next()){
				//�����͸� ��Ű¡( ����  = Boardbean Ŭ������ �̿�)����
				BoardBean bean =new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("WRITER"));
				bean.setEmail(rs.getString("EMAIL"));
				bean.setSubject(rs.getString("SUBJECT"));
				bean.setPassword(rs.getString("PASSWORD"));
				bean.setReg_date(rs.getDate("REG_DATE").toString());
				bean.setRef(rs.getInt("ref"));
				bean.setRe_step(rs.getInt("RE_STEP"));
				bean.setRe_level(rs.getInt("RE_LEVEL"));
				bean.setReadcount(rs.getInt("READCOUNT"));
				bean.setContent(rs.getString("CONTENT"));
				//��Ű¡�� �����͸� ���Ϳ� ����
				v.add(bean);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//�ڿ� �ݳ�
			closed();
		}
		return v;
	}
	
	//�ϳ��� �Խñ��� �����ϴ� �޼ҵ�
	public BoardBean getOneBoard(int num){
		
		BoardBean bean =new BoardBean();
		
		try{
			
			//��ȸ�� ��������
			String readsql ="update board set readcount = readcount+1 where num=?";
			conn = ConnectionProvider.getConnection();
			pstmt =conn.prepareStatement(readsql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			
			//�����غ�
			String sql ="select * from board where num=?";
			//�������ఴü
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			//���� ������ ����� ����
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("WRITER"));
				bean.setEmail(rs.getString("EMAIL"));
				bean.setSubject(rs.getString("SUBJECT"));
				bean.setPassword(rs.getString("PASSWORD"));
				bean.setReg_date(rs.getDate("REG_DATE").toString());
				bean.setRef(rs.getInt("ref"));
				bean.setRe_step(rs.getInt("RE_STEP"));
				bean.setRe_level(rs.getInt("RE_LEVEL"));
				bean.setReadcount(rs.getInt("READCOUNT"));
				bean.setContent(rs.getString("CONTENT"));				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//�ڿ� �ݳ�
			closed();
		}
		return bean;
	}
	
	
	//�ڿ� �ݳ� �޼ҵ�
	private void closed(){
		try{
			//�ڿ� �ݳ�
			if(rs!=null)conn.close();
			if(pstmt!=null)conn.close();
			if(conn!=null)conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	
	
	//boardUpdate�� Delete �� �ϳ��� �Խñ��� ����
	public BoardBean getOneUpdateBoard(int num){
		//����Ÿ�� ����
		BoardBean bean =new BoardBean();
		
		
		try{
			
			
			String sql ="select * from board where num=?";
			conn = ConnectionProvider.getConnection();

			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			//���� ������ ����� ����
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("WRITER"));
				bean.setEmail(rs.getString("EMAIL"));
				bean.setSubject(rs.getString("SUBJECT"));
				bean.setPassword(rs.getString("PASSWORD"));
				bean.setReg_date(rs.getDate("REG_DATE").toString());
				bean.setRef(rs.getInt("ref"));
				bean.setRe_step(rs.getInt("RE_STEP"));
				bean.setRe_level(rs.getInt("RE_LEVEL"));
				bean.setReadcount(rs.getInt("READCOUNT"));
				bean.setContent(rs.getString("CONTENT"));				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//�ڿ� �ݳ�
			closed();
		}
		return bean;
	}
	
	//update �� delete �� �ʿ��� �н����尪�� �������ִ� �޼ҵ�
	public String getPass(int num){
		//������ ���� ��ü ����
		String pass ="";
		
		System.out.println(num);
		try{
			//�����غ�
			String sql ="select password from board where num =?";
			conn = ConnectionProvider.getConnection();
			
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1,  num);
			rs=pstmt.executeQuery();
			//�н����尪�� ����
			if(rs.next()){
				pass=rs.getString(1);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//�ڿ� �ݳ�
			closed();
		}
		return pass;
	}
	
	//�ϳ��� �Խñ��� �����ϴ� �޼ҵ�
	public void updateBoard(BoardBean bean){
		
		try{
			//���� �غ�
			String sql ="update board set subject=? , content=? where num=?";
			conn = ConnectionProvider.getConnection();
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getNum());
			pstmt.executeUpdate();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//�ڿ� �ݳ�
			closed();
		}
	}
	
	
	//�ϳ��� �Խñ��� �����ϴ� �޼ҵ� �Դϴ�.
	public void deleteBoard(int num){
		
		
		try{
			//���� �غ�
			String sql ="delete from board where num=?";
			conn = ConnectionProvider.getConnection();
			pstmt=conn.prepareStatement(sql);
			//?
			pstmt.setInt(1, num);
			//���� ����
			pstmt.executeUpdate();
			//�ڿ� �ݳ�
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//�ڿ� �ݳ�
			closed();
		}
	}
	
	
	//��ü ���� ������ �����ϴ� �޼ҵ�
	public int getAllCount(){
		
		//�Խñ� ��ü���� �����ϴ� ����
		int count =0;
		try{
			//�����غ�
			String sql ="select count(*) from board";
			conn = ConnectionProvider.getConnection();
			//������ ������ ��ü ����
			pstmt = conn.prepareStatement(sql);
			//���� ���� �� ����� ����
			rs=pstmt.executeQuery();
			if(rs.next()){
				count =rs.getInt(1);
			}
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}
	
	
	
}





