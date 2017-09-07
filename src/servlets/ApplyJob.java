package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DatabaseConnector;

/**
 * Servlet implementation class ApplyJob
 */
@WebServlet("/ApplyJob")
public class ApplyJob extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ApplyJob() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String job_id = request.getParameter("job_id").toString();
		System.out.println("job_id"+job_id);
		HttpSession mSession = request.getSession();
		String user_id = mSession.getAttribute("user_id").toString();

		String alreadyApplied = "select * from applied_job where job_id="+job_id+" and user_id = "+user_id+";";
		ResultSet mSet = (ResultSet) DatabaseConnector.getResultSet(alreadyApplied, 1);

		try {
			if (!mSet.next()){
				String insertAppliedJo = "insert into applied_job values ("+job_id+","+user_id+");";
				int mResultSet = (int) DatabaseConnector.getResultSet(insertAppliedJo, 0);
				System.out.println("applied job"+mResultSet);
				if (mResultSet == 1){
					out.println("1");//added successfully
				} else {
					out.println("0");//not added
				}
			} else {
				out.println("3");//3 for already applied
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
