package yjc.wdb.domain;

import java.sql.Timestamp;

public class Wishlist {
	private int wishlist_no;
	private int member_no;
	private int product_no;
	private Timestamp wishlist_date;
	private int alram_check;
	
	public int getWishlist_no() {
		return wishlist_no;
	}
	public void setWishlist_no(int wishlist_no) {
		this.wishlist_no = wishlist_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public Timestamp getWishlist_date() {
		return wishlist_date;
	}
	public void setWishlist_date(Timestamp wishlist_date) {
		this.wishlist_date = wishlist_date;
	}
	public int getAlram_check() {
		return alram_check;
	}
	public void setAlram_check(int alram_check) {
		this.alram_check = alram_check;
	}
}
