package pojo;

public class JobPostedByCompanyPojo {

	String job_id ="";
	String job_title ="";
	/**
	 * @param job_id
	 * @param job_title
	 */
	public JobPostedByCompanyPojo(String job_id, String job_title) {
		super();
		this.job_id = job_id;
		this.job_title = job_title;
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
}