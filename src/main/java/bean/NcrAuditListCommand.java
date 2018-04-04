package bean;

public class NcrAuditListCommand {

	
	String auditNo; 
	String vendorName;
	String auditDate;
	String auditKindCode;
	String auditKind;
	String auditResult;
	String auditorId;
	String auditorName;
	public String getAuditNo() {
		return auditNo;
	}
	public void setAuditNo(String auditNo) {
		this.auditNo = auditNo;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	public String getAuditDate() {
		return auditDate;
	}
	public void setAuditDate(String auditDate) {
		this.auditDate = auditDate;
	}
	public String getAuditKindCode() {
		return auditKindCode;
	}
	public void setAuditKindCode(String auditKindCode) {
		this.auditKindCode = auditKindCode;
	}
	public String getAuditKind() {
		return auditKind;
	}
	public void setAuditKind(String auditKind) {
		this.auditKind = auditKind;
	}
	public String getAuditResult() {
		return auditResult;
	}
	public void setAuditResult(String auditResult) {
		this.auditResult = auditResult;
	}
	public String getAuditorId() {
		return auditorId;
	}
	public void setAuditorId(String auditorId) {
		this.auditorId = auditorId;
	}
	public String getAuditorName() {
		return auditorName;
	}
	public void setAuditorName(String auditorName) {
		this.auditorName = auditorName;
	}
	public NcrAuditListCommand(String auditNo, String vendorName, String auditDate, String auditKindCode,
			String auditKind, String auditResult, String auditorId, String auditorName) {
		super();
		this.auditNo = auditNo;
		this.vendorName = vendorName;
		this.auditDate = auditDate;
		this.auditKindCode = auditKindCode;
		this.auditKind = auditKind;
		this.auditResult = auditResult;
		this.auditorId = auditorId;
		this.auditorName = auditorName;
	}
	public NcrAuditListCommand() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
}
