package org.kosta.tomoroad.model.vo;

public class StationVO {
	private String name;
	private String detail;
	private String simpleDetail;
	private String section;
	private String img;
	
	public StationVO(String name, String detail, String simpleDetail, String section, String img) {
		super();
		this.name = name;
		this.detail = detail;
		this.simpleDetail = simpleDetail;
		this.section = section;
		this.img = img;
	}
	public StationVO() {
		super();
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
	public String getSimpleDetail() {
		return simpleDetail;
	}
	public void setSimpleDetail(String simpleDetail) {
		this.simpleDetail = simpleDetail;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	@Override
	public String toString() {
		return "StationVO [name=" + name + ", detail=" + detail + ", simpleDetail=" + simpleDetail + ", section="
				+ section + ", img=" + img + "]";
	}
}
