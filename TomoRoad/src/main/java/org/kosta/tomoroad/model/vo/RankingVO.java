package org.kosta.tomoroad.model.vo;

public class RankingVO {
	private String name;
	private String detail;
	private int hit;
	private int ranking;
	
	
	public RankingVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public RankingVO(String name, String detail, int hit, int ranking) {
		super();
		this.name = name;
		this.detail = detail;
		this.hit = hit;
		this.ranking = ranking;
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


	public int getHit() {
		return hit;
	}


	public void setHit(int hit) {
		this.hit = hit;
	}


	public int getRanking() {
		return ranking;
	}


	public void setRanking(int ranking) {
		this.ranking = ranking;
	}


	@Override
	public String toString() {
		return "RankingVO [name=" + name + ", detail=" + detail + ", hit=" + hit + ", ranking=" + ranking + "]";
	}
	
	
}
