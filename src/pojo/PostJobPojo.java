package pojo;

public class PostJobPojo {

	private String job_id;
	private String job_title;
	private String job_location;
	private String event_date;
	private String salary_offered;
	private String eligibility;
	private String role_description;
	private String any_note;
	private String user_id;
	private String isActive;
	private String skills;
	private String company_name;
	private String company_logo;
	
	public PostJobPojo(){}


	public PostJobPojo(String job_id, String job_title, String job_location, String event_date, String salary_offered,
			String eligibility, String role_description, String any_note, String user_id, String isActive,
			String skills, String company_name, String company_logo) {
		this.job_id = job_id;
		this.job_title = job_title;
		this.job_location = job_location;
		this.event_date = event_date;
		this.salary_offered = salary_offered;
		this.eligibility = eligibility;
		this.role_description = role_description;
		this.any_note = any_note;
		this.user_id = user_id;
		this.isActive = isActive;
		this.skills = skills;
		this.company_name = company_name;
		this.company_logo = company_logo;
	}

	/**
	 * @return the company_logo
	 */
	public String getCompany_logo() {
		return company_logo;
	}

	/**
	 * @param company_logo the company_logo to set
	 */
	public void setCompany_logo(String company_logo) {
		this.company_logo = company_logo;
	}

	/**
	 * @return the company_name
	 */
	public String getCompany_name() {
		return company_name;
	}

	/**
	 * @param company_name the company_name to set
	 */
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	/**
	 * @return the Any_note
	 */
	public String getAny_note() {
		return any_note;
	}

	/**
	 * @param Any_note the Any_note to set
	 */
	public void setAny_note(String any_note) {
		this.any_note = any_note;
	}


	/**
	 * @return the job_id
	 */
	public String getJob_id() {
		return job_id;
	}


	/**
	 * @param job_id the job_id to set
	 */
	public void setJob_id(String job_id) {
		this.job_id = job_id;
	}


	/**
	 * @return the job_title
	 */
	public String getJob_title() {
		return job_title;
	}


	/**
	 * @param job_title the job_title to set
	 */
	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}


	/**
	 * @return the job_location
	 */
	public String getJob_location() {
		return job_location;
	}


	/**
	 * @param job_location the job_location to set
	 */
	public void setJob_location(String job_location) {
		this.job_location = job_location;
	}


	/**
	 * @return the event_date
	 */
	public String getEvent_date() {
		return event_date;
	}


	/**
	 * @param event_date the event_date to set
	 */
	public void setEvent_date(String event_date) {
		this.event_date = event_date;
	}


	/**
	 * @return the salary_offered
	 */
	public String getSalary_offered() {
		return salary_offered;
	}


	/**
	 * @param salary_offered the salary_offered to set
	 */
	public void setSalary_offered(String salary_offered) {
		this.salary_offered = salary_offered;
	}


	/**
	 * @return the eligibility
	 */
	public String getEligibility() {
		return eligibility;
	}


	/**
	 * @param eligibility the eligibility to set
	 */
	public void setEligibility(String eligibility) {
		this.eligibility = eligibility;
	}


	/**
	 * @return the role_description
	 */
	public String getRole_description() {
		return role_description;
	}


	/**
	 * @param role_description the role_description to set
	 */
	public void setRole_description(String role_description) {
		this.role_description = role_description;
	}


	/**
	 * @return the user_id
	 */
	public String getUser_id() {
		return user_id;
	}


	/**
	 * @param user_id the user_id to set
	 */
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	/**
	 * @return the skills
	 */
	public String getSkills() {
		return skills;
	}


	/**
	 * @param skills the skills to set
	 */
	public void setSkills(String skills) {
		this.skills = skills;
	}


	/**
	 * @return the isActive
	 */
	public String getIsActive() {
		return isActive;
	}


	/**
	 * @param isActive the isActive to set
	 */
	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}
}