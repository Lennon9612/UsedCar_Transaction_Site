package dto;

public class CarReserveBean {
	private int reserveno; //���� ���̵�
	private int no; //���� ���̵�
	private String id; //���� ���̵�
	private int usenavi; //����
	private int useseat;
	private int usesuntanning;
	private int usehipass;
	
	
	public int getReserveno() {
		return reserveno;
	}
	public void setReserveno(int reserveno) {
		this.reserveno = reserveno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getUsenavi() {
		return usenavi;
	}
	public void setUsenavi(int usenavi) {
		this.usenavi = usenavi;
	}
	public int getUseseat() {
		return useseat;
	}
	public void setUseseat(int useseat) {
		this.useseat = useseat;
	}
	public int getUsesuntanning() {
		return usesuntanning;
	}
	public void setUsesuntanning(int usesuntanning) {
		this.usesuntanning = usesuntanning;
	}
	public int getUsehipass() {
		return usehipass;
	}
	public void setUsehipass(int usehipass) {
		this.usehipass = usehipass;
	}
	@Override
	public String toString() {
		return "CarReserveBean [reserveno=" + reserveno + ", no=" + no + ", id=" + id + ", usenavi=" + usenavi
				+ ", useseat=" + useseat + ", usesuntanning=" + usesuntanning + ", usehipass=" + usehipass + "]";
	}
	
	
	
	
	
	
}