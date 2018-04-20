package bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AuditResultSearch {
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private int RNUM, AUDIT_SCORE;
	private String AUDIT_ID;
	private String VENDOR_NAME;
	private String VENDOR_ID;
	private String PRODUCT_NAME;
	private String PRODUCT_ID;
	private Date AUDIT_PLAN_DATE;
	private Date AUDIT_COMP_DATE;
	private Date AUDIT_RSINPUT_DATE;
	private String AUDIT_KIND_ID;
	private String MEMBER_NAME;
	private String MEMBER_ID;
	private String VENDOR_ADDRESS;
	private String AUDIT_RESULT;
	private String selDate;

	private String date, vendor;
	private Date from, to;

	public AuditResultSearch() {
		super();
	}

	public AuditResultSearch(String date, String vendor, Date from, Date to) {
		super();
		this.date = date;
		this.vendor = vendor;
		this.from = from;
		this.to = to;
	}

	public int getRNUM() {
		return RNUM;
	}

	public String getSelDate() {
		return selDate;
	}

	public void setSelDate(String selDate) {
		this.selDate = selDate;
	}

	public void setRNUM(int rNUM) {
		RNUM = rNUM;
	}

	public int getAUDIT_SCORE() {
		return AUDIT_SCORE;
	}

	public void setAUDIT_SCORE(int aUDIT_SCORE) {
		AUDIT_SCORE = aUDIT_SCORE;
	}

	public String getAUDIT_ID() {
		return AUDIT_ID;
	}

	public void setAUDIT_ID(String aUDIT_ID) {
		AUDIT_ID = aUDIT_ID;
	}

	public String getVENDOR_NAME() {
		return VENDOR_NAME;
	}

	public void setVENDOR_NAME(String vENDOR_NAME) {
		VENDOR_NAME = vENDOR_NAME;
	}

	public String getVENDOR_ID() {
		return VENDOR_ID;
	}

	public void setVENDOR_ID(String vENDOR_ID) {
		VENDOR_ID = vENDOR_ID;
	}

	public String getPRODUCT_NAME() {
		return PRODUCT_NAME;
	}

	public void setPRODUCT_NAME(String pRODUCT_NAME) {
		PRODUCT_NAME = pRODUCT_NAME;
	}

	public String getPRODUCT_ID() {
		return PRODUCT_ID;
	}

	public void setPRODUCT_ID(String pRODUCT_ID) {
		PRODUCT_ID = pRODUCT_ID;
	}

	public Date getAUDIT_PLAN_DATE() {
		return AUDIT_PLAN_DATE;
	}

	public void setAUDIT_PLAN_DATE(Date aUDIT_PLAN_DATE) {
		AUDIT_PLAN_DATE = aUDIT_PLAN_DATE;
	}

	public Date getAUDIT_COMP_DATE() {
		return AUDIT_COMP_DATE;
	}

	public void setAUDIT_COMP_DATE(Date aUDIT_COMP_DATE) {
		AUDIT_COMP_DATE = aUDIT_COMP_DATE;
	}

	public Date getAUDIT_RSINPUT_DATE() {
		return AUDIT_RSINPUT_DATE;
	}

	public void setAUDIT_RSINPUT_DATE(Date aUDIT_RSINPUT_DATE) {
		AUDIT_RSINPUT_DATE = aUDIT_RSINPUT_DATE;
	}

	public String getAUDIT_KIND_ID() {
		return AUDIT_KIND_ID;
	}

	public void setAUDIT_KIND_ID(String aUDIT_KIND_ID) {
		AUDIT_KIND_ID = aUDIT_KIND_ID;
	}

	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}

	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}

	public String getMEMBER_ID() {
		return MEMBER_ID;
	}

	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}

	public String getVENDOR_ADDRESS() {
		return VENDOR_ADDRESS;
	}

	public void setVENDOR_ADDRESS(String vENDOR_ADDRESS) {
		VENDOR_ADDRESS = vENDOR_ADDRESS;
	}

	public String getAUDIT_RESULT() {
		return AUDIT_RESULT;
	}

	public void setAUDIT_RESULT(String aUDIT_RESULT) {
		AUDIT_RESULT = aUDIT_RESULT;
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
