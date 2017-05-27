package org.kosta.tomoroad.model.vo;

public class PlaceVO {
	private int no;
	private String name;
	private String station_name;
	private String area;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStation_name() {
		return station_name;
	}
	public void setStation_name(String station_name) {
		this.station_name = station_name;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	@Override
	public String toString() {
		return "PlaceVO [no=" + no + ", name=" + name + ", station_name=" + station_name + ", area=" + area + "]";
	}
	public PlaceVO() {
		super();
	}
	public PlaceVO(int no, String name, String station_name, String area) {
		super();
		this.no = no;
		this.name = name;
		this.station_name = station_name;
		this.area = area;
	}
}
