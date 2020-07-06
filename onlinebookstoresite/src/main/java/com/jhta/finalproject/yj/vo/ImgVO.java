package com.jhta.finalproject.yj.vo;

public class ImgVO {
	private String imgorgfilename; // 원래파일이름
	private int imgnum; // 이미지번호
	private String imgsavefilename; // 저장파일이름
	private int thumbnail; // 썸네일
	private int btype; // 책타입(중고인지 새책인지)
	private int bnum; // 책번호

	public ImgVO() {
	}

	public ImgVO(String imgorgfilename, int imgnum, String imgsavefilename, int thumbnail, int btype, int bnum) {
		super();
		this.imgorgfilename = imgorgfilename;
		this.imgnum = imgnum;
		this.imgsavefilename = imgsavefilename;
		this.thumbnail = thumbnail;
		this.btype = btype;
		this.bnum = bnum;
	}

	public String getImgorgfilename() {
		return imgorgfilename;
	}

	public void setImgorgfilename(String imgorgfilename) {
		this.imgorgfilename = imgorgfilename;
	}

	public int getImgnum() {
		return imgnum;
	}

	public void setImgnum(int imgnum) {
		this.imgnum = imgnum;
	}

	public String getImgsavefilename() {
		return imgsavefilename;
	}

	public void setImgsavefilename(String imgsavefilename) {
		this.imgsavefilename = imgsavefilename;
	}

	public int getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(int thumbnail) {
		this.thumbnail = thumbnail;
	}

	public int getBtype() {
		return btype;
	}

	public void setBtype(int btype) {
		this.btype = btype;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
}
