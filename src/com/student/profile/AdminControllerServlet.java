package com.student.profile;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.util.*;

/**
 * Servlet implementation class AdminControllerServlet
 */
@WebServlet("/AdminControllerServlet")
public class AdminControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	private AdminDbUtil adminDbUtil;
	@Resource(name="jdbc/student_profile")
	private DataSource dataSource;
	
	private static Admin loggedAdmin = null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String command = request.getParameter("command");
		
		switch(command) {
		case "adminlogin":
			try {
				loginAdmin(request,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "ADD":
			addStudent(request,response);
			break;
		case "ADDSTUDENT":
			addStudentData(request,response);
			break;
		case "HOME":
			adminHome(request,response);
			break;
		case "EDIT":
			editStudent(request,response);
			break;
		case "SEARCH":
			try {
				searchStudent(request,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				break;
		case "UPDATE":
			updateStudent(request,response);
			break;
		case "ADDCOURSE":
			addCourse(request,response);
			break;
		case "ADDCOURSEDATA":
			addCourseData(request,response);
			break;
		case "PLACEMENT":
			placement(request,response);
			break;
		case "ADDPLACEMENT":
			addPlacement(request,response);
			break;
		case "SENDUPDATES":
			sendUpdates(request,response);
			break;
		case "ADDUPDATES":
			addUpdates(request,response);
			break;
		case "LOGOUT":
			logout(request,response);
			break;
		case "FEE":
			feeDetails(request,response);
			break;
		
		}
	}

	private void feeDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(loggedAdmin != null) {
			List<Student> list = adminDbUtil.getStudents();
			request.setAttribute("students", list);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/feedetails.jsp");
			dispatcher.forward(request, response);
		}else {
			alert(request,response);
		}
		
	}

	private void alert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("error", "Please Login First");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/loginadmin.jsp");
		dispatcher.forward(request, response);
		
	}

	private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		loggedAdmin= null;
		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
		
	}

	private void addUpdates(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(loggedAdmin != null) {
			String type = request.getParameter("branch");
			String details = request.getParameter("details");
			String link = request.getParameter("link");
			String date = request.getParameter("date");
			Updates update = new Updates(type,details,link,date);
			adminDbUtil.sendUpdate(update);
			request.setAttribute("ADMIN", loggedAdmin);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/adminhome.jsp");
			dispatcher.forward(request, response);
			
		}else {
			alert(request,response);
		}
		
	}

	private void sendUpdates(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(loggedAdmin != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/sendupdates.jsp");
			dispatcher.forward(request, response);
		}
		else {
			alert(request,response);
		}
	}

	private void addPlacement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(loggedAdmin != null) {
			String jobid = request.getParameter("job_id");
			String company = request.getParameter("company");
			String ctc = request.getParameter("ctc");
			String cgpa = request.getParameter("cgpa");
			String link = request.getParameter("link");
			JobProfile profile = new JobProfile(jobid,company,ctc,cgpa,link);
			adminDbUtil.addPlacement(profile);
			request.setAttribute("ADMIN", loggedAdmin);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/adminhome.jsp");
			dispatcher.forward(request, response);
		}else {
			alert(request,response);
		}
		
	}

	private void placement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(loggedAdmin != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/addplacement.jsp");
			dispatcher.forward(request, response);
		}else {
			alert(request,response);
		}
		
	}

	private void addCourseData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(loggedAdmin != null) {
			String name= request.getParameter("coursename");
			String code = request.getParameter("code");
			String degree = request.getParameter("degree");
			String branch = request.getParameter("branch");
			Course course = new Course(name,code,branch,degree);
			adminDbUtil.addCourse(course);
			request.setAttribute("ADMIN", loggedAdmin);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/adminhome.jsp");
			dispatcher.forward(request, response);
		}else {
			alert(request,response);
		}
		
	}

	private void addCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(loggedAdmin != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/addcourse.jsp");
			dispatcher.forward(request, response);
		}else {
			alert(request,response);
		}
		
	}

	private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(loggedAdmin != null) {
			String name = request.getParameter("fullname");
			String rollno = request.getParameter("rollno");
			String password =request.getParameter("passOne");
			String campus=request.getParameter("campus");
			String degree=request.getParameter("degree");
			String branch=request.getParameter("branch");
			String section=request.getParameter("section");
			String advisor=request.getParameter("advisor");
			String dob=request.getParameter("dob");
			String gender=request.getParameter("gender");
			String email=request.getParameter("email");
			String mobile=request.getParameter("mobile");
			String nationality=request.getParameter("nationality");
			String mothertongue=request.getParameter("mothertongue");
			String blood=request.getParameter("blood");
			String joining=request.getParameter("year");
			String address=request.getParameter("address");
			String pname=request.getParameter("pname");
			String pemail=request.getParameter("pemail");
			String pmobile=request.getParameter("pmobile");
			String hostel=request.getParameter("hname");
			String room=request.getParameter("room");
			String fees="PAID";
			String warden=request.getParameter("warden");
			Student student = new Student( name,  rollno,  password,  campus,  degree,  branch,
					 section,  advisor,  dob,  gender,  email,  mobile,  nationality,
					 mothertongue,  blood,  joining,  address,  pname,  pemail,
					 pmobile,  hostel,  room,  fees,  warden);
			adminDbUtil.updateStudent(student);
			request.setAttribute("ADMIN", loggedAdmin);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/adminhome.jsp");
			dispatcher.forward(request, response);
			
		}else {
			alert(request,response);
		}
	}

	private void searchStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		if(loggedAdmin != null) {
			String roll = request.getParameter("rollno");
			Student student = adminDbUtil.search(roll);
			if(student != null) {
			request.setAttribute("student", student);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/editstudent.jsp");
			dispatcher.forward(request, response);
			}
			else {
				request.setAttribute("error", "No Student Found");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/editstudent.jsp");
				dispatcher.forward(request, response);
			}
		}else {
			alert(request,response);
		}
		
	}

	private void editStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(loggedAdmin != null) {
			request.setAttribute("ADMIN", loggedAdmin);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/editstudent.jsp");
			dispatcher.forward(request, response);
		}
		
	}

	private void adminHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(loggedAdmin != null) {
			request.setAttribute("ADMIN", loggedAdmin);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/adminhome.jsp");
			dispatcher.forward(request, response);
		}
	}

	private void addStudentData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("fullname");
		String rollno = request.getParameter("rollno");
		String password =request.getParameter("passOne");
		String campus=request.getParameter("campus");
		String degree=request.getParameter("degree");
		String branch=request.getParameter("branch");
		String section=request.getParameter("section");
		String advisor=request.getParameter("advisor");
		String dob=request.getParameter("dob");
		String gender=request.getParameter("gender");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String nationality=request.getParameter("nationality");
		String mothertongue=request.getParameter("mothertongue");
		String blood=request.getParameter("blood");
		String joining=request.getParameter("year");
		String address=request.getParameter("address");
		String pname=request.getParameter("pname");
		String pemail=request.getParameter("pemail");
		String pmobile=request.getParameter("pmobile");
		String hostel=request.getParameter("hname");
		String room=request.getParameter("room");
		String fees="PAID";
		String warden=request.getParameter("warden");
		//System.out.println(request.getParameter("finput"));
		Student student = new Student( name,  rollno,  password,  campus,  degree,  branch,
				 section,  advisor,  dob,  gender,  email,  mobile,  nationality,
				 mothertongue,  blood,  joining,  address,  pname,  pemail,
				 pmobile,  hostel,  room,  fees,  warden);
		
		adminDbUtil.addStudent(student);
		request.setAttribute("ADMIN", loggedAdmin);
		//System.out.println(loggedAdmin.getUsername());
		//request.setAttribute("success", 1);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/adminhome.jsp");
		dispatcher.forward(request, response);
		
	}

	private void addStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//String user = request.getParameter("admin");
		if(loggedAdmin == null) {
			request.setAttribute("error", "Please Login First");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/loginadmin.jsp");
			dispatcher.forward(request, response);
		}else {
			//request.setAttribute("adminId", user);
			System.out.println(loggedAdmin.getUsername());
			RequestDispatcher dispatcher = request.getRequestDispatcher("/addstudent.jsp");
			dispatcher.forward(request, response);
		}
		
		
	}

	private void loginAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Admin ad = new Admin(username,password);
		boolean login = adminDbUtil.login(ad);
		if(login == true) {
			request.setAttribute("ADMIN", ad);
			
			loggedAdmin = ad;
			RequestDispatcher dispatcher = request.getRequestDispatcher("/adminhome.jsp");
			dispatcher.forward(request, response);
		}else {
			request.setAttribute("error", "Username or Password Mismatch");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/loginadmin.jsp");
			dispatcher.forward(request, response);
		}
		
	}
	
	
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		try {
			adminDbUtil = new AdminDbUtil(dataSource);
		}catch(Exception e) {
			throw new ServletException(e);
		}
	}

}
