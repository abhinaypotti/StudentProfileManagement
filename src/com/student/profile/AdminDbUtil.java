package com.student.profile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;


public class AdminDbUtil {
	
	private DataSource dataSource;
	public AdminDbUtil(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	public boolean login(Admin ad) throws Exception {
		// TODO Auto-generated method stub
		Connection myConn = null;
		PreparedStatement mystmt = null;
		ResultSet myRs = null;
		String password = "";
		try {
			
			myConn = dataSource.getConnection();
			String sql = "select * from admin where username=?";
			mystmt = myConn.prepareStatement(sql);
			mystmt.setString(1, ad.getUsername());
			myRs = mystmt.executeQuery();
			
			if(myRs.next()) {
				password = myRs.getString("password");
				
			}else {
				
				return false;
				//throw new Exception("No User Found ");
				
			}
			
			if(ad.getPassword().equals(password)) {
				return true;
			}
			else {
				return false;
			}
			
		}finally {
			close(myConn,mystmt,myRs);
		}
		
	}
	private void close(Connection myConn, PreparedStatement mystmt, ResultSet myRs) {
		// TODO Auto-generated method stub
		try {
			if(myRs != null) {
				myRs.close();
			}
			
			if(mystmt != null) {
				mystmt.close();
			}
			if(myConn != null) {
				myConn.close();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	public void addStudent(Student student) {
		// TODO Auto-generated method stub
		Connection myConn = null;
		PreparedStatement mystmt = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "insert into student "
					+"(student_name,student_rollno,student_password, student_campus, student_degree,student_branch,student_section,student_dob,student_gender,student_email,student_mobile,student_nationality,student_mother_tongue,student_blood_group,student_joining_year,student_address,student_parentname,student_parentmobile,student_parentemail,student_hostelname,student_roomno,student_feestatus,student_advisor,student_hostel_warden) "
					+"values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			mystmt = myConn.prepareStatement(sql);
			mystmt.setString(1, student.getName());
			mystmt.setString(2, student.getRollno());
			mystmt.setString(3, student.getPassword());
			mystmt.setString(4, student.getCampus());
			mystmt.setString(5, student.getDegree());
			mystmt.setString(6, student.getBranch());
			mystmt.setString(7, student.getSection());
			mystmt.setString(8, student.getDob());
			mystmt.setString(9, student.getGender());
			mystmt.setString(10, student.getEmail());
			mystmt.setString(11, student.getMobile());
			mystmt.setString(12, student.getNationality());
			mystmt.setString(13, student.getMothertongue());
			mystmt.setString(14, student.getBlood());
			mystmt.setString(15, student.getJoining());
			mystmt.setString(16, student.getAddress());
			mystmt.setString(17, student.getPname());
			mystmt.setString(18, student.getPmobile());
			mystmt.setString(19, student.getPemail());
			mystmt.setString(20, student.getHostel());
			mystmt.setString(21, student.getRoom());
			mystmt.setString(22, student.getFees());
			mystmt.setString(23, student.getAdvisor());
			mystmt.setString(24, student.getWarden());
			System.out.println(mystmt);
			mystmt.execute();
			
			
		}catch(Exception e) {
			System.out.println(student.toString());
		}
		finally {
			close(myConn,mystmt,null);
		}
	}
	public Student search(String roll) throws Exception {
		// TODO Auto-generated method stub
		Student student = null;
		Connection myConn = null;
		PreparedStatement mystmt = null;
		ResultSet myRs = null;
		try {
			
			myConn = dataSource.getConnection();
			String sql = "select * from student where student_rollno=?";
			mystmt = myConn.prepareStatement(sql);
			mystmt.setString(1, roll);
			myRs = mystmt.executeQuery();
			if(myRs.next()) {
				String name = myRs.getString("student_name");
				String rollno = myRs.getString("student_rollno");
				String password =myRs.getString("student_password");
				String campus=myRs.getString("student_campus");
				String degree=myRs.getString("student_degree");
				String branch=myRs.getString("student_branch");
				String section=myRs.getString("student_section");
				String advisor=myRs.getString("student_advisor");
				String dob=myRs.getString("student_dob");
				String gender=myRs.getString("student_gender");
				String email=myRs.getString("student_email");
				String mobile=myRs.getString("student_mobile");
				String nationality=myRs.getString("student_nationality");
				String mothertongue=myRs.getString("student_mother_tongue");
				String blood=myRs.getString("student_blood_group");
				String joining=myRs.getString("student_joining_year");
				String address=myRs.getString("student_address");
				String pname=myRs.getString("student_parentname");
				String pemail=myRs.getString("student_parentemail");
				String pmobile=myRs.getString("student_parentmobile");
				String hostel=myRs.getString("student_hostelname");
				String room=myRs.getString("student_roomno");
				String fees=myRs.getString("student_feestatus");
				String warden=myRs.getString("student_hostel_warden");
				
				student = new Student( name,  rollno,  password,  campus,  degree,  branch,
						 section,  advisor,  dob,  gender,  email,  mobile,  nationality,
						 mothertongue,  blood,  joining,  address,  pname,  pemail,
						 pmobile,  hostel,  room,  fees,  warden);
				
			}else {
				throw new Exception("Could not find student id: "+roll);
			}
			
			return student;
		}catch(Exception e){
			return null;
		}
		
		finally {
			close(myConn,mystmt,myRs);
		}
	}
	public void updateStudent(Student student) {
		// TODO Auto-generated method stub
		Connection myConn = null;
		PreparedStatement mystmt = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "update student "
					+"set student_name=?,student_password=?, student_campus=?, student_degree=?,student_branch=?,student_section=?,student_dob=?,student_gender=?,student_email=?,student_mobile=?,student_nationality=?,student_mother_tongue=?,student_blood_group=?,student_joining_year=?,student_address=?,student_parentname=?,student_parentmobile=?,student_parentemail=?,student_hostelname=?,student_roomno=?,student_feestatus=?,student_advisor=?,student_hostel_warden=?"
					+"where student_rollno=?";
			mystmt = myConn.prepareStatement(sql);
			mystmt.setString(1, student.getName());
			mystmt.setString(2, student.getPassword());
			mystmt.setString(3, student.getCampus());
			mystmt.setString(4, student.getDegree());
			mystmt.setString(5, student.getBranch());
			mystmt.setString(6, student.getSection());
			mystmt.setString(7, student.getDob());
			mystmt.setString(8, student.getGender());
			mystmt.setString(9, student.getEmail());
			mystmt.setString(10, student.getMobile());
			mystmt.setString(11, student.getNationality());
			mystmt.setString(12, student.getMothertongue());
			mystmt.setString(13, student.getBlood());
			mystmt.setString(14, student.getJoining());
			mystmt.setString(15, student.getAddress());
			mystmt.setString(16, student.getPname());
			mystmt.setString(17, student.getPmobile());
			mystmt.setString(18, student.getPemail());
			mystmt.setString(19, student.getHostel());
			mystmt.setString(20, student.getRoom());
			mystmt.setString(21, student.getFees());
			mystmt.setString(22, student.getAdvisor());
			mystmt.setString(23, student.getWarden());
			mystmt.setString(24, student.getRollno());
			
			mystmt.execute();
			
			
		}catch(Exception e) {
			
		}
		finally {
			close(myConn,mystmt,null);
		}
		
	}
	public void addCourse(Course course) {
		// TODO Auto-generated method stub
		Connection myConn = null;
		PreparedStatement mystmt = null;
		//ResultSet myRs = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "insert into courses "
					+"(course_id,course_name,branch,degree) "
					+"values (?,?,?,?)";
			mystmt = myConn.prepareStatement(sql);
			mystmt.setString(1, course.getCode());
			mystmt.setString(2, course.getName());
			mystmt.setString(3, course.getBranch());
			mystmt.setString(4, course.getDegree());
			mystmt.execute();
			
		}catch(Exception e) {
			
		}
		finally {
			close(myConn,mystmt,null);
		}
		
	}
	public void addPlacement(JobProfile profile) {
		// TODO Auto-generated method stub
		Connection myConn = null;
		PreparedStatement mystmt = null;
		//ResultSet myRs = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "insert into jobprofile "
					+"(job_id,company_name,ctc,cgpa,link) "
					+"values (?,?,?,?,?)";
			mystmt = myConn.prepareStatement(sql);
			mystmt.setString(1, profile.getJobid());
			mystmt.setString(2, profile.getCompany());
			mystmt.setString(3, profile.getCtc());
			mystmt.setString(4, profile.getCgpa());
			mystmt.setString(5, profile.getLink());
			mystmt.execute();
			
		}catch(Exception e) {
			
		}
		finally {
			close(myConn,mystmt,null);
		}
		
	}
	public void sendUpdate(Updates update) {
		// TODO Auto-generated method stub
		Connection myConn = null;
		PreparedStatement mystmt = null;
		//ResultSet myRs = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "insert into updates "
					+"(update_type,description,link,date) "
					+"values (?,?,?,?)";
			mystmt = myConn.prepareStatement(sql);
			mystmt.setString(1, update.getType());
			mystmt.setString(2,update.getDetails());
			mystmt.setString(3, update.getLink());
			mystmt.setString(4, update.getDate());
			//System.out.println(mystmt);
			mystmt.execute();
			
		}catch(Exception e) {
			
		}
		finally {
			close(myConn,mystmt,null);
		}
		
	}
	public List<Student> getStudents() {
		// TODO Auto-generated method stub
		List<Student> students = new ArrayList<Student>();
		Connection myConn = null;
		Statement mystmt = null;
		ResultSet myRs = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "select * from student order by student_rollno";
			mystmt = myConn.createStatement();
			myRs = mystmt.executeQuery(sql);
			
			while(myRs.next()) {
				String name = myRs.getString("student_name");
				String rollno = myRs.getString("student_rollno");
				String password =myRs.getString("student_password");
				String campus=myRs.getString("student_campus");
				String degree=myRs.getString("student_degree");
				String branch=myRs.getString("student_branch");
				String section=myRs.getString("student_section");
				String advisor=myRs.getString("student_advisor");
				String dob=myRs.getString("student_dob");
				String gender=myRs.getString("student_gender");
				String email=myRs.getString("student_email");
				String mobile=myRs.getString("student_mobile");
				String nationality=myRs.getString("student_nationality");
				String mothertongue=myRs.getString("student_mother_tongue");
				String blood=myRs.getString("student_blood_group");
				String joining=myRs.getString("student_joining_year");
				String address=myRs.getString("student_address");
				String pname=myRs.getString("student_parentname");
				String pemail=myRs.getString("student_parentemail");
				String pmobile=myRs.getString("student_parentmobile");
				String hostel=myRs.getString("student_hostelname");
				String room=myRs.getString("student_roomno");
				String fees=myRs.getString("student_feestatus");
				String warden=myRs.getString("student_hostel_warden");
				
				Student temp = new Student( name,  rollno,  password,  campus,  degree,  branch,
						 section,  advisor,  dob,  gender,  email,  mobile,  nationality,
						 mothertongue,  blood,  joining,  address,  pname,  pemail,
						 pmobile,  hostel,  room,  fees,  warden);
				
				students.add(temp);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close(myConn,mystmt,myRs);
		}
		
		return students;
	}
	private void close(Connection myConn, Statement mystmt, ResultSet myRs) {
		// TODO Auto-generated method stub
		try {
			if(myRs != null) {
				myRs.close();
			}
			
			if(mystmt != null) {
				mystmt.close();
			}
			if(myConn != null) {
				myConn.close();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	

}
