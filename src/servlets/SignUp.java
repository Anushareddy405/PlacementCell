package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.java.swing.plaf.windows.resources.windows;

import model.DatabaseConnector;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ResultSet mResult = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignUp() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String name = request.getParameter("company_name");
		String username = request.getParameter("emp_id");
		String password = request.getParameter("password_signup");

		String query = "insert into user (name,username,password,user_type_id,is_profile_full,is_active)  values ('"+name+"','"+username+"','"+ password +"',3,0,1);";

		try {
			int result =(int)DatabaseConnector.getResultSet(query,0);
			if (result == 1){
				out.println("1");
			} else {
				out.println("Registration Failed Try Again");
			}
			DatabaseConnector.closeConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String name = request.getParameter("company_name");
		String username = request.getParameter("emp_id");
		String password = request.getParameter("password_signup");

		String query = "insert into user (full_name,username,password,is_profile_full,is_active)  values ('"+name+"','"+username+"','"+ password +"',0,1);";

		try {
			int result =(int)DatabaseConnector.getResultSet(query,0);
			System.out.println(mResult);
			if (result == 1){
				out.println("1");
			} else {
				out.println("Registration Failed Try Again");
			}
			DatabaseConnector.closeConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
