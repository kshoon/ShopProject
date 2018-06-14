package yjc.wdb.dto;

public class MyWishShopDTO {
	private int shop_no;
	private String shop_name;
	private double shop_gps_longitude;
	private double shop_gps_latitude;
	private int product_no;
	private String product_name;
	public int getShop_no() {
		return shop_no;
	}
	public void setShop_no(int shop_no) {
		this.shop_no = shop_no;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
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
}
