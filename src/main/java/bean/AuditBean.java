package bean;

import java.sql.Date;

public class AuditBean {

	private int RNUM;
	private String AUDIT_ID;
	private String VENDOR_NAME;
	private Date AUDIT_PLAN_DATE;
	private String AUDIT_KIND_ID;
	private String MEMBER_NAME;
	private String MEMBER_ID;
	private String MEMBER_TEL;
	private String VENDOR_Q_NAME;
	private String VENDOR_Q_TEL;
	private String VENDOR_ADDRESS;
	private int AUDIT_SCORE;

	private String VENDOR_ID;
	private String PRODUCT_ID;

	private String CATEGORY_NAME;
	private String PRODUCT_NAME;

	public AuditBean() {
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

	public AuditBean(String cATEGORY_NAME) {
		super();
		CATEGORY_NAME = cATEGORY_NAME;
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
