package servlets;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import model.DatabaseConnector;


/**
 * Servlet implementation class StudentProfile
 */
@WebServlet("/StudentProfile")
public class StudentProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StudentProfile() {
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
		response.setContentType("text/html");
		HttpSession mSession = request.getSession();
		String user_id = mSession.getAttribute("user_id").toString();
		//student basic details
		String studentName = request.getParameter("student_name");
		String studentDob = request.getParameter("student_dob");
		String studentFatherName = request.getParameter("student_father_name");
		String studentMotherName = request.getParameter("student_mother_name");
		String male = request.getParameter("male");
		String female = request.getParameter("female");
		String alternateMailId = request.getParameter("alternate_mail_id");
		String gender = "";
		if(male == null){
			gender = "Female";
		}else{
			gender = "Male";
		}

		String insertPersonalInformationQuiery = "INSERT INTO student_personal_information_td ("
				+ "name,dob,father_name,mother_name, gender,alternate_email,user_id) values "
				+ "('"+studentName+"', '"+studentDob+"', '"+studentFatherName+"',"
				+ " '"+studentMotherName+"', '"+gender+"', '"+alternateMailId+"', "+user_id+");";

		System.out.println(insertPersonalInformationQuiery);

		int result = (int)DatabaseConnector.getResultSet(insertPersonalInformationQuiery, 0);

		System.out.println("insertion result personalinfromation "+result);

