package servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class AddSkills
 */
@WebServlet("/Skills")
public class Skills extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int mResult;
	private int dataEntered = 1;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Skills() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String skills = request.getParameter("skills");
		if (skills.equals("")){
			out.println("Email is empty");
			return;
		}
		String[] skill = skills.split(",");
		for (String skill_name : skill){
			try {
				mResult = (int) DatabaseConnector.getResultSet("insert into skills_master (skill_desc) value ('"+skill_name+"');",0);
				if(mResult == 0){
					dataEntered = 0;
				}
			}catch (Exception e) {
				out.print("4");
				e.printStackTrace();
			}
		}
		try {
			DatabaseConnector.closeConnection();
			if (dataEntered == 1){
				out.println("1");
			} else {
				out.println("0");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String skills = request.getParameter("skill_id");
		mResult = (int) DatabaseConnector.getResultSet("delete from skills_master where skill_desc = '"+skills+"';",0);

		RequestDispatcher RequetsDispatcherObj =request.getRequestDispatcher("skillsList.jsp");
		RequetsDispatcherObj.forward(request, response);

	}

}
