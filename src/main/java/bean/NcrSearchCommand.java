package bean;



public class NcrSearchCommand {
	private String ncr_id,ncr_title,vendor_id,issuer_id,audit_id,ncr_comp;

	public String getNcr_id() {
		return ncr_id;
	}

	public void setNcr_id(String ncr_id) {
		this.ncr_id = ncr_id;
	}

	public String getNcr_title() {
		return ncr_title;
	}

	public void setNcr_title(String ncr_title) {
		this.ncr_title = ncr_title;
	}

	public String getVendor_id() {
		return vendor_id;
	}

	public void setVendor_id(String vendor_id) {
		this.vendor_id = vendor_id;
	}

	public String getIssuer_id() {
		return issuer_id;
	}

	public void setIssuer_id(String issuer_id) {
		this.issuer_id = issuer_id;
	}

	public String getAudit_id() {
		return audit_id;
	}

	public void setAudit_id(String audit_id) {
		this.audit_id = audit_id;
	}

	public String getNcr_comp() {
		return ncr_comp;
	}

	public void setNcr_comp(String ncr_comp) {
		this.ncr_comp = ncr_comp;
	}

	public NcrSearchCommand(String ncr_id, String ncr_title, String vendor_id, String issuer_id, String audit_id,
			String ncr_comp) {
		super();
		this.ncr_id = ncr_id;
		this.ncr_title = ncr_title;
		this.vendor_id = vendor_id;
		this.issuer_id = issuer_id;
		this.audit_id = audit_id;
		this.ncr_comp = ncr_comp;
	}

	public NcrSearchCommand() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
}