package bean;

public class BeanCategory {
	
	private String CATEGORY_ID;
	private String CATEGORY_NAME;
	private String PRODUCT_VALID;
	
	public BeanCategory() {
	
	}

	public BeanCategory(String cATEGORY_ID, String cATEGORY_NAME, String pRODUCT_VALID) {
		CATEGORY_ID = cATEGORY_ID;
		CATEGORY_NAME = cATEGORY_NAME;
		PRODUCT_VALID = pRODUCT_VALID;
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

	public String getPRODUCT_VALID() {
		return PRODUCT_VALID;
	}

	public void setPRODUCT_VALID(String pRODUCT_VALID) {
		PRODUCT_VALID = pRODUCT_VALID;
	}
	
}
