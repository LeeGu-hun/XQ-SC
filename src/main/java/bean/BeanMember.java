package bean;

public class BeanMember {
	private String MEMBER_ID;
	private String MEMBER_NAME;
	private String MEMBER_DEPART;
	private String MEMBER_PASS;
	private String MEMBER_EMAIL;
	private String MBMBER_VALID;
	
	public BeanMember() {
	
	}

	public BeanMember(String mEMBER_ID, String mEMBER_NAME, String mEMBER_DEPART, String mEMBER_PASS,
			String mEMBER_EMAIL, String mBMBER_VALID) {
		MEMBER_ID = mEMBER_ID;
		MEMBER_NAME = mEMBER_NAME;
		MEMBER_DEPART = mEMBER_DEPART;
		MEMBER_PASS = mEMBER_PASS;
		MEMBER_EMAIL = mEMBER_EMAIL;
		MBMBER_VALID = mBMBER_VALID;
	}

	public String getMEMBER_ID() {
		return MEMBER_ID;
	}

	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}

	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}

	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}

	public String getMEMBER_DEPART() {
		return MEMBER_DEPART;
	}

	public void setMEMBER_DEPART(String mEMBER_DEPART) {
		MEMBER_DEPART = mEMBER_DEPART;
	}

	public String getMEMBER_PASS() {
		return MEMBER_PASS;
	}

	public void setMEMBER_PASS(String mEMBER_PASS) {
		MEMBER_PASS = mEMBER_PASS;
	}

	public String getMEMBER_EMAIL() {
		return MEMBER_EMAIL;
	}

	public void setMEMBER_EMAIL(String mEMBER_EMAIL) {
		MEMBER_EMAIL = mEMBER_EMAIL;
	}

	public String getMBMBER_VALID() {
		return MBMBER_VALID;
	}

	public void setMBMBER_VALID(String mBMBER_VALID) {
		MBMBER_VALID = mBMBER_VALID;
	}
	
}
