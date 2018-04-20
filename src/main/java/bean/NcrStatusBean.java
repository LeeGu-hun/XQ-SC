package bean;

public class NcrStatusBean {
	
	private String vendor_id, vendor_name,audit_id,issuer_name;
	private int ocount,ccount;
	public String getVendor_id() {
		return vendor_id;
	}
	public void setVendor_id(String vendor_id) {
		this.vendor_id = vendor_id;
	}
	public String getVendor_name() {
		return vendor_name;
	}
	public void setVendor_name(String vendor_name) {
		this.vendor_name = vendor_name;
	}
	public String getAudit_id() {
		return audit_id;
	}
	public void setAudit_id(String audit_id) {
		this.audit_id = audit_id;
	}
	public String getIssuer_name() {
		return issuer_name;
	}
	public void setIssuer_name(String issuer_name) {
		this.issuer_name = issuer_name;
	}
	public int getOcount() {
		return ocount;
	}
	public void setOcount(int ocount) {
		this.ocount = ocount;
	}
	public int getCcount() {
		return ccount;
	}
	public void setCcount(int ccount) {
		this.ccount = ccount;
	}
	public NcrStatusBean(String vendor_id, String vendor_name, String audit_id, String issuer_name, int ocount,
			int ccount) {
		super();
		this.vendor_id = vendor_id;
		this.vendor_name = vendor_name;
		this.audit_id = audit_id;
		this.issuer_name = issuer_name;
		this.ocount = ocount;
		this.ccount = ccount;
	}
	public NcrStatusBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}
