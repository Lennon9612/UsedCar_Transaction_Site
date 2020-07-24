package dto;


public class Car {
	private int no;
	private String carnumber;
	private String name;
	private int cartype; 
	private String price;
	private String company;
	private String fueltype;
	private String modelyear;
	private String img;
	private String id;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Car() {
		this(0, "", "", 0, "", "", "", "", "");
	}
	public Car(int no, String carnumber, String name, int cartype, String price, String company, String fueltype,String modelyear,String img) {
		this.no = no;
		this.carnumber= carnumber;
		this.name = name;
		this.cartype = cartype;
		this.price = price;
		this.company = company;
		this.fueltype = fueltype;
		this.modelyear= modelyear;
		this.img = img;
	}
	
	
	
	public String getCarnumber() {
		return carnumber;
	}

	public void setCarnumber(String carnumber) {
		this.carnumber = carnumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCartype() {
		return cartype;
	}

	public void setCartype(int cartype) {
		this.cartype = cartype;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getFueltype() {
		return fueltype;
	}

	public void setFueltype(String fueltype) {
		this.fueltype = fueltype;
	}

	public String getModelyear() {
		return modelyear;
	}

	public void setModelyear(String modelyear) {
		this.modelyear = modelyear;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	@Override
	public String toString() {
		return "Car [no=" + no + ", carnumber=" + carnumber + ", name=" + name + ", cartype=" + cartype + ", price="
				+ price + ", company=" + company + ", fueltype=" + fueltype + ", modelyear=" + modelyear + ", img="
				+ img + "]";
	}
	

}
