package bean;

import java.sql.Date;

public class AuditBean {

	private int RNUM;
	private String AUDIT_ID;
	private String AUDIT_KIND_ID;
	private Date AUDIT_PLAN_DATE;
	private Date AUDIT_NEXT_DATE;
	private Date AUDIT_COMP_DATE;
	private Date AUDIT_RSINPUT_DATE;
	private Date LAST_AUDIT_DATE;
	private String AUDITOR_ID;
	private String VENDOR_ID;
	private int AUDIT_SCORE;
	private String AUDIT_RESULT;

	private String VENDOR_NAME;
	private String MEMBER_NAME;
	private String MEMBER_ID;
	private String MEMBER_TEL;
	private String VENDOR_Q_NAME;
	private String VENDOR_Q_TEL;
	private String VENDOR_ADDRESS;
	private String PRODUCT_ID;
	private String CATEGORY_NAME;
	private String PRODUCT_NAME;

	private String VENDOR_S_NAME;
	private String VENDOR_S_TEL;

	private String date, vendor;
	private Date from, to;

	public AuditBean() {
	}

	public AuditBean(String date, String vendor, Date from, Date to) {
		super();
		this.date = date;
		this.vendor = vendor;
		this.from = from;
		this.to = to;
	}

	public AuditBean(String aUDIT_ID, int aUDIT_SCORE) {
		super();
		AUDIT_ID = aUDIT_ID;
		AUDIT_SCORE = aUDIT_SCORE;
	}

	public AuditBean(String aUDIT_ID, String aUDIT_KIND_ID, String aUDITOR_ID, String vENDOR_ID) {
		super();
		AUDIT_ID = aUDIT_ID;
		AUDIT_KIND_ID = aUDIT_KIND_ID;
		AUDITOR_ID = aUDITOR_ID;
		VENDOR_ID = vENDOR_ID;
	}

	public AuditBean(int rNUM, String aUDIT_ID, String aUDIT_KIND_ID, Date aUDIT_PLAN_DATE, Date aUDIT_NEXT_DATE,
			Date aUDIT_COMP_DATE, Date aUDIT_RSINPUT_DATE, Date lAST_AUDIT_DATE, String aUDITOR_ID, String vENDOR_ID,
			int aUDIT_SCORE, String aUDIT_RESULT, String vENDOR_NAME, String mEMBER_NAME, String mEMBER_ID,
			String mEMBER_TEL, String vENDOR_Q_NAME, String vENDOR_Q_TEL, String vENDOR_ADDRESS, String pRODUCT_ID,
			String cATEGORY_NAME, String pRODUCT_NAME, String vENDOR_S_NAME, String vENDOR_S_TEL) {
		super();
		RNUM = rNUM;
		AUDIT_ID = aUDIT_ID;
		AUDIT_KIND_ID = aUDIT_KIND_ID;
		AUDIT_PLAN_DATE = aUDIT_PLAN_DATE;
		AUDIT_NEXT_DATE = aUDIT_NEXT_DATE;
		AUDIT_COMP_DATE = aUDIT_COMP_DATE;
		AUDIT_RSINPUT_DATE = aUDIT_RSINPUT_DATE;
		LAST_AUDIT_DATE = lAST_AUDIT_DATE;
		AUDITOR_ID = aUDITOR_ID;
		VENDOR_ID = vENDOR_ID;
		AUDIT_SCORE = aUDIT_SCORE;
		AUDIT_RESULT = aUDIT_RESULT;
		VENDOR_NAME = vENDOR_NAME;
		MEMBER_NAME = mEMBER_NAME;
		MEMBER_ID = mEMBER_ID;
		MEMBER_TEL = mEMBER_TEL;
		VENDOR_Q_NAME = vENDOR_Q_NAME;
		VENDOR_Q_TEL = vENDOR_Q_TEL;
		VENDOR_ADDRESS = vENDOR_ADDRESS;
		PRODUCT_ID = pRODUCT_ID;
		CATEGORY_NAME = cATEGORY_NAME;
		PRODUCT_NAME = pRODUCT_NAME;
		VENDOR_S_NAME = vENDOR_S_NAME;
		VENDOR_S_TEL = vENDOR_S_TEL;
	}

	public AuditBean(int rNUM, String aUDIT_ID, String vENDOR_NAME, Date aUDIT_PLAN_DATE, String aUDIT_KIND_ID,
			String mEMBER_NAME, String mEMBER_ID, String mEMBER_TEL, String vENDOR_Q_NAME, String vENDOR_Q_TEL,
			String vENDOR_ADDRESS) {
		super();
		RNUM = rNUM;
		AUDIT_ID = aUDIT_ID;
		VENDOR_NAME = vENDOR_NAME;
		AUDIT_PLAN_DATE = aUDIT_PLAN_DATE;
		AUDIT_KIND_ID = aUDIT_KIND_ID;
		MEMBER_NAME = mEMBER_NAME;
		MEMBER_ID = mEMBER_ID;
		MEMBER_TEL = mEMBER_TEL;
		VENDOR_Q_NAME = vENDOR_Q_NAME;
		VENDOR_Q_TEL = vENDOR_Q_TEL;
		VENDOR_ADDRESS = vENDOR_ADDRESS;
	}

