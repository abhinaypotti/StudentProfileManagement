package com.student.profile;

public class Course {
	private String name;
	private String code;
	private String branch;
	private String degree;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public Course(String name, String code, String branch, String degree) {
		this.name = name;
		this.code = code;
		this.branch = branch;
		this.degree = degree;
	}
	
	
	
	
}
