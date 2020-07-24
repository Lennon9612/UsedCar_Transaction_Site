package dto;

public class Paging {
	 //ȭ�鿡 ������ �Խñ��� ������ ����
   private int pageSize=10;
   private int count =0; //��ü ���� ������ �����ϴ� ����
   private int number =0; //������ �ѹ��� ����
   private String pageNum;

   private int startRow;
   private int endRow;
   
   private int currentPage;
   private int pageCount;
   private int startPage;
   private int pageBlock;
   private int endPage;
   
   
   private int prev; //����
   private int next; //����
   
   
   
	public Paging(String pageNum) {
	 //���� ó�� boardList.jsp�� Ŭ���ϰų� ���� ���� �� �ٸ� �Խñۿ��� �� �������� �Ѿ���� pageNum���� ���⿡ null ó���� ����
	  if(pageNum==null){
			 pageNum="1";
	  }
	  this.pageNum=pageNum;
	  
	  //��ü ������ �ϴ� ���������ڸ� ����
	  currentPage =Integer.parseInt(pageNum);
	}
	 

	public void setTotalCount(int count){
		
		this.count=count;
		
		//���� �������� ������ ���� ��ȣ�� ���� = ������ ���̽����� �ҷ��� ���۹�ȣ
	    startRow =(currentPage-1) *pageSize+1;
		endRow =currentPage * pageSize;
		
		//���̺� ǥ���� ��ȣ�� ����
		this.number =count - (currentPage -1 ) * pageSize;
		
		//������ ���
		pageCaculator();
	}
	 
	   
   public void pageCaculator(){
   	if(count  >0){
   		
   		pageCount =count /pageSize + (count%pageSize == 0 ?  0 :1) ; //ī���͸� ���ڸ� �󸶱��� �����ٰ��� ����
   		
   		//���� ������ ���ڸ� ����
   		startPage =1;
   		
   		if(currentPage %10 !=0){
   			startPage =(int)(currentPage/10)*10+1;
   		}else{
   			startPage =((int)(currentPage/10)-1)*10+1;
   		}
   		
   		pageBlock=10;//ī���͸� ó�� ����
   		endPage =startPage+pageBlock-1;//ȭ�鿡 ������ �������� ������ ����
   		if(endPage > pageCount) endPage =pageCount;
   		
   		
   		//���� ����
   		if(startPage >pageSize)  prev =startPage-10;
   		//����
   		if(endPage < pageCount) next=startPage+10;
   	}   		
   }


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public int getNumber() {
		return number;
	}


	public void setNumber(int number) {
		this.number = number;
	}


	public String getPageNum() {
		return pageNum;
	}


	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}


	public int getStartRow() {
		return startRow;
	}


	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}


	public int getEndRow() {
		return endRow;
	}


	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getPageCount() {
		return pageCount;
	}


	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getPageBlock() {
		return pageBlock;
	}


	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getPrev() {
		return prev;
	}


	public void setPrev(int prev) {
		this.prev = prev;
	}


	public int getNext() {
		return next;
	}


	public void setNext(int next) {
		this.next = next;
	}

   
   
   
	 	
	
}