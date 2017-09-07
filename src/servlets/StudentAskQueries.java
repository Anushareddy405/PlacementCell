package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DatabaseConnector;

/**
 * Servlet implementation class StudentAskQueries
 */
@WebServlet("/StudentAskQueries")
public class StudentAskQueries extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentAskQueries() {
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
		//student Quieries
		String studenQuerySubject = request.getParameter("studentQuery_subject");
		String studentQueryDescription = request.getParameter("studentQuery_description");
		String studentQueryTo = request.getParameter("studentQuery_to");
		
		String insertStudentQuery = "INSERT INTO queries ("
				+ "query_subject,query_desc,query_to,user_id,user_type_id) values "
				+ "('"+studenQuerySubject+"', '"+studentQueryDescription+"', 1,"+user_id+",1);";

		int studentQuery = (int)DatabaseConnector.getResultSet(insertStudentQuery, 0);
		
		System.out.println("insertion result student query "+studentQuery);
		
		RequestDispatcher rd = request.getRequestDispatcher("studentDashboard.jsp");
		rd.forward(request, response);
		return;
		
	}

}
