package yjc.wdb.dto;

public class alrListDTO {
	private int	shop_no;
	private int member_no;
	private double shop_gps_longitude;
	private double shop_gps_latitude;
	private int soldout_check;
	private int product_no;
	private String product_name;
	private double met;
	private int key_no;
	private String content;
	public int getShop_no() {
		return shop_no;
	}
	public void setShop_no(int shop_no) {
		this.shop_no = shop_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public double getShop_gps_longitude() {
		return shop_gps_longitude;
	}
	public void setShop_gps_longitude(double shop_gps_longitude) {
		this.shop_gps_longitude = shop_gps_longitude;
	}
	public double getShop_gps_latitude() {
		return shop_gps_latitude;
	}
	public void setShop_gps_latitude(double shop_gps_latitude) {
		this.shop_gps_latitude = shop_gps_latitude;
	}
	public int getSoldout_check() {
		return soldout_check;
	}
	public void setSoldout_check(int soldout_check) {
		this.soldout_check = soldout_check;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public double getMet() {
		return met;
	}
	public void setMet(double met) {
		this.met = met;
	}
	public int getKey_no() {
		return key_no;
	}
	public void setKey_no(int key_no) {
		this.key_no = key_no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