	public AuditBean(int rNUM, String vENDOR_NAME, Date aUDIT_PLAN_DATE, String aUDIT_KIND_ID, String mEMBER_NAME,
			String mEMBER_ID, String mEMBER_TEL, String vENDOR_ID, String pRODUCT_ID) {
		super();
		RNUM = rNUM;
		VENDOR_NAME = vENDOR_NAME;
		AUDIT_PLAN_DATE = aUDIT_PLAN_DATE;
		AUDIT_KIND_ID = aUDIT_KIND_ID;
		MEMBER_NAME = mEMBER_NAME;
		MEMBER_ID = mEMBER_ID;
		MEMBER_TEL = mEMBER_TEL;
		VENDOR_ID = vENDOR_ID;
		PRODUCT_ID = pRODUCT_ID;
	}

	public AuditBean(int rNUM, String aUDIT_ID, String vENDOR_NAME, Date aUDIT_PLAN_DATE, String aUDIT_KIND_ID,
			String mEMBER_NAME, String mEMBER_ID, int aUDIT_SCORE, String vENDOR_ID, String pRODUCT_ID,
			String pRODUCT_NAME) {
		super();
		RNUM = rNUM;
		AUDIT_ID = aUDIT_ID;
		VENDOR_NAME = vENDOR_NAME;
		AUDIT_PLAN_DATE = aUDIT_PLAN_DATE;
		AUDIT_KIND_ID = aUDIT_KIND_ID;
		MEMBER_NAME = mEMBER_NAME;
		MEMBER_ID = mEMBER_ID;
		AUDIT_SCORE = aUDIT_SCORE;
		VENDOR_ID = vENDOR_ID;
		PRODUCT_ID = pRODUCT_ID;
		PRODUCT_NAME = pRODUCT_NAME;

	}

	public AuditBean(int rNUM, String aUDIT_ID, String aUDIT_KIND_ID, Date aUDIT_PLAN_DATE, Date aUDIT_NEXT_DATE,
			Date aUDIT_COMP_DATE, Date aUDIT_RSINPUT_DATE, String aUDITOR_ID, String vENDOR_ID, int aUDIT_SCORE,
			String aUDIT_RESULT, String vENDOR_NAME, String mEMBER_NAME, String mEMBER_ID, String mEMBER_TEL,
			String vENDOR_Q_NAME, String vENDOR_Q_TEL, String vENDOR_ADDRESS, String pRODUCT_ID, String cATEGORY_NAME,
			String pRODUCT_NAME, String vENDOR_S_NAME, String vENDOR_S_TEL) {
		super();
		RNUM = rNUM;
		AUDIT_ID = aUDIT_ID;
		AUDIT_KIND_ID = aUDIT_KIND_ID;
		AUDIT_PLAN_DATE = aUDIT_PLAN_DATE;
		AUDIT_NEXT_DATE = aUDIT_NEXT_DATE;
		AUDIT_COMP_DATE = aUDIT_COMP_DATE;
		AUDIT_RSINPUT_DATE = aUDIT_RSINPUT_DATE;
		AUDITOR_ID = aUDITOR_ID;
		VENDOR_ID = vENDOR_ID;
		AUDIT_SCORE = aUDIT_SCORE;
		AUDIT_RESULT = aUDIT_RESULT;
		VENDOR_NAME = vENDOR_NAME;
		MEMBER_NAME = mEMBER_NAME;
		MEMBER_ID = mEMBER_ID;
		MEMBER_TEL = mEMBER_TEL;
		VENDOR_Q_NAME = vENDOR_Q_NAME;
		VENDOR_Q_TEL = vENDOR_Q_TEL;
		VENDOR_ADDRESS = vENDOR_ADDRESS;
		PRODUCT_ID = pRODUCT_ID;
		CATEGORY_NAME = cATEGORY_NAME;
		PRODUCT_NAME = pRODUCT_NAME;
		VENDOR_S_NAME = vENDOR_S_NAME;
		VENDOR_S_TEL = vENDOR_S_TEL;
	}

	public AuditBean(String cATEGORY_NAME) {
		super();
		CATEGORY_NAME = cATEGORY_NAME;
	}

