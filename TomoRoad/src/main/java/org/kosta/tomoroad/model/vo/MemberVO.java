package org.kosta.tomoroad.model.vo;

public class MemberVO {
	private String id;
	private String password;
	private String name;
	private String sex;
	private String tel;
	private String profile;
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberVO(String id, String password, String name, String sex, String tel, String profile) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.sex = sex;
		this.tel = tel;
		this.profile = profile;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", sex=" + sex + ", tel=" + tel
				+ ", profile=" + profile + "]";
	}
}
