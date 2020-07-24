package dto;

public class CarViewBean {
	private String name;
	private int price;
	private String img;
	private int reserveno; //예약 아이디
	private int no; //차량 아이디
	private String id; //유저 아이디
	private int usenavi; //수량
	private int useseat;
	private int usesuntanning;
	private int usehipass;
	
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
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
		return "CarViewBean [name=" + name + ", price=" + price + ", img=" + img + ", reserveno=" + reserveno + ", no="
				+ no + ", id=" + id + ", usenavi=" + usenavi + ", useseat=" + useseat + ", usesuntanning="
				+ usesuntanning + ", usehipass=" + usehipass + "]";
	}
	
	
	
	
}