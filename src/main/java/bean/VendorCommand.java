package bean;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class VendorCommand {
	private String VENDOR_NAME,VENDOR_ADDRESS,PRODUCT_ID,VENDOR_Q_NAME,VENDOR_Q_TEL,
	VENDOR_Q_EMAIL,VENDOR_S_NAME,VENDOR_S_TEL,VENDOR_S_EMAIL;
	private int VENDOR_EMP_NO;
	private Date VENDOR_REQ_DATE;
	private MultipartFile VENDOR_ISO_FILE,VENDOR_CERT_FILE;


	public VendorCommand(String vENDOR_NAME, String vENDOR_ADDRESS, String pRODUCT_ID, String vENDOR_Q_NAME,
			String vENDOR_Q_TEL, String vENDOR_Q_EMAIL, String vENDOR_S_NAME, String vENDOR_S_TEL,
			String vENDOR_S_EMAIL, int vENDOR_EMP_NO, Date vENDOR_REQ_DATE, MultipartFile vENDOR_ISO_FILE,
			MultipartFile vENDOR_CERT_FILE) {
		super();
		VENDOR_NAME = vENDOR_NAME;
		VENDOR_ADDRESS = vENDOR_ADDRESS;
		PRODUCT_ID = pRODUCT_ID;
		VENDOR_Q_NAME = vENDOR_Q_NAME;
		VENDOR_Q_TEL = vENDOR_Q_TEL;
		VENDOR_Q_EMAIL = vENDOR_Q_EMAIL;
		VENDOR_S_NAME = vENDOR_S_NAME;
		VENDOR_S_TEL = vENDOR_S_TEL;
		VENDOR_S_EMAIL = vENDOR_S_EMAIL;
		VENDOR_EMP_NO = vENDOR_EMP_NO;
		VENDOR_REQ_DATE = vENDOR_REQ_DATE;
		VENDOR_ISO_FILE = vENDOR_ISO_FILE;
		VENDOR_CERT_FILE = vENDOR_CERT_FILE;
	}

	public VendorCommand() {}

	public String getVENDOR_NAME() {
		return VENDOR_NAME;
	}

	public void setVENDOR_NAME(String vENDOR_NAME) {
		VENDOR_NAME = vENDOR_NAME;
	}

	public String getVENDOR_ADDRESS() {
		return VENDOR_ADDRESS;
	}

	public void setVENDOR_ADDRESS(String vENDOR_ADDRESS) {
		VENDOR_ADDRESS = vENDOR_ADDRESS;
	}

	public String getPRODUCT_ID() {
		return PRODUCT_ID;
	}

	public void setPRODUCT_ID(String pRODUCT_ID) {
		PRODUCT_ID = pRODUCT_ID;
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

	public int getVENDOR_EMP_NO() {
		return VENDOR_EMP_NO;
	}

	public void setVENDOR_EMP_NO(int vENDOR_EMP_NO) {
		VENDOR_EMP_NO = vENDOR_EMP_NO;
	}

	public Date getVENDOR_REQ_DATE() {
		return VENDOR_REQ_DATE;
	}

	public void setVENDOR_REQ_DATE(Date vENDOR_REQ_DATE) {
		VENDOR_REQ_DATE = vENDOR_REQ_DATE;
	}

	public MultipartFile getVENDOR_ISO_FILE() {
		return VENDOR_ISO_FILE;
	}

	public void setVENDOR_ISO_FILE(MultipartFile vENDOR_ISO_FILE) {
		VENDOR_ISO_FILE = vENDOR_ISO_FILE;
	}

	public MultipartFile getVENDOR_CERT_FILE() {
		return VENDOR_CERT_FILE;
	}

	public void setVENDOR_CERT_FILE(MultipartFile vENDOR_CERT_FILE) {
		VENDOR_CERT_FILE = vENDOR_CERT_FILE;
	}
	
	

	
	
	
	
}
