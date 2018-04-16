package bean;

public class AuditScoreCommand {

	private String AUDIT_ID;
	private int AUDIT_SCORE;

	public AuditScoreCommand() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public AuditScoreCommand(String aUDIT_ID) {
		super();
		AUDIT_ID = aUDIT_ID;
	}



	public AuditScoreCommand(String aUDIT_ID, int aUDIT_SCORE) {
		super();
		AUDIT_ID = aUDIT_ID;
		AUDIT_SCORE = aUDIT_SCORE;
	}

	public String getAUDIT_ID() {
		return AUDIT_ID;
	}

	public void setAUDIT_ID(String aUDIT_ID) {
		AUDIT_ID = aUDIT_ID;
	}

	public int getAUDIT_SCORE() {
		return AUDIT_SCORE;
	}

	public void setAUDIT_SCORE(int aUDIT_SCORE) {
		AUDIT_SCORE = aUDIT_SCORE;
	}

}
