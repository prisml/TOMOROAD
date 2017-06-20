package org.kosta.tomoroad.model.vo;

public class TravelVO {
	private String id;
	private String route;
	private String flag;
	public TravelVO(String id, String route,String flag) {
		super();
		this.id = id;
		this.route = route;
		this.flag=flag;
	}
	public TravelVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRoute() {
		return route;
	}
	public void setRoute(String route) {
		this.route = route;
	}
	
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	@Override
	public String toString() {
		return "TravelVO [id=" + id + ", route=" + route +"flag=" +flag+ "]";
	}
	
	
	
}
