package yjc.wdb.dto;

import java.sql.Timestamp;

public class WishDTO{
	private int product_no;
	private int member_no;
	private int wishlist_no;
	private String product_name;
	private Timestamp wishlist_date;
	public WishDTO() {}
	
	public WishDTO(int prod_no, int mem_no) {
		this.product_no = prod_no;
		this.member_no = mem_no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public Timestamp getWishlist_date() {
		return wishlist_date;
	}
	public void setWishlist_date(Timestamp wishlist_date) {
		this.wishlist_date = wishlist_date;
	}
	public int getWishlist_no() {
		return wishlist_no;
	}
	public void setWishlist_no(int wishlist_no) {
		this.wishlist_no = wishlist_no;
	}
}
