package org.kosta.tomoroad.model.burn;

public class BurnVO {
	private int no;
	private String title;
	private String postedTime;
	private String content;
	private String stationName;
	private String memberId;
	
	public BurnVO() {
		super();
	}

	public BurnVO(int no, String title, String postedTime, String content, String stationName, String memberId) {
		super();
		this.no = no;
		this.title = title;
		this.postedTime = postedTime;
		this.content = content;
		this.stationName = stationName;
		this.memberId = memberId;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPostedTime() {
		return postedTime;
	}

	public void setPostedTime(String postedTime) {
		this.postedTime = postedTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStationName() {
		return stationName;
	}

	public void setStationName(String stationName) {
		this.stationName = stationName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "BurnVO [no=" + no + ", title=" + title + ", postedTime=" + postedTime + ", content=" + content
				+ ", stationName=" + stationName + ", memberId=" + memberId + "]";
	}
		
}


