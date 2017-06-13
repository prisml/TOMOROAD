package org.kosta.tomoroad.model.vo;

public class BurnCommentVO {
	private int no;
	private String content;
	private String posted_time;
	private int recomment;
	private int burn_no;
	private String member_id;
	private String state;
	private String profile;
	
		
	public BurnCommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public BurnCommentVO(int no, String content, String posted_time, int recomment, int burn_no, String member_id,
			String state, String profile) {
		super();
		this.no = no;
		this.content = content;
		this.posted_time = posted_time;
		this.recomment = recomment;
		this.burn_no = burn_no;
		this.member_id = member_id;
		this.state = state;
		this.profile = profile;
	}


	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPosted_time() {
		return posted_time;
	}
	public void setPosted_time(String posted_time) {
		this.posted_time = posted_time;
	}
	public int getRecomment() {
		return recomment;
	}
	public void setRecomment(int recomment) {
		this.recomment = recomment;
	}
	public int getBurn_no() {
		return burn_no;
	}
	public void setBurn_no(int burn_no) {
		this.burn_no = burn_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	@Override
	public String toString() {
		return "BurnCommentVO [no=" + no + ", content=" + content + ", posted_time=" + posted_time + ", recomment="
				+ recomment + ", burn_no=" + burn_no + ", member_id=" + member_id + ", state=" + state + ", profile="
				+ profile + "]";
	}
	
	
}

