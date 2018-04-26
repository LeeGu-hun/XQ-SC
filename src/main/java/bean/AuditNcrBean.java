package bean;

import java.sql.Date;

public class AuditNcrBean {
	
	private String AUDIT_ID;
	private String VENDOR_NAME;
	private Date AUDIT_COMP_DATE;
	private String AUDIT_KIND_ID;
	private String AUDIT_KIND;
	private String AUDIT_RESULT;
	private String NCR_TITLE;
	private String MEMBER_NAME;
	private String NCR_DESCRIPTION;
	private String NCR_GRADE_ID;
	
	
	
	public AuditNcrBean(String aUDIT_ID, String vENDOR_NAME, Date aUDIT_COMP_DATE, String aUDIT_KIND_ID,
			String aUDIT_KIND, String aUDIT_RESULT, String nCR_TITLE, String mEMBER_NAME, String nCR_DESCRIPTION,
			String nCR_GRADE_ID) {
		super();
		AUDIT_ID = aUDIT_ID;
		VENDOR_NAME = vENDOR_NAME;
		AUDIT_COMP_DATE = aUDIT_COMP_DATE;
		AUDIT_KIND_ID = aUDIT_KIND_ID;
		AUDIT_KIND = aUDIT_KIND;
		AUDIT_RESULT = aUDIT_RESULT;
		NCR_TITLE = nCR_TITLE;
		MEMBER_NAME = mEMBER_NAME;
		NCR_DESCRIPTION = nCR_DESCRIPTION;
		NCR_GRADE_ID = nCR_GRADE_ID;
	}
	public AuditNcrBean() {
		
		super();
		// TODO Auto-generated constructor stub
	}
	public String getAUDIT_ID() {
		return AUDIT_ID;
	}
	public void setAUDIT_ID(String aUDIT_ID) {
		AUDIT_ID = aUDIT_ID;
	}
	public String getVENDOR_NAME() {
		return VENDOR_NAME;
	}
	public void setVENDOR_NAME(String vENDOR_NAME) {
		VENDOR_NAME = vENDOR_NAME;
	}
	public Date getAUDIT_COMP_DATE() {
		return AUDIT_COMP_DATE;
	}
	public void setAUDIT_COMP_DATE(Date aUDIT_COMP_DATE) {
		AUDIT_COMP_DATE = aUDIT_COMP_DATE;
	}
	public String getAUDIT_KIND_ID() {
		return AUDIT_KIND_ID;
	}
	public void setAUDIT_KIND_ID(String aUDIT_KIND_ID) {
		AUDIT_KIND_ID = aUDIT_KIND_ID;
	}
	public String getAUDIT_KIND() {
		return AUDIT_KIND;
	}
	public void setAUDIT_KIND(String aUDIT_KIND) {
		AUDIT_KIND = aUDIT_KIND;
	}
	public String getAUDIT_RESULT() {
		return AUDIT_RESULT;
	}
	public void setAUDIT_RESULT(String aUDIT_RESULT) {
		AUDIT_RESULT = aUDIT_RESULT;
	}
	public String getNCR_TITLE() {
		return NCR_TITLE;
	}
	public void setNCR_TITLE(String nCR_TITLE) {
		NCR_TITLE = nCR_TITLE;
	}
	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}
	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}
	public String getNCR_DESCRIPTION() {
		return NCR_DESCRIPTION;
	}
	public void setNCR_DESCRIPTION(String nCR_DESCRIPTION) {
		NCR_DESCRIPTION = nCR_DESCRIPTION;
	}
	public String getNCR_GRADE_ID() {
		return NCR_GRADE_ID;
	}
	public void setNCR_GRADE_ID(String nCR_GRADE_ID) {
		NCR_GRADE_ID = nCR_GRADE_ID;
	}
	
	

}
