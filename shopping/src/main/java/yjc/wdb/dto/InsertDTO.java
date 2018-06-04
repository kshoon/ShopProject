package yjc.wdb.dto;

public class InsertDTO {

	private String keyval;
	private int mem_no;
	private int prod_no;
	
	public InsertDTO() {}
	
	public InsertDTO(String keyval, int mem_no) {
		this.keyval = keyval;
		this.mem_no = mem_no;
	}
	
	public InsertDTO(int prod_no, int mem_no) {
		this.prod_no = prod_no;
		this.mem_no = mem_no;
	}

}
