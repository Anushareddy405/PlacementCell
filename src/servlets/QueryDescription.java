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
 * Servlet implementation class QueryDescription
 */
@WebServlet("/QueryDescription")
public class QueryDescription extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QueryDescription() {
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
		RequestDispatcher rd = null;
		String query_sub = request.getParameter("query_sub");
		String queryDisplayQuery = "select * from queries where query_subject = '"+query_sub+"';";

		HttpSession mSession = request.getSession();
		try {
			ResultSet mResultSet = (ResultSet) DatabaseConnector.getResultSet(queryDisplayQuery, 1);
			if(mResultSet.next()){
				String query_desc = mResultSet.getString("query_desc");
				String query_subject = mResultSet.getString("query_subject");
				String  user_id = mResultSet.getString("user_id");
				String user_type_id = mSession.getAttribute("user_type_id").toString();


				request.setAttribute("query_desc", query_desc);
				request.setAttribute("query_subject", query_subject);
				request.setAttribute("user_id", user_id);
				
				if(user_type_id.equals("1")){
					rd = request.getRequestDispatcher("queryDescription.jsp");
				} else {
					rd = request.getRequestDispatcher("companyQueryDescription.jsp");
				}
				rd.forward(request, response);
				return;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
