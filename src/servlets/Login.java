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
import javax.servlet.http.HttpSession;

import model.DatabaseConnector;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ResultSet mResult = null;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		if (username.equals("")){
			out.println("Email is empty");
			return;
		}else if (password.equals("")){
			out.println("Password is empty");
			return;
		}
		try {
			mResult = (ResultSet) DatabaseConnector.getResultSet("select * from user where username='"+username+"' and password = '"+password+"';",1);
			if (mResult != null){
				while (mResult.next()){
					HttpSession session = request.getSession();
					session.setAttribute("user_type_id",mResult.getString("user_type_id").toString());
					session.setAttribute("full_name",mResult.getString("name").toString());
					session.setAttribute("isProfileFilled", mResult.getString("is_profile_full").toString());
					session.setAttribute("user_id", mResult.getString("user_id").toString());
					String user_type_id = mResult.getString("user_type_id");
					
					//	System.out.println(user_type_id);
					out.print(user_type_id);
				}
				DatabaseConnector.closeConnection();
			}
		}catch (Exception e) {
			out.print("4");
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		if (email.equals("")){
			out.println("Email is empty");
			return;
		}
		if (password.equals("")){
			out.println("Password is empty");
			return;
		}

		try {
			mResult = (ResultSet)DatabaseConnector.getResultSet("select * from user where email='"+email+"' and password = '"+password+"';",1);
			if (mResult.next()){
				while( mResult.next()){
					out.print(mResult.getString("full_name"));
					return;
				}
			}else{
				out.print("<H1>No user With that Email id</H1>");
				return;
			}
			DatabaseConnector.closeConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}