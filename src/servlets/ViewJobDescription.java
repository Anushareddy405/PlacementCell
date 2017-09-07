package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DatabaseConnector;

/**
 * Servlet implementation class ViewJobDescription
 */
@WebServlet("/ViewJobDescription")
public class ViewJobDescription extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ResultSet mResultSet;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewJobDescription() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String job_id = request.getParameter("job_id");
		String user_id = "",job_title = "",job_location = "",event_date = "",salary_offered = "",eligibility = "",role_description = "",any_note = "",
				skills = "",companyName = "",website = "",location = "",about_us = "",companyLogo = "";
		
		try{
			mResultSet = (ResultSet) DatabaseConnector.getResultSet("select * from post_job_td where job_id = "+job_id+";",1);
			if(mResultSet.next()){
				job_title = mResultSet.getString("job_title");
				job_location = mResultSet.getString("job_location");
				event_date = mResultSet.getString("event_date");
				salary_offered = mResultSet.getString("salary_offered");
				eligibility = mResultSet.getString("eligibility");
				role_description = mResultSet.getString("role_description");
				any_note = mResultSet.getString("any_note");
				user_id = mResultSet.getString("user_id");
				skills = mResultSet.getString("skills");
			}
			mResultSet.close();
			DatabaseConnector.closeConnection();
			if(!user_id.equals("")){
				mResultSet = (ResultSet) DatabaseConnector.getResultSet("select * from company_profile_td where user_id = "+user_id+";",1);
				if(mResultSet.next()){
					companyName = mResultSet.getString("company_name");
					website = mResultSet.getString("website");
					location = mResultSet.getString("locaiton");
					about_us = mResultSet.getString("about_us");
				}
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		request.setAttribute("job_id", job_id);
		request.setAttribute("job_title", job_title);
		request.setAttribute("job_location", job_location);
		request.setAttribute("event_date", event_date);
		request.setAttribute("salary_offered", salary_offered);
		request.setAttribute("eligibility", eligibility);
		request.setAttribute("role_description", role_description);
		request.setAttribute("any_note", any_note);
		request.setAttribute("skills", skills);
		request.setAttribute("companyName", companyName);
		request.setAttribute("website", website);
		request.setAttribute("location", location);
		request.setAttribute("about_us", about_us);
		
		RequestDispatcher RequetsDispatcherObj =request.getRequestDispatcher("postedJobDescription.jsp");
		RequetsDispatcherObj.forward(request, response);
	}
}