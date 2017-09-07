package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DatabaseConnector;

/**
 * Servlet implementation class CompanyProfile
 */
@WebServlet("/CompanyProfile")
public class CompanyProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CompanyProfile() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		HttpSession mSession = request.getSession();
		String user_id=mSession.getAttribute("user_id").toString();
		//company basic details
		String company_name = request.getParameter("company_name");
		String employee_id = request.getParameter("employee_id");
		String email_id = request.getParameter("email_id");
		String website = request.getParameter("website");
		String location = request.getParameter("location");
		String about_us= request.getParameter("about_us");
		String company_logo = request.getParameter("company_logo");
		String mobile_no= request.getParameter("mobile_no");
		out.println("servlet page");
		String companyProfileQuery= "INSERT INTO company_profile_td("
				+ "user_id,company_name,employee_id,email_id,website,locaiton,about_us,company_logo,mobile_no) values "
				+ "("+user_id+",'"+company_name+"', '"+employee_id+"', '"+email_id+"','"+website+"','"+location+"','"+about_us+"', '"+company_logo+"',"+mobile_no+");";
		
		try {
			DatabaseConnector.getResultSet(companyProfileQuery,0);
			String updateUserTableQuery = "UPDATE user SET is_profile_full='1',mobile_no='"+mobile_no+"',website='"+website+"', email ='"+email_id+"',location='"+location+"',about_us='"+about_us+"' WHERE user_id="+user_id+";";
			DatabaseConnector.getResultSet(updateUserTableQuery,0);
			RequestDispatcher rd = request.getRequestDispatcher("companyDashboard.jsp");
			rd.forward(request, response);
			return;
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}