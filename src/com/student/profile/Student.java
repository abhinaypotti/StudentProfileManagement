package com.student.profile;

public class Student {
	private String name;
	private String rollno;
	private String password;
	private String campus;
	private String degree;
	private String branch;
	private String section;
	private String advisor;
	private String dob;
	private String gender;
	private String email;
	private String mobile;
	private String nationality;
	private String mothertongue;
	private String blood;
	private String joining;
	private String address;
	private String pname;
	private String pemail;
	private String pmobile;
	private String hostel;
	private String room;
	private String fees;
	private String warden;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRollno() {
		return rollno;
	}
	public void setRollno(String rollno) {
		this.rollno = rollno;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCampus() {
		return campus;
	}
	public void setCampus(String campus) {
		this.campus = campus;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getAdvisor() {
		return advisor;
	}
	public void setAdvisor(String advisor) {
		this.advisor = advisor;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getMothertongue() {
		return mothertongue;
	}
	public void setMothertongue(String mothertongue) {
		this.mothertongue = mothertongue;
	}
	public String getBlood() {
		return blood;
	}
	public void setBlood(String blood) {
		this.blood = blood;
	}
	public String getJoining() {
		return joining;
	}
	public void setJoining(String joining) {
		this.joining = joining;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPemail() {
		return pemail;
	}
	public void setPemail(String pemail) {
		this.pemail = pemail;
	}
	public String getPmobile() {
		return pmobile;
	}
	public void setPmobile(String pmobile) {
		this.pmobile = pmobile;
	}
	public String getHostel() {
		return hostel;
	}
	public void setHostel(String hostel) {
		this.hostel = hostel;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public String getFees() {
		return fees;
	}
	public void setFees(String fees) {
		this.fees = fees;
	}
	public String getWarden() {
		return warden;
	}
	public void setWarden(String warden) {
		this.warden = warden;
	}
	public Student(String name, String rollno, String password, String campus, String degree, String branch,
			String section, String advisor, String dob, String gender, String email, String mobile, String nationality,
			String mothertongue, String blood, String joining, String address, String pname, String pemail,
			String pmobile, String hostel, String room, String fees, String warden) {
		this.name = name;
		this.rollno = rollno;
		this.password = password;
		this.campus = campus;
		this.degree = degree;
		this.branch = branch;
		this.section = section;
		this.advisor = advisor;
		this.dob = dob;
		this.gender = gender;
		this.email = email;
		this.mobile = mobile;
		this.nationality = nationality;
		this.mothertongue = mothertongue;
		this.blood = blood;
		this.joining = joining;
		this.address = address;
		this.pname = pname;
		this.pemail = pemail;
		this.pmobile = pmobile;
		this.hostel = hostel;
		this.room = room;
		this.fees = fees;
		this.warden = warden;
	}
	@Override
	public String toString() {
		return "Student [name=" + name + ", rollno=" + rollno + ", password=" + password + ", campus=" + campus
				+ ", degree=" + degree + ", branch=" + branch + ", section=" + section + ", advisor=" + advisor
				+ ", dob=" + dob + ", gender=" + gender + ", email=" + email + ", mobile=" + mobile + ", nationality="
				+ nationality + ", mothertongue=" + mothertongue + ", blood=" + blood + ", joining=" + joining
				+ ", address=" + address + ", pname=" + pname + ", pemail=" + pemail + ", pmobile=" + pmobile
				+ ", hostel=" + hostel + ", room=" + room + ", fees=" + fees + ", warden=" + warden + "]";
	}
	
	
}