	public AuditBean(int rNUM, String aUDIT_ID, String aUDIT_KIND_ID, Date aUDIT_PLAN_DATE, Date aUDIT_COMP_DATE,
			String vENDOR_ID, int aUDIT_SCORE, String vENDOR_NAME, String mEMBER_NAME, String mEMBER_ID,
			String mEMBER_TEL, String vENDOR_Q_NAME, String vENDOR_Q_TEL, String vENDOR_ADDRESS, String vENDOR_S_NAME,
			String vENDOR_S_TEL) {
		super();
		RNUM = rNUM;
		AUDIT_ID = aUDIT_ID;
		AUDIT_KIND_ID = aUDIT_KIND_ID;
		AUDIT_PLAN_DATE = aUDIT_PLAN_DATE;
		AUDIT_COMP_DATE = aUDIT_COMP_DATE;
		VENDOR_ID = vENDOR_ID;
		AUDIT_SCORE = aUDIT_SCORE;
		VENDOR_NAME = vENDOR_NAME;
		MEMBER_NAME = mEMBER_NAME;
		MEMBER_ID = mEMBER_ID;
		MEMBER_TEL = mEMBER_TEL;
		VENDOR_Q_NAME = vENDOR_Q_NAME;
		VENDOR_Q_TEL = vENDOR_Q_TEL;
		VENDOR_ADDRESS = vENDOR_ADDRESS;
		VENDOR_S_NAME = vENDOR_S_NAME;
		VENDOR_S_TEL = vENDOR_S_TEL;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getVendor() {
		return vendor;
	}

	public void setVendor(String vendor) {
		this.vendor = vendor;
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

	public Date getLAST_AUDIT_DATE() {
		return LAST_AUDIT_DATE;
	}

	public void setLAST_AUDIT_DATE(Date lAST_AUDIT_DATE) {
		LAST_AUDIT_DATE = lAST_AUDIT_DATE;
	}

	public String getVENDOR_S_NAME() {
		return VENDOR_S_NAME;
	}

	public void setVENDOR_S_NAME(String vENDOR_S_NAME) {
		VENDOR_S_NAME = vENDOR_S_NAME;
	}

	public String getVENDOR_S_TEL() {
		return VENDOR_S_TEL;
	}

	public void setVENDOR_S_TEL(String vENDOR_S_TEL) {
		VENDOR_S_TEL = vENDOR_S_TEL;
	}

	public Date getAUDIT_NEXT_DATE() {
		return AUDIT_NEXT_DATE;
	}

	public void setAUDIT_NEXT_DATE(Date aUDIT_NEXT_DATE) {
		AUDIT_NEXT_DATE = aUDIT_NEXT_DATE;
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

	public String getAUDITOR_ID() {
		return AUDITOR_ID;
	}

	public void setAUDITOR_ID(String aUDITOR_ID) {
		AUDITOR_ID = aUDITOR_ID;
	}

	public String getAUDIT_RESULT() {
		return AUDIT_RESULT;
	}

	public void setAUDIT_RESULT(String aUDIT_RESULT) {
		AUDIT_RESULT = aUDIT_RESULT;
	}

	public int getAUDIT_SCORE() {
		return AUDIT_SCORE;
	}

	public void setAUDIT_SCORE(int aUDIT_SCORE) {
		AUDIT_SCORE = aUDIT_SCORE;
	}

	public String getPRODUCT_NAME() {
		return PRODUCT_NAME;
	}

	public void setPRODUCT_NAME(String pRODUCT_NAME) {
		PRODUCT_NAME = pRODUCT_NAME;
	}

	public String getCATEGORY_NAME() {
		return CATEGORY_NAME;
	}

	public void setCATEGORY_NAME(String cATEGORY_NAME) {
		CATEGORY_NAME = cATEGORY_NAME;
	}

	public String getPRODUCT_ID() {
		return PRODUCT_ID;
	}

	public void setPRODUCT_ID(String pRODUCT_ID) {
		PRODUCT_ID = pRODUCT_ID;
	}

	public String getVENDOR_ID() {
		return VENDOR_ID;
	}

	public void setVENDOR_ID(String vENDOR_ID) {
		VENDOR_ID = vENDOR_ID;
	}

	public int getRNUM() {
		return RNUM;
	}

	public void setRNUM(int rNUM) {
		RNUM = rNUM;
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

	public Date getAUDIT_PLAN_DATE() {
		return AUDIT_PLAN_DATE;
	}

	public void setAUDIT_PLAN_DATE(Date aUDIT_PLAN_DATE) {
		AUDIT_PLAN_DATE = aUDIT_PLAN_DATE;
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

	public String getMEMBER_TEL() {
		return MEMBER_TEL;
	}

	public void setMEMBER_TEL(String mEMBER_TEL) {
		MEMBER_TEL = mEMBER_TEL;
	}

	public String getVENDOR_Q_NAME() {
		return VENDOR_Q_NAME;
	}

	public void setVENDOR_Q_NAME(String vENDOR_Q_NAME) {
		VENDOR_Q_NAME = vENDOR_Q_NAME;
	}

	public String getVENDOR_Q_TEL() {
		return VENDOR_Q_TEL;
	}

	public void setVENDOR_Q_TEL(String vENDOR_Q_TEL) {
		VENDOR_Q_TEL = vENDOR_Q_TEL;
	}

	public String getVENDOR_ADDRESS() {
		return VENDOR_ADDRESS;
	}

	public void setVENDOR_ADDRESS(String vENDOR_ADDRESS) {
		VENDOR_ADDRESS = vENDOR_ADDRESS;
	}

}
