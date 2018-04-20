package bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class DateCommand {
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date from, to;
	private String selDate;

	private String plandate;

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
