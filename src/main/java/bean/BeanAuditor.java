package bean;

public class BeanAuditor {
	
	String auditor_id ,auditor_name;

	public String getAuditor_id() {
		return auditor_id;
	}

	public void setAuditor_id(String auditor_id) {
		this.auditor_id = auditor_id;
	}

	public String getAuditor_name() {
		return auditor_name;
	}

	public void setAuditor_name(String auditor_name) {
		this.auditor_name = auditor_name;
	}

	public BeanAuditor(String auditor_id, String auditor_name) {
		super();
		this.auditor_id = auditor_id;
		this.auditor_name = auditor_name;
	}

	public BeanAuditor() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	

}