		//contact details
		String studentMobileNo = request.getParameter("student_mobile_no");
		String studentLandlineNo = request.getParameter("student_landline_no");
		String studentAddress = request.getParameter("student_address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String pincode = request.getParameter("pincode");

		if(studentLandlineNo.equals("")){
			studentLandlineNo = "0";
		}

		String insertStudentContactDetailsQuiery = "INSERT INTO student_contact_details_td ("
				+ "mobile_no,landline_no,address,city,state,pincode,user_id) values "
				+ "("+studentMobileNo+", "+studentLandlineNo+", '"+studentAddress+"',"
				+ " '"+city+"', '"+state+"', "+pincode+","+user_id+");";

		System.out.println(insertStudentContactDetailsQuiery);

		int contactResult=(int)DatabaseConnector.getResultSet(insertStudentContactDetailsQuiery, 0);

		System.out.println("insertion result contactDetails "+contactResult);

		//10th details 
		String SchoolName = request.getParameter("student_10th_shcool_name");
		String student10thCompletedYear = request.getParameter("student_10th_completed_year");
		String student10thBoard = request.getParameter("student_10th_board");
		String student10thAggregate = request.getParameter("student_10th_aggregate");

		String insertStudent10thDetailsQuiery = "INSERT INTO student_education_tenth_td ("
				+ "ssc_schoolname,year_completed,board,aggregate,user_id) values "
				+ "('"+SchoolName+"', "+student10thCompletedYear+", '"+student10thBoard +"', "+student10thAggregate+", "+user_id+");";

		System.out.println(insertStudent10thDetailsQuiery);

		int studenttenthDetails=(int)DatabaseConnector.getResultSet(insertStudent10thDetailsQuiery, 0);
		System.out.println("insertion result tenthDetails "+studenttenthDetails);

		//intermediate details
		String student12thCollageName = request.getParameter("student_11th_collage_name");
		String student12thCompletedYear = request.getParameter("student_11th_completed_year");
		String student12thBoard = request.getParameter("student_11th_board");
		String student12thAggregate = request.getParameter("student_11th_aggregate");

		String inserStudent12thdetailsQuiery = "INSERT INTO student_education_twelfth_td ("
				+ "college_name,year_completed,board,aggregate,user_id) values "
				+ "('"+student12thCollageName+"', "+student12thCompletedYear+", '"+student12thBoard +"',"+student12thAggregate+", "+user_id+");";

		System.out.println(inserStudent12thdetailsQuiery);

		int studenttwelthDetails=(int)DatabaseConnector.getResultSet(inserStudent12thdetailsQuiery, 0);
		System.out.println("insertion result 12thDetails "+studenttwelthDetails);

		//graduation details
		String studentGraduationDegree = request.getParameter("student_graduation_degree");
		String studentGraduationUniversity = request.getParameter("student_graduation_university");
		String studentGraduationCollegeName = request.getParameter("student_graduation_university");
		String studentGraduationSpecialization = request.getParameter("student_graduation_specialization");
		String studentGraduationStartYear = request.getParameter("student_graduation_started_year");
		String studentGraduationCompletedYear = request.getParameter("student_graduation_completed_year");
		String studentGraduationPrefinal_Aggregate = request.getParameter("student_graduation_prefinal_aggregate");
		String studentGraduationfinal_Aggregate = request.getParameter("student_graduation_final_aggregate");

		if(studentGraduationPrefinal_Aggregate.equals("")){
			studentGraduationPrefinal_Aggregate = "0";
		} else if(studentGraduationfinal_Aggregate.equals("")){
			studentGraduationfinal_Aggregate = "0";
		}

		String insertStudentGraduationQuiery = "INSERT INTO student_education_graduation_td ("
				+ "degree,university,college_name,specializations,started_year,completed_year,pre_final_aggregate,final_aggregate,user_id) values "
				+ "('"+studentGraduationDegree+"', '"+studentGraduationUniversity+"', '"+studentGraduationCollegeName+"','"+studentGraduationSpecialization+"',"+studentGraduationStartYear+","+studentGraduationCompletedYear+", "+studentGraduationPrefinal_Aggregate+","+studentGraduationfinal_Aggregate+", "+user_id+");";

		System.out.println(insertStudentGraduationQuiery);

		int studentGraduationDetails=(int)DatabaseConnector.getResultSet(insertStudentGraduationQuiery, 0);
		System.out.println("insertion result graduationDetails "+studentGraduationDetails);

		//Post Graduation details
		String studentPostGraduationDegree = request.getParameter("student_post_graduation_degree");
		String studentPostGraduationUniversity = request.getParameter("student_post_graduation_university");
		String studentPostGraduationSpecialization = request.getParameter("student_post_graduation_specialization");
		String studentPostGraduationStartYear = request.getParameter("student_post_graduation_started_year");
		String studentPostGraduationCompletedYear = request.getParameter("student_post_graduation_completed_year");
		String studentPostGraduationPrefinal_Aggregate = request.getParameter("student_post_graduation_prefinal_aggregate");
		String studentPostGraduationfinal_Aggregate = request.getParameter("student_post_graduation_final_aggregate");

		if(studentPostGraduationPrefinal_Aggregate.equals("")){
			studentPostGraduationPrefinal_Aggregate = "0";
		} else if(studentPostGraduationfinal_Aggregate.equals("")){
			studentPostGraduationfinal_Aggregate = "0";
		}

		String insertStudentPostGraduationQuiery = "INSERT INTO student_education_postgraduation_td ("
				+ "degree,university,specializations,started_year,completed_year,pre_final_aggregate,final_aggregate,user_id) values "
				+ "('"+studentPostGraduationDegree+"', '"+studentPostGraduationUniversity+"','"+studentPostGraduationSpecialization+"', "+studentPostGraduationStartYear+","+studentPostGraduationCompletedYear+", "+studentPostGraduationPrefinal_Aggregate+","+studentPostGraduationfinal_Aggregate+", "+user_id+");";

		System.out.println(insertStudentPostGraduationQuiery); 

		int studentPostGraduationDetails=(int)DatabaseConnector.getResultSet(insertStudentPostGraduationQuiery, 0);
		System.out.println("insertion result PostGraduationDetails "+studentPostGraduationDetails);

		//student skills and certifications
		String studentSkills = request.getParameter("student_skills");
		String studentCertification = request.getParameter("student_certification");

		String insertStudentSkillsCertificationQuiery = "INSERT INTO student_skills_certification_td ("
				+ "user_id,skills,certification) values "
				+ "("+user_id+", '"+studentSkills+"', '"+studentCertification+"');";

		System.out.println(insertStudentSkillsCertificationQuiery); 

		int studentSkillsCertifications=(int)DatabaseConnector.getResultSet(insertStudentSkillsCertificationQuiery, 0);
		System.out.println("insertion result studentSkillsCertifications "+studentSkillsCertifications);

		String contentType = request.getContentType();
		if (contentType.contains("multipart")) {
			boolean isMultipart = ServletFileUpload.isMultipartContent(request); 

			if (isMultipart) { 
				// Create a factory for disk-based file items 
				FileItemFactory factory = new DiskFileItemFactory(); 

				// Create a new file upload handler 
				ServletFileUpload upload = new ServletFileUpload(factory); 

				try { 
					// Parse the request 
					List /* FileItem */ items = upload.parseRequest((RequestContext) request); 
					Iterator iterator = items.iterator(); 
					while (iterator.hasNext()) { 
						FileItem item = (FileItem) iterator.next(); 
						if (!item.isFormField()) { 
							String fileName = item.getName();	
							String root = getServletContext().getRealPath("/"); 
							File path = new File(root + "/uploads"); 
							if (!path.exists()) { 
								boolean status = path.mkdirs(); 
							} 

							File uploadedFile = new File(path + "/" + fileName); 
							System.out.println(uploadedFile.getAbsolutePath()); 
							item.write(uploadedFile); 
						} 
					} 
				} catch (FileUploadException e) { 
					e.printStackTrace(); 
				} catch (Exception e) { 
					e.printStackTrace(); 
				} 
			} 
		}


		if(studentSkillsCertifications == 1 && studentPostGraduationDetails == 1 && studentGraduationDetails == 1 && studenttenthDetails == 1 && 
				studenttwelthDetails == 1 && contactResult == 1 && result == 1){
			String updateUserTableQuery = "UPDATE user SET is_profile_full='1' WHERE user_id="+user_id+";";
			System.out.println(updateUserTableQuery);
			int userTableUpdated = (int)DatabaseConnector.getResultSet(updateUserTableQuery, 0);

			if (userTableUpdated == 1){
				RequestDispatcher RequetsDispatcherObj =request.getRequestDispatcher("studentDashboard.jsp");
				RequetsDispatcherObj.forward(request, response);
				return;
			}
		}

	}
}