package bean;

public class AuditProd {
	
	private String PRODUCT_NAME;
	
	public AuditProd() {
		super();
	}

	public AuditProd(String pRODUCT_NAME) {
		super();
		PRODUCT_NAME = pRODUCT_NAME;
	}

	public String getPRODUCT_NAME() {
		return PRODUCT_NAME;
	}

	public void setPRODUCT_NAME(String pRODUCT_NAME) {
		PRODUCT_NAME = pRODUCT_NAME;
	} 
	
	

}
