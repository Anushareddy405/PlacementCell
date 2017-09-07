package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import model.DatabaseConnector;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String user_id  ="";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangePassword() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		System.out.println("Old Password doesn't match");
		HttpSession mSession = request.getSession();
		user_id = mSession.getAttribute("user_id").toString();
		String password = request.getParameter("password");
		String method = request.getParameter("method");


		if (method.equals("2")){
			String oldPassordMatch = isOldPasswordMatcher(password);
			if (oldPassordMatch.equals("1")){
				out.println("Old Password Matched");
			}else {
				out.println("Old Password MisMatched");
			}
		} else if (method.equals("1")){
			int result = (int) DatabaseConnector.getResultSet("update user set password='"+ password +"'WHERE user_id="+user_id+";", 0);
			System.out.println("jgkvj,hv"+result);
			if (result > 0){
				out.println("Password Changed Successfully");
			}else {
				out.println("Password Changed UnSuccessfully");
			}
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	private String isOldPasswordMatcher(String OldPassword){
		String password="";
		ResultSet mResult = (ResultSet) DatabaseConnector.getResultSet("select password from user where user_id='"+user_id+"';",1);
		try {
			if (mResult.next()) { 
				password = mResult.getString("password");
			}
			if (password.equals(OldPassword)){
				return "1";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return "0";
	}
}
