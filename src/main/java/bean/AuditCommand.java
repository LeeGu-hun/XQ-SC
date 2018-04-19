package bean;

import java.sql.Date;

public class AuditCommand {

	private String AUDIT_ID, AUDIT_KIND_ID, AUDITOR_ID, VENDOR_ID;
	private Date AUDIT_PLAN_DATE, AUDIT_COMP_DATE;

	public AuditCommand() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public AuditCommand(String aUDIT_ID, String aUDITOR_ID, Date aUDIT_PLAN_DATE, Date aUDIT_COMP_DATE) {
		super();
		AUDIT_ID = aUDIT_ID;
		AUDITOR_ID = aUDITOR_ID;
		AUDIT_PLAN_DATE = aUDIT_PLAN_DATE;
		AUDIT_COMP_DATE = aUDIT_COMP_DATE;
	}



	public AuditCommand(String aUDIT_ID, String aUDIT_KIND_ID, String aUDITOR_ID, String vENDOR_ID,
			Date aUDIT_PLAN_DATE, Date aUDIT_COMP_DATE) {
		super();
		AUDIT_ID = aUDIT_ID;
		AUDIT_KIND_ID = aUDIT_KIND_ID;
		AUDITOR_ID = aUDITOR_ID;
		VENDOR_ID = vENDOR_ID;
		AUDIT_PLAN_DATE = aUDIT_PLAN_DATE;
		AUDIT_COMP_DATE = aUDIT_COMP_DATE;
	}

	public String getAUDIT_ID() {
		return AUDIT_ID;
	}

	public void setAUDIT_ID(String aUDIT_ID) {
		AUDIT_ID = aUDIT_ID;
	}

	public String getAUDIT_KIND_ID() {
		return AUDIT_KIND_ID;
	}

	public void setAUDIT_KIND_ID(String aUDIT_KIND_ID) {
		AUDIT_KIND_ID = aUDIT_KIND_ID;
	}

	public String getAUDITOR_ID() {
		return AUDITOR_ID;
	}

	public void setAUDITOR_ID(String aUDITOR_ID) {
		AUDITOR_ID = aUDITOR_ID;
	}

	public String getVENDOR_ID() {
		return VENDOR_ID;
	}

	public void setVENDOR_ID(String vENDOR_ID) {
		VENDOR_ID = vENDOR_ID;
	}

	public Date getAUDIT_PLAN_DATE() {
		return AUDIT_PLAN_DATE;
	}

	public void setAUDIT_PLAN_DATE(Date aUDIT_PLAN_DATE) {
		AUDIT_PLAN_DATE = aUDIT_PLAN_DATE;
	}

	public Date getAUDIT_COMP_DATE() {
		return AUDIT_COMP_DATE;
	}

	public void setAUDIT_COMP_DATE(Date aUDIT_COMP_DATE) {
		AUDIT_COMP_DATE = aUDIT_COMP_DATE;
	}

}
