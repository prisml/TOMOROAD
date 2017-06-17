package org.kosta.tomoroad.model.vo;

public class MapVO {
	private String name;
	private String cityurl;
	private double lat;
	private double lng;
	private String member_id;
	public MapVO(String name, String cityurl, double lat, double lng, String member_id) {
		super();
		this.name = name;
		this.cityurl = cityurl;
		this.lat = lat;
		this.lng = lng;
		this.member_id = member_id;
	}
	public MapVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCityurl() {
		return cityurl;
	}
	public void setCityurl(String cityurl) {
		this.cityurl = cityurl;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	@Override
	public String toString() {
		return "MapVO [name=" + name + ", cityurl=" + cityurl + ", lat=" + lat + ", lng=" + lng + ", member_id="
				+ member_id + "]";
	}
	
	
	
}
