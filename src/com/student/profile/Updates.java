package com.student.profile;

public class Updates {
	private String type;
	private String details;
	private String link;
	private String date;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Updates(String type, String details, String link, String date) {
		this.type = type;
		this.details = details;
		this.link = link;
		this.date = date;
	}
	
}
