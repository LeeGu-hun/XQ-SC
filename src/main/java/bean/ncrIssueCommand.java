package bean;

import org.springframework.web.multipart.MultipartFile;

public class ncrIssueCommand {
	private String audit_id,ncr_title,ncr_description,ncr_grade_id;
	private MultipartFile ncr_file;
	public String getAudit_id() {
		return audit_id;
	}
	public void setAudit_id(String audit_id) {
		this.audit_id = audit_id;
	}
	public String getNcr_title() {
		return ncr_title;
	}
	public void setNcr_title(String ncr_title) {
		this.ncr_title = ncr_title;
	}
	public String getNcr_description() {
		return ncr_description;
	}
	public void setNcr_description(String ncr_description) {
		this.ncr_description = ncr_description;
	}
	public String getNcr_grade_id() {
		return ncr_grade_id;
	}
	public void setNcr_grade_id(String ncr_grade_id) {
		this.ncr_grade_id = ncr_grade_id;
	}
	
	public MultipartFile getNcr_file() {
		return ncr_file;
	}
	public void setNcr_file(MultipartFile ncr_file) {
		this.ncr_file = ncr_file;
	}
	public ncrIssueCommand() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ncrIssueCommand(String audit_id, String ncr_title, String ncr_description, String ncr_grade_id,
			MultipartFile ncr_file) {
		super();
		this.audit_id = audit_id;
		this.ncr_title = ncr_title;
		this.ncr_description = ncr_description;
		this.ncr_grade_id = ncr_grade_id;

		this.ncr_file = ncr_file;
	}
	
	
	
}
