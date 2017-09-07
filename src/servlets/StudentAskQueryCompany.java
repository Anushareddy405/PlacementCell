package servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DatabaseConnector;

/**
 * Servlet implementation class SrudentAskQueriesCompany
 */
@WebServlet("/StudentAskQueryCompany")
public class StudentAskQueryCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StudentAskQueryCompany() {
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
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("text/html");
		HttpSession mSession = request.getSession();
		String user_id = mSession.getAttribute("user_id").toString();
		String job_id = mSession.getAttribute("last_job_id").toString();
		System.out.println("lahdglajkjklfas"+job_id);

		String getCompanyUserIdQuery = "select user_id from post_job_td where job_id= "+job_id+";";

		ResultSet mResultSet = (ResultSet) DatabaseConnector.getResultSet(getCompanyUserIdQuery, 1);
		String companyUserid = "";
		try {
			if(mResultSet.next()){
				companyUserid = mResultSet.getString("user_id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		//student Quieries
		String studenQuerySubject = request.getParameter("studentQuery_subject");
		String studentQueryDescription = request.getParameter("studentQuery_description");

		String insertStudentQuery = "INSERT INTO queries ("
				+ "query_subject,query_desc,query_to,user_id,user_type_id) values "
				+ "('"+studenQuerySubject+"', '"+studentQueryDescription+"',"+companyUserid+","+user_id+",3);";

		int studentQuery = (int)DatabaseConnector.getResultSet(insertStudentQuery, 0);

		System.out.println("insertion result student query "+studentQuery);

		RequestDispatcher rd = request.getRequestDispatcher("studentDashboard.jsp");
		rd.forward(request, response);
		return;
	}

}
