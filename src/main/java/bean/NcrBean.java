package bean;

public class NcrBean {
String audit_id,issuer_id,issuer_name, ncr_title,ncr_description,ncr_grade_id, ncr_grade_name, ncr_id,ncr_comp_date,ncr_issue_date,ncr_comp,vendor_id,vendor_name
		,audit_kind_id,audit_kind,audit_result,auditor_id,auditor_name;

public String getVendor_name() {
	return vendor_name;
}

public void setVendor_name(String vendor_name) {
	this.vendor_name = vendor_name;
}

public String getAudit_id() {
	return audit_id;
}

public void setAudit_id(String audit_id) {
	this.audit_id = audit_id;
}

public String getIssuer_id() {
	return issuer_id;
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

public void setAudit_kind_name(String audit_kind) {
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

public String getAuditor_name() {
	return auditor_name;
}

public void setAuditor_name(String auditor_name) {
	this.auditor_name = auditor_name;
}

public void setIssuer_id(String issuer_id) {
	this.issuer_id = issuer_id;
}

public String getNcr_title() {
	return ncr_title;
}

public String getNcr_id() {
	return ncr_id;
}

public void setNcr_id(String ncr_id) {
	this.ncr_id = ncr_id;
}

public String getNcr_comp_date() {
	return ncr_comp_date;
}

public void setNcr_comp_date(String ncr_comp_date) {
	this.ncr_comp_date = ncr_comp_date;
}

public String getNcr_issue_date() {
	return ncr_issue_date;
}

public String getIssuer_name() {
	return issuer_name;
}

public void setIssuer_name(String issuer_name) {
	this.issuer_name = issuer_name;
}

public String getNcr_grade_name() {
	return ncr_grade_name;
}

public void setNcr_grade_name(String ncr_grade_name) {
	this.ncr_grade_name = ncr_grade_name;
}

public String getVendor_id() {
	return vendor_id;
}

public void setVendor_id(String vendor_id) {
	this.vendor_id = vendor_id;
}

public void setNcr_issue_date(String ncr_issue_date) {
	this.ncr_issue_date = ncr_issue_date;
}

public String getNcr_comp() {
	return ncr_comp;
}

public void setNcr_comp(String ncr_comp) {
	this.ncr_comp = ncr_comp;
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

public NcrBean(String audit_id, String issuer_id, String issuer_name, String ncr_title, String ncr_description,
		String ncr_grade_id, String ncr_grade_name, String ncr_id, String ncr_comp_date, String ncr_issue_date,
		String ncr_comp, String vendor_id, String vendor_name, String audit_kind_id, String audit_kind,
		String audit_result, String auditor_id, String auditor_name) {
	super();
	this.audit_id = audit_id;
	this.issuer_id = issuer_id;
	this.issuer_name = issuer_name;
	this.ncr_title = ncr_title;
	this.ncr_description = ncr_description;
	this.ncr_grade_id = ncr_grade_id;
	this.ncr_grade_name = ncr_grade_name;
	this.ncr_id = ncr_id;
	this.ncr_comp_date = ncr_comp_date;
	this.ncr_issue_date = ncr_issue_date;
	this.ncr_comp = ncr_comp;
	this.vendor_id = vendor_id;
	this.vendor_name = vendor_name;
	this.audit_kind_id = audit_kind_id;	
	this.audit_result = audit_result;
	this.auditor_id = auditor_id;
	this.auditor_name = auditor_name;
}

public NcrBean() {
	super();
	// TODO Auto-generated constructor stub
}






}
