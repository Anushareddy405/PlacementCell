package servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
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
 * Servlet implementation class UploadStudentList
 */
@WebServlet("/UploadStudentList")
public class UploadStudentList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadStudentList() {
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

		String contentType = request.getContentType();
		if (contentType.contains("multipart")) {
			BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
			String data = "";
			data = reader.readLine();
			try {
				while( (data = reader.readLine()) != null) {
					if(data.startsWith("rollnumber")){
						while( (data = reader.readLine()) != null){
							if(data.startsWith("--")||data.startsWith("  ")){
								break; 
							}
							System.out.println(data);
							String[] s=data.split(",");
							String insertStudentQuery = "insert into user (username,name,user_type_id,password,is_profile_full,is_active) values ('"+s[0]+"','"+s[2]+"',2,'"+s[1]+"',0,1);";
							DatabaseConnector.getResultSet(insertStudentQuery, 0);
						}
						break;
					}
				}
				RequestDispatcher mRequestDispatcher = request.getRequestDispatcher("addStudent.jsp");
				mRequestDispatcher.forward(request, response);
				return;

			}catch (Exception e) {
				e.printStackTrace();
				HttpSession mSession = request.getSession();
				mSession.invalidate();
				response.sendRedirect("index.jsp");
			}
		}
	}
}