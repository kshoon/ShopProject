package yjc.wdb.dto;

import yjc.wdb.domain.Shop;

public class MakLatLon {
	private double lat;
	private double lon;
	private double met;
	private MakDTO dto;
	private Shop shop;
	
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLon() {
		return lon;
	}
	public void setLon(double lon) {
		this.lon = lon;
	}
	public double getMet() {
		return met;
	}
	public void setMet(double met) {
		this.met = met;
	}
	public MakDTO getDto() {
		return dto;
	}
	public void setDto(MakDTO dto) {
		this.dto = dto;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
		
	}
	public Shop getShop() {
		return shop;
	}
	
}
