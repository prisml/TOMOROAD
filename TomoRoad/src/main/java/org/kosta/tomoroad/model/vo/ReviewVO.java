package org.kosta.tomoroad.model.vo;

public class ReviewVO {
	private int no;
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

	public ReviewVO(int no, String title, String content, String postedTime, int recommend, int hits, double star,
			PlaceVO place, MemberVO member) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.postedTime = postedTime;
		this.recommend = recommend;
		this.hits = hits;
		this.star = star;
		this.place = place;
		this.member = member;
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

	public String getContent() {
		return content;
	}
	
	public String getSubContent(){
		if(content.length() > 100)
			return content.substring(0, 100)+"...";
		else 
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
	
	public String getDay(){
		String date = this.postedTime;
		String day = date.substring(8, 10);
		return day;
	}
	
	public String getMonth(){
		String date = this.postedTime;
		int month = Integer.parseInt(date.substring(5, 7));
		switch(month){
		case 1: return "JAN";
		case 2: return "FAB";
		case 3: return "MAR";
		case 4: return "APR";
		case 5: return "MAY";
		case 6: return "JUN";
		case 7: return "JUL";
		case 8: return "AUG";
		case 9: return "SEP";
		case 10: return "OCT";
		case 11: return "NOV";
		case 12: return "DEC";
		default : return "noresult";
		}
	}

	@Override
	public String toString() {
		return "ReviewVO [no=" + no + ", title=" + title + ", content=" + content + ", postedTime=" + postedTime
				+ ", recommend=" + recommend + ", hits=" + hits + ", star=" + star + ", place=" + place + ", member="
				+ member + "]";
	}

}