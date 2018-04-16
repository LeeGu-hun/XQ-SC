package bean;

public class AdminCkL {
	private int start, end;
	private String auditKindId, cklValid, keyword;
	
	public AdminCkL(int start, int end, String auditKindId, String cklValid, String keyword) {
		this.start = start;
		this.end = end;
		this.auditKindId = auditKindId;
		this.cklValid = cklValid;
		this.keyword = keyword;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public String getAuditKindId() {
		return auditKindId;
	}

	public void setAuditKindId(String auditKindId) {
		this.auditKindId = auditKindId;
	}

	public String getCklValid() {
		return cklValid;
	}

	public void setCklValid(String cklValid) {
		this.cklValid = cklValid;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
