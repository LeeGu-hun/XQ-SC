package bean;

public class BeanProduct {
	
	private String CATEGORY_ID;
	private String PRODUCT_ID;
	private String PRODUCT_NAME;
	private String PRODUCT_VALID;
	
	public BeanProduct() {
	
	}

	public BeanProduct(String pRODUCT_ID, String pRODUCT_NAME, String pRODUCT_VALID) {
		PRODUCT_ID = pRODUCT_ID;
		PRODUCT_NAME = pRODUCT_NAME;
		PRODUCT_VALID = pRODUCT_VALID;
	}

	public String getCATEGORY_ID() {
		return CATEGORY_ID;
	}

	public void setCATEGORY_ID(String cATEGORY_ID) {
		CATEGORY_ID = cATEGORY_ID;
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

	public String getPRODUCT_VALID() {
		return PRODUCT_VALID;
	}

	public void setPRODUCT_VALID(String pRODUCT_VALID) {
		PRODUCT_VALID = pRODUCT_VALID;
	}

}
