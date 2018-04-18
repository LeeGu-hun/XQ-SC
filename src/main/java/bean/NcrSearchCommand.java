package bean;



public class NcrSearchCommand {
	private String ncr_id,ncr_title,vendor_id,issuer_id,date1,date2;
	private boolean isIncluded;
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
	
	public String getDate1() {
		return date1;
	}
	public void setDate1(String date1) {
		this.date1 = date1;
	}
	public String getDate2() {
		return date2;
	}
	public void setDate2(String date2) {
		this.date2 = date2;
	}
	public boolean isIncluded() {
		return isIncluded;
	}
	public void setIncluded(boolean isIncluded) {
		this.isIncluded = isIncluded;
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
	public NcrSearchCommand() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NcrSearchCommand(String ncr_id, String ncr_title, String vendor_id, String issuer_id, String date1,
			String date2, boolean isIncluded) {
		super();
		this.ncr_id = ncr_id;
		this.ncr_title = ncr_title;
		this.vendor_id = vendor_id;
		this.issuer_id = issuer_id;
		this.date1 = date1;
		this.date2 = date2;
		this.isIncluded = isIncluded;
	}
	
	
	
	
}