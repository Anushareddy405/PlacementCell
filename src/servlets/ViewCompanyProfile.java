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
 * Servlet implementation class ViewCompanyProfile
 */
@WebServlet("/ViewCompanyProfile")
public class ViewCompanyProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ResultSet mResultSet = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewCompanyProfile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String company_name = request.getParameter("company_name");
		String getCompanyDetailsQuery = "select * from company_profile_td where company_name = '"+company_name+"';";; 

		try {
			mResultSet = (ResultSet) DatabaseConnector.getResultSet(getCompanyDetailsQuery, 1);
			if(mResultSet.next()){
				String  user_id = mResultSet.getString("user_id");
				String  employee_id = mResultSet.getString("employee_id");
				String  email_id =mResultSet.getString("email_id");
				String  website =mResultSet.getString("website");
				String  locaiton = mResultSet.getString("locaiton");
				String  about_us = mResultSet.getString("about_us");
				String company_logo = mResultSet.getString("company_logo");
				String  mobile_no = mResultSet.getString("mobile_no");


				request.setAttribute("employee_id", employee_id);
				request.setAttribute("company_name",company_name );
				request.setAttribute("email_id",email_id );
				request.setAttribute("website",website );
				request.setAttribute("locaiton",locaiton );
				request.setAttribute("about_us",about_us );
				request.setAttribute("mobile_no",mobile_no  );

				HttpSession mSession = request.getSession();

				String user_type_id = mSession.getAttribute("user_type_id").toString();

				RequestDispatcher rd  = null;
				if (user_type_id.equals("1")){
					rd = request.getRequestDispatcher("companyProfileDisplay.jsp");
					request.setAttribute("user_id", user_id);
				} else {
					rd = request.getRequestDispatcher("studentViewCompanyProfile.jsp");
					request.setAttribute("user_id", user_id);
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
