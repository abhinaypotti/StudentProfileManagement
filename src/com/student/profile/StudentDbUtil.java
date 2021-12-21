package com.student.profile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import javax.sql.DataSource;

public class StudentDbUtil {
	private DataSource dataSource;
	public StudentDbUtil(DataSource dataSource) {
		System.out.println(dataSource);
		this.dataSource = dataSource;
	}
	public Student login(User user) throws SQLException {
		// TODO Auto-generated method stub
		
		Connection myConn = null;
		PreparedStatement mystmt = null;
		ResultSet myRs = null;
		try {
			
			myConn = dataSource.getConnection();
			String sql = "select * from student where student_rollno=?";
			mystmt = myConn.prepareStatement(sql);
			mystmt.setString(1, user.getUsername());
			myRs = mystmt.executeQuery();
			Student student = null;
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
				
				if(user.getPassword().equals(password)) {
					return student;
				}
				else {
					return null;
				}
				
			}else {
				
				return null;
				//throw new Exception("No User Found ");
				
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
	public List<JobProfile> getJobs() {
		// TODO Auto-generated method stub
		List<JobProfile> jobs = new ArrayList<>();
		Connection myConn = null;
		Statement mystmt = null;
		ResultSet myRs = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "select * from jobprofile order by ctc desc;";
			mystmt = myConn.createStatement();
			myRs = mystmt.executeQuery(sql);
			
			while(myRs.next()) {
				String id = myRs.getString("job_id");
				String name = myRs.getString("company_name");
				String ctc = myRs.getString("ctc");
				String cgpa = myRs.getString("cgpa");
				String link = myRs.getString("link");
				JobProfile job = new JobProfile(id,name,ctc,cgpa,link);
				jobs.add(job);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close(myConn,mystmt,myRs);
		}
		
		return jobs;
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
	public List<Updates> updates() {
		// TODO Auto-generated method stub
		
		List<Updates> updates = new ArrayList<>();
		Connection myConn = null;
		Statement mystmt = null;
		ResultSet myRs = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "select * from updates";
			mystmt = myConn.createStatement();
			myRs = mystmt.executeQuery(sql);
			
			while(myRs.next()) {
				String type = myRs.getString("update_type");
				String description = myRs.getString("description");
				String link = myRs.getString("link");
				String date = myRs.getString("date");
				Updates update = new Updates(type,description,link,date);
				updates.add(update);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close(myConn,mystmt,myRs);
		}
		
		return updates;
	}
	public void updatePW(String p1, String rollno) {
		// TODO Auto-generated method stub
		Connection myConn = null;
		PreparedStatement mystmt = null;
		//ResultSet myRs = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "update student "
					+"set student_password = ?"
					+"where student_rollno=?";
			mystmt = myConn.prepareStatement(sql);
			mystmt.setString(1, p1);
			mystmt.setString(2, rollno);
			
			mystmt.execute();
			
			
		}catch(Exception e) {
			
		}
		finally {
			close(myConn,mystmt,null);
		}
		
	}
	public List<Course> getCourses() {
		// TODO Auto-generated method stub
		List<Course> courses = new ArrayList<>();
		Connection myConn = null;
		Statement mystmt = null;
		ResultSet myRs = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "select * from courses";
			mystmt = myConn.createStatement();
			myRs = mystmt.executeQuery(sql);
			
			while(myRs.next()) {
				String courseid = myRs.getString("course_id");
				String coursename = myRs.getString("course_name");
				String branch = myRs.getString("branch");
				String degree = myRs.getString("degree");
				Course course = new Course(coursename,courseid,branch,degree);
				courses.add(course);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close(myConn,mystmt,myRs);
		}
		
		return courses;
	}
	public void register(Student loggedUser, String[] courses) {
		// TODO Auto-generated method stub
		for(int i=0;i<courses.length;i++) {
		Connection myConn = null;
		PreparedStatement mystmt = null;
		//ResultSet myRs = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "insert into student_reg_courses "
					+"(rollno,course_id) "
					+"values (?,?)";
			mystmt = myConn.prepareStatement(sql);
			mystmt.setString(1,loggedUser.getRollno());
			mystmt.setString(2,courses[i]);
			mystmt.execute();
			
		}catch(Exception e) {
			
		}
		finally {
			close(myConn,mystmt,null);
		}
		}
	}
	
	public List<String> regcourses(Student loggedUser){
		List<String> courses = new ArrayList<>();
		Connection myConn = null;
		PreparedStatement mystmt = null;
		ResultSet myRs = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "select * from student_reg_courses where rollno = ?";
			mystmt = myConn.prepareStatement(sql);
			mystmt.setString(1, loggedUser.getRollno());
			myRs = mystmt.executeQuery();
			
			while(myRs.next()) {
				String courseid = myRs.getString("course_id");
				courses.add(courseid);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close(myConn,mystmt,myRs);
		}
		
		return courses;
	}
}
