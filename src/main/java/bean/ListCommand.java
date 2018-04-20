package bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ListCommand {
	
	private String VENDOR_ID;
	private String VENDOR_NAME;
	private String CATEGORY_ID;
	private String CATEGORY_NAME;
	private String PRODUCT_ID;
	private String PRODUCT_NAME;
	private String VALID;
	private String NCR;
	
	
	public ListCommand() {}


	public ListCommand(String vENDOR_ID, String vENDOR_NAME, String cATEGORY_ID, String cATEGORY_NAME,
			String pRODUCT_ID, String pRODUCT_NAME, String vALID, String nCR) {
		super();
		VENDOR_ID = vENDOR_ID;
		VENDOR_NAME = vENDOR_NAME;
		CATEGORY_ID = cATEGORY_ID;
		CATEGORY_NAME = cATEGORY_NAME;
		PRODUCT_ID = pRODUCT_ID;
		PRODUCT_NAME = pRODUCT_NAME;
		VALID = vALID;
		NCR = nCR;
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

