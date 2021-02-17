package com.yoon.ha;

public class FoodLogVo {
	private int no;
	private String fname;
	private String store;
	private String price;
	private String star;
	private String date;
	private String type;
	private String comment;
	private String pfile;
	public FoodLogVo() {
		// 기본 생성자
	}
	public FoodLogVo(int no) {
		this(no,"","","","","","","","");
	}
	public FoodLogVo(int no, String fname, String store, String price, String star, String date, String type,
			String comment, String pfile) {
		this.no = no;
		this.fname = fname;
		this.store = store;
		this.price = price;
		this.star = star;
		this.date = date;
		this.type = type;
		this.comment = comment;
		this.pfile = pfile;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getPfile() {
		return pfile;
	}

	public void setPfile(String pfile) {
		this.pfile = pfile;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((comment == null) ? 0 : comment.hashCode());
		result = prime * result + ((date == null) ? 0 : date.hashCode());
		result = prime * result + ((fname == null) ? 0 : fname.hashCode());
		result = prime * result + no;
		result = prime * result + ((pfile == null) ? 0 : pfile.hashCode());
		result = prime * result + ((price == null) ? 0 : price.hashCode());
		result = prime * result + ((star == null) ? 0 : star.hashCode());
		result = prime * result + ((store == null) ? 0 : store.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FoodLogVo other = (FoodLogVo) obj;
		if (comment == null) {
			if (other.comment != null)
				return false;
		} else if (!comment.equals(other.comment))
			return false;
		if (date == null) {
			if (other.date != null)
				return false;
		} else if (!date.equals(other.date))
			return false;
		if (fname == null) {
			if (other.fname != null)
				return false;
		} else if (!fname.equals(other.fname))
			return false;
		if (no != other.no)
			return false;
		if (pfile == null) {
			if (other.pfile != null)
				return false;
		} else if (!pfile.equals(other.pfile))
			return false;
		if (price == null) {
			if (other.price != null)
				return false;
		} else if (!price.equals(other.price))
			return false;
		if (star == null) {
			if (other.star != null)
				return false;
		} else if (!star.equals(other.star))
			return false;
		if (store == null) {
			if (other.store != null)
				return false;
		} else if (!store.equals(other.store))
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "FoodLogVo [no=" + no + ", fname=" + fname + ", store=" + store + ", price=" + price + ", star=" + star
				+ ", date=" + date + ", type=" + type + ", comment=" + comment + ", pfile=" + pfile + "]";
	}
	
}
