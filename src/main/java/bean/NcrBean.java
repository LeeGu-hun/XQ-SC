package bean;

public class NcrBean {
String audit_id,issuer_id,ncr_title,ncr_description,ncr_grade_id;

public String getAudit_id() {
	return audit_id;
}

public void setAudit_id(String audit_id) {
	this.audit_id = audit_id;
}

public String getIssuer_id() {
	return issuer_id;
}

public void setIssuer_id(String issuer_id) {
	this.issuer_id = issuer_id;
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

public NcrBean(String audit_id, String issuer_id, String ncr_title, String ncr_description, String ncr_grade_id) {
	super();
	this.audit_id = audit_id;
	this.issuer_id = issuer_id;
	this.ncr_title = ncr_title;
	this.ncr_description = ncr_description;
	this.ncr_grade_id = ncr_grade_id;
}

public NcrBean() {
	super();
	// TODO Auto-generated constructor stub
}



}
