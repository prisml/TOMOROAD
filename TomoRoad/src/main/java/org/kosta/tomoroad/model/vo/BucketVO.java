package org.kosta.tomoroad.model.vo;

public class BucketVO {
	private String id;
	private String name;
	public BucketVO(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public BucketVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "BucketVO [id=" + id + ", name=" + name + "]";
	}
	
}
