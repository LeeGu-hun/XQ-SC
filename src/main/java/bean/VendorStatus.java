package bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class VendorStatus {
	private int RNUM;
	private String VENDOR_ID;
	private String VENDOR_NAME;
	private String CATEGORY_ID;
	private String CATEGORY_NAME;
	private String PRODUCT_ID;
	private String PRODUCT_NAME;
	private String AUDIT_KIND_ID;
	private String VENDOR_Q_NAME;
	private String VENDOR_Q_TEL;
	private String VENDOR_Q_EMAIL;
	private String VALID;
	private String NCR;
	

	public VendorStatus() {
		
	}

	public VendorStatus(int rNUM, String vENDOR_ID, String vENDOR_NAME, String cATEGORY_ID, String cATEGORY_NAME,
			String pRODUCT_ID, String pRODUCT_NAME, String aUDIT_KIND_ID, String vENDOR_Q_NAME, String vENDOR_Q_TEL,
			String vENDOR_Q_EMAIL, String vALID, String nCR) {
		super();
		RNUM = rNUM;
		VENDOR_ID = vENDOR_ID;
		VENDOR_NAME = vENDOR_NAME;
		CATEGORY_ID = cATEGORY_ID;
		CATEGORY_NAME = cATEGORY_NAME;
		PRODUCT_ID = pRODUCT_ID;
		PRODUCT_NAME = pRODUCT_NAME;
		AUDIT_KIND_ID = aUDIT_KIND_ID;
		VENDOR_Q_NAME = vENDOR_Q_NAME;
		VENDOR_Q_TEL = vENDOR_Q_TEL;
		VENDOR_Q_EMAIL = vENDOR_Q_EMAIL;
		VALID = vALID;
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


	public String getCATEGORY_ID() {
		return CATEGORY_ID;
	}


	public void setCATEGORY_ID(String cATEGORY_ID) {
		CATEGORY_ID = cATEGORY_ID;
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


	public String getPRODUCT_NAME() {
		return PRODUCT_NAME;
	}


	public void setPRODUCT_NAME(String pRODUCT_NAME) {
		PRODUCT_NAME = pRODUCT_NAME;
	}


	public String getAUDIT_KIND_ID() {
		return AUDIT_KIND_ID;
	}


	public void setAUDIT_KIND_ID(String aUDIT_KIND_ID) {
		AUDIT_KIND_ID = aUDIT_KIND_ID;
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


	public String getVENDOR_Q_EMAIL() {
		return VENDOR_Q_EMAIL;
	}


	public void setVENDOR_Q_EMAIL(String vENDOR_Q_EMAIL) {
		VENDOR_Q_EMAIL = vENDOR_Q_EMAIL;
	}


	public String getVALID() {
		return VALID;
	}


	public void setVALID(String vALID) {
		VALID = vALID;
	}


	public String getNCR() {
		return NCR;
	}


	public void setNCR(String nCR) {
		NCR = nCR;
	}


}
