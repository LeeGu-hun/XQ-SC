package bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class VendorStatus {
	private int RNUM;
	
	private String VENDOR_ID;
	private String VENDOR_NAME;
	private String PRODUCT_ID;
	private Date AUDIT_PLAN_DATE;
	private String AUDIT_KIND_ID;
	private String VENDOR_S_NAME;
	private String VENDOR_S_TEL;
	private String VENDOR_S_EMAIL;
	private String VALIDITY;
	private String NCR;
	private Date AUDIT_RSINPUT_DATE;

	public VendorStatus() {
	}



	public VendorStatus(int rNUM, String vENDOR_ID, String vENDOR_NAME, String pRODUCT_ID, Date aUDIT_PLAN_DATE,
			String aUDIT_KIND_ID, String vENDOR_S_NAME, String vENDOR_S_TEL, String vENDOR_S_EMAIL, String vALIDITY,
			String nCR) {
		super();
		RNUM = rNUM;
		VENDOR_ID = vENDOR_ID;
		VENDOR_NAME = vENDOR_NAME;
		PRODUCT_ID = pRODUCT_ID;
		AUDIT_PLAN_DATE = aUDIT_PLAN_DATE;
		AUDIT_KIND_ID = aUDIT_KIND_ID;
		VENDOR_S_NAME = vENDOR_S_NAME;
		VENDOR_S_TEL = vENDOR_S_TEL;
		VENDOR_S_EMAIL = vENDOR_S_EMAIL;
		VALIDITY = vALIDITY;
		NCR = nCR;
	}



	public int getRNUM() {
		return RNUM;
	}

	public void setRNUM(int rNUM) {
		RNUM = rNUM;
	}

	public String getVENDOR_ID() {
		return VENDOR_ID;
	}

	public void setVENDOR_ID(String vENDOR_ID) {
		VENDOR_ID = vENDOR_ID;
	}

	public String getVENDOR_NAME() {
		return VENDOR_NAME;
	}

	public void setVENDOR_NAME(String vENDOR_NAME) {
		VENDOR_NAME = vENDOR_NAME;
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

	public String getAUDIT_KIND_ID() {
		return AUDIT_KIND_ID;
	}

	public void setAUDIT_KIND_ID(String aUDIT_KIND_ID) {
		AUDIT_KIND_ID = aUDIT_KIND_ID;
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

	public String getVENDOR_S_EMAIL() {
		return VENDOR_S_EMAIL;
	}

	public void setVENDOR_S_EMAIL(String vENDOR_S_EMAIL) {
		VENDOR_S_EMAIL = vENDOR_S_EMAIL;
	}

	public String getVALIDITY() {
		return VALIDITY;
	}

	public void setVALIDITY(String vALIDITY) {
		VALIDITY = vALIDITY;
	}

	public String getNCR() {
		return NCR;
	}

	public void setNCR(String nCR) {
		NCR = nCR;
	}

}
