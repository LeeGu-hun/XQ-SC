package bean;

public class CheckListBean {
	private int RNUM;
	private String CHECKLIST_ID;
	private String CHECKLIST_DISCRIPTION;
	private String AUDIT_KIND_ID;
	private int CHECKLIST_FULLSCORE;
	private String CHECKLIST_VALID;
	
	public CheckListBean() {
		super();
	}

	public CheckListBean(int rNUM, String cHECKLIST_ID, String cHECKLIST_DISCRIPTION, String aUDIT_KIND_ID,
			int cHECKLIST_FULLSCORE, String cHECKLIST_VALID) {
		super();
		RNUM = rNUM;
		CHECKLIST_ID = cHECKLIST_ID;
		CHECKLIST_DISCRIPTION = cHECKLIST_DISCRIPTION;
		AUDIT_KIND_ID = aUDIT_KIND_ID;
		CHECKLIST_FULLSCORE = cHECKLIST_FULLSCORE;
		CHECKLIST_VALID = cHECKLIST_VALID;
	}
	
	

	public CheckListBean(int rNUM, String cHECKLIST_DISCRIPTION, int cHECKLIST_FULLSCORE) {
		super();
		RNUM = rNUM;
		CHECKLIST_DISCRIPTION = cHECKLIST_DISCRIPTION;
		CHECKLIST_FULLSCORE = cHECKLIST_FULLSCORE;
	}

	public int getRNUM() {
		return RNUM;
	}

	public void setRNUM(int rNUM) {
		RNUM = rNUM;
	}

	public String getCHECKLIST_ID() {
		return CHECKLIST_ID;
	}

	public void setCHECKLIST_ID(String cHECKLIST_ID) {
		CHECKLIST_ID = cHECKLIST_ID;
	}

	public String getCHECKLIST_DISCRIPTION() {
		return CHECKLIST_DISCRIPTION;
	}

	public void setCHECKLIST_DISCRIPTION(String cHECKLIST_DISCRIPTION) {
		CHECKLIST_DISCRIPTION = cHECKLIST_DISCRIPTION;
	}

	public String getAUDIT_KIND_ID() {
		return AUDIT_KIND_ID;
	}

	public void setAUDIT_KIND_ID(String aUDIT_KIND_ID) {
		AUDIT_KIND_ID = aUDIT_KIND_ID;
	}

	public int getCHECKLIST_FULLSCORE() {
		return CHECKLIST_FULLSCORE;
	}

	public void setCHECKLIST_FULLSCORE(int cHECKLIST_FULLSCORE) {
		CHECKLIST_FULLSCORE = cHECKLIST_FULLSCORE;
	}

	public String getCHECKLIST_VALID() {
		return CHECKLIST_VALID;
	}

	public void setCHECKLIST_VALID(String cHECKLIST_VALID) {
		CHECKLIST_VALID = cHECKLIST_VALID;
	}

}
