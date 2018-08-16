package yjc.wdb.domain;

import java.sql.Timestamp;

public class Alram {
	private int alram_no;
	private int member_no;
	private int product_no;
	private char alram_read;
	private String alram_content;
	private Timestamp alram_date;
	private int alram_distance;
	
	public int getAlram_no() {
		return alram_no;
	}
	public void setAlram_no(int alram_no) {
		this.alram_no = alram_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public char getAlram_read() {
		return alram_read;
	}
	public void setAlram_read(char alram_read) {
		this.alram_read = alram_read;
	}
	public String getAlram_content() {
		return alram_content;
	}
	public void setAlram_content(String alram_content) {
		this.alram_content = alram_content;
	}
	public Timestamp getAlram_date() {
		return alram_date;
	}
	public void setAlram_date(Timestamp alram_date) {
		this.alram_date = alram_date;
	}
	public int getAlram_distance() {
		return alram_distance;
	}
	public void setAlram_distance(int alram_distance) {
		this.alram_distance = alram_distance;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
}
