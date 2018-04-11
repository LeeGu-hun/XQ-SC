package bean;

public class NcrAuditSearchCommand {
	
	String vendorName;
	String dateFrom;
	String dateTo;
	
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	public String getDateFrom() {
		return dateFrom;
	}
	public void setDateFrom(String dateFrom) {
		this.dateFrom = dateFrom;
	}
	public String getDateTo() {
		return dateTo;
	}
	public void setDateTo(String dateTo) {
		this.dateTo = dateTo;
	}
	public NcrAuditSearchCommand(String vendorName, String dateFrom, String dateTo) {
		super();
		this.vendorName = vendorName;
		this.dateFrom = dateFrom;
		this.dateTo = dateTo;
	}
	public NcrAuditSearchCommand(String vendorName2) {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
