package com.student.profile;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;
import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class StudentControllerServlet
 */
@WebServlet("/StudentControllerServlet")
public class StudentControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	private StudentDbUtil studentDbUtil;
	@Resource(name="jdbc/student_profile")
	private DataSource dataSource;
	
	private static Student loggedUser = null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String command = request.getParameter("command");
		
		switch(command) {
		case "studentlogin":
			try {
				studentLogin(request,response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "HOME":
			studentHome(request,response);
			break;
		case "VIEW":
			viewProfile(request,response);
			break;
		case "JOB":
			jobProfiles(request,response);
			break;
		case "LOGOUT":
			logout(request,response);
			break;
		case "UPDATE":
			updatePassword(request,response);
			break;
		case "UPDATEPW":
			updatePasswordData(request,response);
			break;
		case "REGISTER":
			showCourses(request,response);
			break;
		case "REGISTERC":
			register(request,response);
			break;
			
		}
	}

	private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(loggedUser != null) {
			String courses[] = request.getParameterValues("course");
			studentDbUtil.register(loggedUser, courses);
			request.setAttribute("USER", loggedUser);
			List<Updates> updates = studentDbUtil.updates();
			request.setAttribute("UPDATES", updates);
			List<String> course = studentDbUtil.regcourses(loggedUser);
			request.setAttribute("courses", course);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/studenthome.jsp");
			dispatcher.forward(request, response);
			
		}
		else {
			alert(request,response);
		}
		
	}

	private void showCourses(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(loggedUser != null) {
			List<Course> courses = studentDbUtil.getCourses();
			request.setAttribute("COURSES", courses);
			request.setAttribute("USER", loggedUser);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/courselist.jsp");
 			dispatcher.forward(request, response);
		}else {
			alert(request,response);
		}
		
	}

	private void updatePasswordData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(loggedUser != null) {
			String p1 = request.getParameter("password");
			studentDbUtil.updatePW(p1,loggedUser.getRollno());
			request.setAttribute("USER", loggedUser);
			List<Updates> updates = studentDbUtil.updates();
			request.setAttribute("UPDATES", updates);
			List<String> courses = studentDbUtil.regcourses(loggedUser);
			request.setAttribute("courses", courses);
 			RequestDispatcher dispatcher = request.getRequestDispatcher("/studenthome.jsp");
 			dispatcher.forward(request, response);
			
		}else {
			alert(request,response);
		}
		
	}

	private void updatePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(loggedUser != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/updatePassword.jsp");
			dispatcher.forward(request, response);
		}else {
			alert(request,response);
		}
		
	}

	private void jobProfiles(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(loggedUser != null) {
			List<JobProfile> list = studentDbUtil.getJobs();
			request.setAttribute("JOBS", list);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jobprofiles.jsp");
			dispatcher.forward(request, response);
		}else {
			alert(request,response);
		}
	}

	private void viewProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(loggedUser != null) {
			request.setAttribute("USER", loggedUser);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/viewprofile.jsp");
			dispatcher.forward(request, response);
		}else {
			alert(request,response);
		}
		
	}

	private void studentHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(loggedUser != null) {
			request.setAttribute("USER", loggedUser);
			List<Updates> updates = studentDbUtil.updates();
			request.setAttribute("UPDATES", updates);
			List<String> courses = studentDbUtil.regcourses(loggedUser);
			request.setAttribute("courses", courses);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/studenthome.jsp");
			dispatcher.forward(request, response);
		}else {
			alert(request,response);
		}
		
	}

	private void alert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("error", "Please Login First");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/loginuser.jsp");
		dispatcher.forward(request, response);
		
	}
	
	private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		loggedUser= null;
		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
		
	}
	
	private void studentLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		// TODO Auto-generated method stub
		String username= request.getParameter("username");
		String password = request.getParameter("password");
		User user = new User(username,password);
		Student login = studentDbUtil.login(user);
		
		if(login != null) {
			request.setAttribute("USER", login);
			loggedUser = login;
			List<Updates> updates = studentDbUtil.updates();
			request.setAttribute("UPDATES", updates);
			List<String> courses = studentDbUtil.regcourses(loggedUser);
			request.setAttribute("courses", courses);
 			RequestDispatcher dispatcher = request.getRequestDispatcher("/studenthome.jsp");
			dispatcher.forward(request, response);
		}else {
			request.setAttribute("error", "Username or Password Mismatch");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/loginuser.jsp");
			dispatcher.forward(request, response);
		}
		
		
	}
	
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		try {
			studentDbUtil = new StudentDbUtil(dataSource);
		}catch(Exception e) {
			throw new ServletException(e);
		}
	}

}
