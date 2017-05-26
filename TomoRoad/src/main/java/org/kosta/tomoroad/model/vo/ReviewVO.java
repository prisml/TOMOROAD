package org.kosta.tomoroad.model.vo;

public class ReviewVO {
	private String title;
	private String content;
	private String postedTime;
	private int recommend;
	private int hits;
	private double star;
	private PlaceVO place;
	private MemberVO member;

	public ReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewVO(String title, String content, double star, PlaceVO place, MemberVO member) {
		super();
		this.title = title;
		this.content = content;
		this.star = star;
		this.place = place;
		this.member = member;
	}

	public ReviewVO(String title, String content, String postedTime, int recommend, int hits, double star,
			PlaceVO place, MemberVO member) {
		super();
		this.title = title;
		this.content = content;
		this.postedTime = postedTime;
		this.recommend = recommend;
		this.hits = hits;
		this.star = star;
		this.place = place;
		this.member = member;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPostedTime() {
		return postedTime;
	}

	public void setPostedTime(String postedTime) {
		this.postedTime = postedTime;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public double getStar() {
		return star;
	}

	public void setStar(double star) {
		this.star = star;
	}

	public PlaceVO getPlace() {
		return place;
	}

	public void setPlace(PlaceVO place) {
		this.place = place;
	}

	public MemberVO getMember() {
		return member;
	}

	public void setMember(MemberVO member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "ReviewVO [title=" + title + ", content=" + content + ", postedTime=" + postedTime + ", recommend="
				+ recommend + ", hits=" + hits + ", star=" + star + "]";
	}

}