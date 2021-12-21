package com.student.profile;

public class JobProfile {
	private String jobid;
	private String company;
	private String ctc;
	private String cgpa;
	private String link;
	public String getJobid() {
		return jobid;
	}
	public void setJobid(String jobid) {
		this.jobid = jobid;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getCtc() {
		return ctc;
	}
	public void setCtc(String ctc) {
		this.ctc = ctc;
	}
	public String getCgpa() {
		return cgpa;
	}
	public void setCgpa(String cgpa) {
		this.cgpa = cgpa;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public JobProfile(String jobid, String company, String ctc, String cgpa, String link) {
		this.jobid = jobid;
		this.company = company;
		this.ctc = ctc;
		this.cgpa = cgpa;
		this.link = link;
	}
	
}
