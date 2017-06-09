package org.kosta.tomoroad.model.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ReviewUploadVO {
	private List<MultipartFile> files;
	private String title;
	private String content;
	private int star;
	private int placeNo;

	public ReviewUploadVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewUploadVO(List<MultipartFile> files, String title, String content, int star, int placeNo) {
		super();
		this.files = files;
		this.title = title;
		this.content = content;
		this.star = star;
		this.placeNo = placeNo;
	}

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
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

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getPlaceNo() {
		return placeNo;
	}

	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}

	@Override
	public String toString() {
		return "ReviewUploadVO [files=" + files + ", title=" + title + ", content=" + content + ", star=" + star
				+ ", placeNo=" + placeNo + "]";
	}

}