package org.kosta.tomoroad.model.vo;

public class ReviewCommentVO {
	private int no;
	private String content;
	private String postedTime;
	private int recomment;
	private ReviewVO review;
	private MemberVO member;
	private String state;

	public ReviewCommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewCommentVO(int no, String content, String postedTime, int recomment, ReviewVO review, MemberVO member,
			String state) {
		super();
		this.no = no;
		this.content = content;
		this.postedTime = postedTime;
		this.recomment = recomment;
		this.review = review;
		this.member = member;
		this.state = state;
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

	public String getPostedTime() {
		return postedTime;
	}

	public void setPostedTime(String postedTime) {
		this.postedTime = postedTime;
	}

	public int getRecomment() {
		return recomment;
	}

	public void setRecomment(int recomment) {
		this.recomment = recomment;
	}
	
	public String getRecommentId(){
		String id;
		if(recomment==0)
			id="comment-list";
		else
			id="reply"+recomment;
		return id;
	}

	public ReviewVO getReview() {
		return review;
	}

	public void setReview(ReviewVO review) {
		this.review = review;
	}

	public MemberVO getMember() {
		return member;
	}

	public void setMember(MemberVO member) {
		this.member = member;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "CommentVO [no=" + no + ", content=" + content + ", postedTime=" + postedTime + ", recomment="
				+ recomment + ", review=" + review + ", member=" + member + ", state=" + state + "]";
	}

}
