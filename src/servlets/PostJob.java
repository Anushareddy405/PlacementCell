package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DatabaseConnector;
import sun.java2d.pipe.RenderQueue;

/**
 * Servlet implementation class PostJob
 */
@WebServlet("/PostJob")
public class PostJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DateFormat df = new SimpleDateFormat("yyyy/MM/dd");

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostJob() {
		super();
	}


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession mSession = request.getSession();
		String job_title = request.getParameter("job_title");
		String job_location = request.getParameter("job_location");
		String job_evenet_date = request.getParameter("job_evenet_date");
		String job_sal_offered = request.getParameter("job_sal_offered");
		String eligibility = request.getParameter("eligibility");
		String role_desc = request.getParameter("role_desc");
		String skills = request.getParameter("skills");
		String any_note = request.getParameter("any_note");
		String user_id = mSession.getAttribute("user_id").toString();


		Date today;
		try {
			today = df.parse(job_evenet_date);
			job_evenet_date = df.format(today);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String insertJobQuery = "INSERT INTO post_job_td ("
				+ "job_title,job_location,event_date,salary_offered, eligibility, role_description, any_note,user_id,isActive,skills) values "
				+ "('"+job_title+"', '"+job_location+"', '"+job_evenet_date+"',"
				+ " '"+job_sal_offered+"', '"+eligibility+"', '"+role_desc+"', '"+any_note+"',"+user_id+","+0+",'"+skills+"');";
		int job_id = (int) DatabaseConnector.getResultSet(insertJobQuery, 0);
		try {
			DatabaseConnector.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (job_id > 0){
			RequestDispatcher RequetsDispatcherObj =request.getRequestDispatcher("companyDashboard.jsp");
			RequetsDispatcherObj.forward(request, response);
			return;
		}
	}
}

