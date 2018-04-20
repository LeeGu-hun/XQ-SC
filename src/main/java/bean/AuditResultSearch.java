package bean;

import java.util.Date;

public class AuditResultSearch {

	private String date, vendor;
	private Date from, to;

	public AuditResultSearch() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AuditResultSearch(String date, String vendor, Date from, Date to) {
		super();
		this.date = date;
		this.vendor = vendor;
		this.from = from;
		this.to = to;
	}

	public String getDate() {
		return date;
	}

	public String getVendor() {
		return vendor;
	}

	public void setVendor(String vendor) {
		this.vendor = vendor;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Date getFrom() {
		return from;
	}

	public void setFrom(Date from) {
		this.from = from;
	}

	public Date getTo() {
		return to;
	}

	public void setTo(Date to) {
		this.to = to;
	}

}
