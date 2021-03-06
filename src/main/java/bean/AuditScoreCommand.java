package bean;

import java.sql.Date;

public class AuditScoreCommand {

	private String AUDIT_ID;
	private String CHECKLIST_ID;
	private String AUDIT_RESULT_ID;
	private int AUDIT_SCORE;
	private Date AUDIT_RSINPUT_DATE, AUDIT_COMP_DATE;
	private String VENDOR_ID;

	public AuditScoreCommand() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AuditScoreCommand(String aUDIT_ID, String cHECKLIST_ID, String aUDIT_RESULT_ID, int aUDIT_SCORE,
			Date aUDIT_RSINPUT_DATE, Date aUDIT_COMP_DATE) {
		super();
		AUDIT_ID = aUDIT_ID;
		CHECKLIST_ID = cHECKLIST_ID;
		AUDIT_RESULT_ID = aUDIT_RESULT_ID;
		AUDIT_SCORE = aUDIT_SCORE;
		AUDIT_RSINPUT_DATE = aUDIT_RSINPUT_DATE;
		AUDIT_COMP_DATE = aUDIT_COMP_DATE;
	}

	public String getAUDIT_ID() {
		return AUDIT_ID;
	}

	public String getVENDOR_ID() {
		return VENDOR_ID;
	}

	public void setVENDOR_ID(String vENDOR_ID) {
		VENDOR_ID = vENDOR_ID;
	}

	public void setAUDIT_ID(String aUDIT_ID) {
		AUDIT_ID = aUDIT_ID;
	}

	public String getCHECKLIST_ID() {
		return CHECKLIST_ID;
	}

	public void setCHECKLIST_ID(String cHECKLIST_ID) {
		CHECKLIST_ID = cHECKLIST_ID;
	}

	public String getAUDIT_RESULT_ID() {
		return AUDIT_RESULT_ID;
	}

	public void setAUDIT_RESULT_ID(String aUDIT_RESULT_ID) {
		AUDIT_RESULT_ID = aUDIT_RESULT_ID;
	}

	public int getAUDIT_SCORE() {
		return AUDIT_SCORE;
	}

	public void setAUDIT_SCORE(int aUDIT_SCORE) {
		AUDIT_SCORE = aUDIT_SCORE;
	}

	public Date getAUDIT_RSINPUT_DATE() {
		return AUDIT_RSINPUT_DATE;
	}

	public void setAUDIT_RSINPUT_DATE(Date aUDIT_RSINPUT_DATE) {
		AUDIT_RSINPUT_DATE = aUDIT_RSINPUT_DATE;
	}

	public Date getAUDIT_COMP_DATE() {
		return AUDIT_COMP_DATE;
	}

	public void setAUDIT_COMP_DATE(Date aUDIT_COMP_DATE) {
		AUDIT_COMP_DATE = aUDIT_COMP_DATE;
	}

}
