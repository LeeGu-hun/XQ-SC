package bean;

import java.sql.Date;

public class AuditSubmitBean {

	private String AUDIT_ID;
	private Date AUDIT_PLAN_DATE;
	private Date AUDIT_COMP_DATE;
	private Date AUDIT_RSINPUT_DATE;
	private Date AUDIT_NEXT_DATE;
	private int AUDIT_SCORE;

	private String AUDIT_RESULT_ID;
	private String CHECKLIST_ID;

	public AuditSubmitBean() {
	}

	public String getAUDIT_RESULT_ID() {
		return AUDIT_RESULT_ID;
	}

	public void setAUDIT_RESULT_ID(String aUDIT_RESULT_ID) {
		AUDIT_RESULT_ID = aUDIT_RESULT_ID;
	}

	public String getCHECKLIST_ID() {
		return CHECKLIST_ID;
	}

	public void setCHECKLIST_ID(String cHECKLIST_ID) {
		CHECKLIST_ID = cHECKLIST_ID;
	}

	public String getAUDIT_ID() {
		return AUDIT_ID;
	}

	public void setAUDIT_ID(String aUDIT_ID) {
		AUDIT_ID = aUDIT_ID;
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

	public Date getAUDIT_RSINPUT_DATE() {
		return AUDIT_RSINPUT_DATE;
	}

	public void setAUDIT_RSINPUT_DATE(Date aUDIT_RSINPUT_DATE) {
		AUDIT_RSINPUT_DATE = aUDIT_RSINPUT_DATE;
	}

	public Date getAUDIT_NEXT_DATE() {
		return AUDIT_NEXT_DATE;
	}

	public void setAUDIT_NEXT_DATE(Date aUDIT_NEXT_DATE) {
		AUDIT_NEXT_DATE = aUDIT_NEXT_DATE;
	}

	public int getAUDIT_SCORE() {
		return AUDIT_SCORE;
	}

	public void setAUDIT_SCORE(int aUDIT_SCORE) {
		AUDIT_SCORE = aUDIT_SCORE;
	}

}
