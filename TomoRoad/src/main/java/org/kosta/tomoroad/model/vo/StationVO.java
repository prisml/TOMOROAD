package org.kosta.tomoroad.model.vo;

public class StationVO {
	private String name;
	private String detail;
	private int stayed_time;
	
	@Override
	public String toString() {
		return "StationVO [name=" + name + ", detail=" + detail + ", stayed_time=" + stayed_time + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getStayed_time() {
		return stayed_time;
	}
	public void setStayed_time(int stayed_time) {
		this.stayed_time = stayed_time;
	}
	public StationVO() {
		super();
	}
	public StationVO(String name, String detail, int stayed_time) {
		super();
		this.name = name;
		this.detail = detail;
		this.stayed_time = stayed_time;
	}
}
