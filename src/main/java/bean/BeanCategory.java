package bean;

public class BeanCategory {
	
	private String CATEGORY_ID;
	private String CATEGORY_NAME;
	private String CATEGORY_VALID;
	
	public BeanCategory() {
	
	}

	public BeanCategory(String cATEGORY_ID, String cATEGORY_NAME, String cATEGORY_VALID) {
		super();
		CATEGORY_ID = cATEGORY_ID;
		CATEGORY_NAME = cATEGORY_NAME;
		CATEGORY_VALID = cATEGORY_VALID;
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

	public String getCATEGORY_VALID() {
		return CATEGORY_VALID;
	}

	public void setCATEGORY_VALID(String cATEGORY_VALID) {
		CATEGORY_VALID = cATEGORY_VALID;
	}
}
