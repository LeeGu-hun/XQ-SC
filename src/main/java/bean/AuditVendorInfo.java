package bean;

import java.sql.Date;

public class AuditVendorInfo {

	private String VENDOR_NAME;
	private String PRODUCT_ID;
	private String VENDOR_ADDRESS;
	private String VENDOR_ISO_FILE;
	private String VENDOR_CERT_FILE;
	private String VENDOR_ID;
	private String VENDOR_VALID;
	private String VENDOR_Q_NAME;
	private String VENDOR_Q_TEL;
	private String VENDOR_Q_EMAIL;
	private String VENDOR_S_TEL;
	private String VENDOR_S_NAME;
	private String VENDOR_S_EMAIL;
	private String AUDIT_RESULT;
	private int VENDOR_EMP_NO;
	private Date VENDOR_REQ_DATE;
	private Date AUDIT_NEXT_DATE;
	
	
	
	public AuditVendorInfo(String vENDOR_NAME, String pRODUCT_ID, String vENDOR_ADDRESS, String vENDOR_ISO_FILE,
			String vENDOR_CERT_FILE, String vENDOR_ID, String vENDOR_VALID, String vENDOR_Q_NAME, String vENDOR_Q_TEL,
			String vENDOR_Q_EMAIL, String vENDOR_S_TEL, String vENDOR_S_NAME, String vENDOR_S_EMAIL,
			String aUDIT_RESULT, int vENDOR_EMP_NO, Date vENDOR_REQ_DATE, Date aUDIT_NEXT_DATE) {
		super();
		VENDOR_NAME = vENDOR_NAME;
		PRODUCT_ID = pRODUCT_ID;
		VENDOR_ADDRESS = vENDOR_ADDRESS;
		VENDOR_ISO_FILE = vENDOR_ISO_FILE;
		VENDOR_CERT_FILE = vENDOR_CERT_FILE;
		VENDOR_ID = vENDOR_ID;
		VENDOR_VALID = vENDOR_VALID;
		VENDOR_Q_NAME = vENDOR_Q_NAME;
		VENDOR_Q_TEL = vENDOR_Q_TEL;
		VENDOR_Q_EMAIL = vENDOR_Q_EMAIL;
		VENDOR_S_TEL = vENDOR_S_TEL;
		VENDOR_S_NAME = vENDOR_S_NAME;
		VENDOR_S_EMAIL = vENDOR_S_EMAIL;
		AUDIT_RESULT = aUDIT_RESULT;
		VENDOR_EMP_NO = vENDOR_EMP_NO;
		VENDOR_REQ_DATE = vENDOR_REQ_DATE;
		AUDIT_NEXT_DATE = aUDIT_NEXT_DATE;
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
	public String getVENDOR_ADDRESS() {
		return VENDOR_ADDRESS;
	}
	public void setVENDOR_ADDRESS(String vENDOR_ADDRESS) {
		VENDOR_ADDRESS = vENDOR_ADDRESS;
	}
	public String getVENDOR_ISO_FILE() {
		return VENDOR_ISO_FILE;
	}
	public void setVENDOR_ISO_FILE(String vENDOR_ISO_FILE) {
		VENDOR_ISO_FILE = vENDOR_ISO_FILE;
	}
	public String getVENDOR_CERT_FILE() {
		return VENDOR_CERT_FILE;
	}
	public void setVENDOR_CERT_FILE(String vENDOR_CERT_FILE) {
		VENDOR_CERT_FILE = vENDOR_CERT_FILE;
	}
	public String getVENDOR_ID() {
		return VENDOR_ID;
	}
	public void setVENDOR_ID(String vENDOR_ID) {
		VENDOR_ID = vENDOR_ID;
	}
	public String getVENDOR_VALID() {
		return VENDOR_VALID;
	}
	public void setVENDOR_VALID(String vENDOR_VALID) {
		VENDOR_VALID = vENDOR_VALID;
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
	public String getVENDOR_S_TEL() {
		return VENDOR_S_TEL;
	}
	public void setVENDOR_S_TEL(String vENDOR_S_TEL) {
		VENDOR_S_TEL = vENDOR_S_TEL;
	}
	public String getVENDOR_S_NAME() {
		return VENDOR_S_NAME;
	}
	public void setVENDOR_S_NAME(String vENDOR_S_NAME) {
		VENDOR_S_NAME = vENDOR_S_NAME;
	}
	public String getVENDOR_S_EMAIL() {
		return VENDOR_S_EMAIL;
	}
	public void setVENDOR_S_EMAIL(String vENDOR_S_EMAIL) {
		VENDOR_S_EMAIL = vENDOR_S_EMAIL;
	}
	public String getAUDIT_RESULT() {
		return AUDIT_RESULT;
	}
	public void setAUDIT_RESULT(String aUDIT_RESULT) {
		AUDIT_RESULT = aUDIT_RESULT;
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
	public Date getAUDIT_NEXT_DATE() {
		return AUDIT_NEXT_DATE;
	}
	public void setAUDIT_NEXT_DATE(Date aUDIT_NEXT_DATE) {
		AUDIT_NEXT_DATE = aUDIT_NEXT_DATE;
	}
	
	

}
