package bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class DateCommand {
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date from, to;
	private String selDate;
	private String plandate;
	private String vSearch;
	private String incomplete;
	private String complete;
	
	

	public String getComplete() {
		return complete;
	}

	public void setComplete(String complete) {
		this.complete = complete;
	}

	public String getIncomplete() {
		return incomplete;
	}

	public void setIncomplete(String incomplete) {
		this.incomplete = incomplete;
	}

	public String getvSearch() {
		return vSearch;
	}

	public void setvSearch(String vSearch) {
		this.vSearch = vSearch;
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

	public String getSelDate() {
		return selDate;
	}

	public void setSelDate(String selDate) {
		this.selDate = selDate;
	}

	public String getPlandate() {
		return plandate;
	}

	public void setPlandate(String plandate) {
		this.plandate = plandate;
	}

}
