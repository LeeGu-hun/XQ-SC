package bean;

public class NcrAuditListCommand {

	
	String audit_id; 
	String vendor_name;
	String audit_comp_date;
	String audit_kind_id;
	String audit_kind;
	String audit_result;
	String auditor_id;
	String member_name;
	
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getAudit_id() {
		return audit_id;
	}
	
	public void setAudit_id(String audit_id) {
		this.audit_id = audit_id;
	}
	public String getVendor_name() {
		return vendor_name;
	}
	public void setVendor_name(String vendor_name) {
		this.vendor_name = vendor_name;
	}
	public String getAudit_comp_date() {
		return audit_comp_date;
	}
	public void setAudit_comp_date(String audit_comp_date) {
		this.audit_comp_date = audit_comp_date;
	}
	public String getAudit_kind_id() {
		return audit_kind_id;
	}
	public void setAudit_kind_id(String audit_kind_id) {
		this.audit_kind_id = audit_kind_id;
	}
	public String getAudit_kind() {
		return audit_kind;
	}
	public void setAudit_kind(String audit_kind) {
		this.audit_kind = audit_kind;
	}
	public String getAudit_result() {
		return audit_result;
	}
	public void setAudit_result(String audit_result) {
		this.audit_result = audit_result;
	}
	public String getAuditor_id() {
		return auditor_id;
	}
	public void setAuditor_id(String auditor_id) {
		this.auditor_id = auditor_id;
	}
	
	public NcrAuditListCommand() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NcrAuditListCommand(String audit_id, String vendor_name, String audit_comp_date, String audit_kind_id,
			String audit_kind, String audit_result, String auditor_id, String member_name) {
		super();
		this.audit_id = audit_id;
		this.vendor_name = vendor_name;
		this.audit_comp_date = audit_comp_date;
		this.audit_kind_id = audit_kind_id;
		this.audit_kind = audit_kind;
		this.audit_result = audit_result;
		this.auditor_id = auditor_id;
		this.member_name = member_name;
	}
	
	
	
	
	
	
	
	
	
	
	
}
