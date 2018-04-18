package bean;

public class AuditKind {

	private String AUDIT_KIND_ID;
	private String AUDIT_KIND;
	private int AUDIT_KIND_PERIOD;

	public AuditKind() {
	}

	public AuditKind(String aUDIT_KIND_ID, String aUDIT_KIND) {
		super();
		AUDIT_KIND_ID = aUDIT_KIND_ID;
		AUDIT_KIND = aUDIT_KIND;
		
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

	public int getAUDIT_KIND_PERIOD() {
		return AUDIT_KIND_PERIOD;
	}

	public void setAUDIT_KIND_PERIOD(int aUDIT_KIND_PERIOD) {
		AUDIT_KIND_PERIOD = aUDIT_KIND_PERIOD;
	}

}
