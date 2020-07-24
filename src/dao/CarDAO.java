package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import dto.CarViewBean;
import dto.Member;
import dto.CarReserveBean;
import dto.Car;
import jdbc.ConnectionProvider;




public class CarDAO {
	public CarDAO() { 
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private static CarDAO instance = new CarDAO();
	public static CarDAO getInstance(){
		return instance;
	} 
	
	
	
	// selectList
		public List<Car> selectList(Connection conn) throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				String sql = "select * from car";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				List<Car> carList = new ArrayList<>();
				while (rs.next()) {
					carList.add(createFromResultSet(rs));
				}
				return carList;
			} finally {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			}
		}
		

	
	public Car createFromResultSet(ResultSet rs) throws SQLException {
		int no = rs.getInt("no");
		String carnumber = rs.getString("carnumber");
		String name = rs.getString("name");
		int cartype = rs.getInt("cartype");
		String price = rs.getString("price");
		String company = rs.getString("company");
		String fueltype = rs.getString("fueltype");
		String modelyear = rs.getString("modelyear");
		String img = rs.getString("img");
		
		Car car = new Car(no,carnumber, name, cartype, price, company, fueltype,modelyear,img);
		return car;
	}
	
	public int insert(Connection conn, Car car,String id) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			System.out.println("company 확인2 : " + car.getCompany());
			String sql = "insert into car values ((select max(no+1) from car a),?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, car.getCarnumber());
			pstmt.setString(2, car.getName());
			pstmt.setString(3, car.getPrice());
			pstmt.setString(4, car.getCompany());
			pstmt.setString(5, car.getFueltype());
			pstmt.setString(6, car.getModelyear());
			pstmt.setInt(7, car.getCartype());
			pstmt.setString(8, car.getImg());
			pstmt.setString(9, id);
			return pstmt.executeUpdate();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}
	}
	
	//占쌍신쇽옙 占쌘듸옙占쏙옙 3占쎈만 占쏙옙占쏙옙
		public Vector<Car> getSelectCar() throws SQLException {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Vector<Car> v = new Vector<Car>();
			
			try {
				String sql ="select * from car";	
				conn = ConnectionProvider.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				int count = 0;
				
				while (rs.next()) {
					Car bean = new Car();
					bean.setNo(rs.getInt(1));
					bean.setCarnumber(rs.getString(2));
					bean.setName(rs.getString(3));
					bean.setPrice(rs.getString(4));
					bean.setCompany(rs.getString(5));
					bean.setFueltype(rs.getString(6));
					bean.setModelyear(rs.getString(7));
					bean.setCartype(rs.getInt(8));
					bean.setImg(rs.getString(9));
					v.add(bean);
					count++;
					if(count > 3) break;
					
				}
				return v;
				} finally {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			}
		}
	
	public Vector<Car> getAllCar() throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;
		try {
			String sql = "select * from car";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			Vector<Car> v = new Vector<>();
			while(rs.next()) {
				v.add(createFromResultSet(rs));
			}
			return v;
			
		} finally {
			if(rs!= null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
		}	
	}
	public Car getOneCar1(int no) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;
		Car bean = new Car();
		
		try {
			String sql ="select * from car where no=?";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				
				bean.setNo(rs.getInt(1));
				bean.setCarnumber(rs.getString(2));
				bean.setName(rs.getString(3));
				bean.setPrice(rs.getString(4));
				bean.setCompany(rs.getString(5));
				bean.setFueltype(rs.getString(6));
				bean.setModelyear(rs.getString(7));
				bean.setCartype(rs.getInt(8));
				bean.setImg(rs.getString(9));
				bean.setId(rs.getString(10));
			}
			return bean;
			
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
		} 
	}
	

	
		
		// CartypeList
				public List<Car> CartypeList(String cartype,String query) throws SQLException {
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					System.out.println(cartype+"    "+query );
					try {
						String sql = "select * from car where "+query+"=" +"'" +cartype+"'";
						conn = ConnectionProvider.getConnection();
						pstmt = conn.prepareStatement(sql);
						
						rs = pstmt.executeQuery();
						List<Car> carList = new ArrayList<>();
						while (rs.next()) {
							carList.add(createFromResultSet(rs));
						}
						return carList;
					} finally {
						if (rs != null) {
							rs.close();
						}
						if (pstmt != null) {
							pstmt.close();
						}
					}
				}
	
	
	
	
	

	public int getMember(String id, String pass) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result =0;
	
		try{
			String sql ="select count(*) from member where id =? and pass=?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();
			if(rs.next()){
				result=rs.getInt(1);
			}
		
		} finally{
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
		}
		return result;
	}
	

	public int setReserveCar(Connection conn, CarReserveBean wbean) throws SQLException  {
		PreparedStatement pstmt = null;
		try{
			String sql ="insert into carbuylist (reserveno, no, id, usenavi, useseat, usesuntanning, usehipass)"
					+ " values(?, (select ifnull(max(no)+1,0+1) from carbuylist as b), ?, ?, ?, ?, ?)";
			pstmt =conn.prepareStatement(sql);
		
			pstmt.setInt(1, wbean.getReserveno());
			pstmt.setString(2, wbean.getId());
			pstmt.setInt(3, wbean.getUsenavi());
			pstmt.setInt(4, wbean.getUseseat());
			pstmt.setInt(5, wbean.getUsesuntanning());
			pstmt.setInt(6, wbean.getUsehipass());
			return pstmt.executeUpdate();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}}}
	
	public int insertBuylist(Connection conn, CarReserveBean bean) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into carbuylist (reserveno, no, id, usenavi, useseat, usesuntanning, usehipass)"
					+ " values(0, ?, 0, 0, 0, 0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getNo());
			pstmt.setString(2, bean.getId());
			pstmt.setInt(3, bean.getUsenavi());
			pstmt.setInt(4, bean.getUseseat());
			pstmt.setInt(5, bean.getUsesuntanning());
			pstmt.setInt(6, bean.getUsehipass());
			return pstmt.executeUpdate();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}
	}
	
	
	
	public Vector<CarViewBean> getAllReserve(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector<CarViewBean> v=new Vector<CarViewBean>();
		CarViewBean bean=null;
		
		try{
		
			String sql="select * from car natural join carbuylist where  sysdate < to_date(rday, 'YYYY-MM-DD') and id= ?";
			
			pstmt =conn.prepareStatement(sql);
			//?
			pstmt.setString(1, id);
		
			rs=pstmt.executeQuery();
			while(rs.next()){
				bean=new CarViewBean();
				bean.setName(rs.getString("name"));
				bean.setImg(rs.getString("img"));
				bean.setPrice(rs.getInt("price"));
				bean.setUsenavi(rs.getInt("usenavi"));
				bean.setUseseat(rs.getInt("useseat"));
				bean.setUsesuntanning(rs.getInt("usesuntanning"));
				bean.setUsehipass(rs.getInt("usehipass"));
				v.add(bean);
	
			}
			
		
		} finally{
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
		}
		return v;
	}
	
	
	
	
	public List<Map<String,String>> getBuyList(String id) throws SQLException {
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		 List<Map<String,String>> list =new ArrayList<Map<String,String>>();
		
		try{

			String sql="select a.name,a.price,if(b.usenavi = 1,'옵션있음','옵션없음') as navi ,if(b.useseat = 1,'옵션있음','옵션없음') as seat,if(b.usesuntanning = 1,'옵션있음','옵션없음') as suntan,if(b.usehipass = 1,'옵션있음','옵션없음') as hipass,a.img,b.reserveno ,b.id from car a join carbuylist b on a.no = b.reserveno where b.id = ?";
			pstmt =conn.prepareStatement(sql);
			//?
			pstmt.setString(1, id);

			rs=pstmt.executeQuery();
			while(rs.next()){
				Map<String,String> map =new HashMap<String,String>();
				map.put("name", rs.getString("name"));
				map.put("img", rs.getString("img"));
				map.put("price", rs.getString("price"));
				map.put("usenavi", rs.getString("navi"));
				map.put("useseat", rs.getString("seat"));
				map.put("usesuntanning", rs.getString("suntan"));
				map.put("usehipass", rs.getString("hipass"));
				map.put("reserveno", rs.getString("reserveno"));
				map.put("id", rs.getString("id"));
				list.add(map);
			}
			
			
		} finally{
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
		}
		return list;
	}
	
	public String getBuyListPhone(String id) throws SQLException {
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String phone = null;
		
		try{
			
			String sql="select phone from member where id = '"+id+"' limit 1";
			pstmt =conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				phone =  rs.getString("phone");
			}
			
			
		} finally{
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
		}
		return phone;
	}
	
	private void closed(){
		try{
			//占쌘울옙 占쌥놂옙
			if(rs!=null)conn.close();
			if(pstmt!=null)conn.close();
			if(conn!=null)conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//占싹놂옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
	public void carRemoveReserve( int reserveno) {
		
	
		
		try{
			String sql="delete from carbuylist where reserveno=?";
			conn = ConnectionProvider.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, reserveno);
			pstmt.executeUpdate();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		} finally {
				closed();
			}
		}
	}
	
	
	
	

	
