package bean;

public class BeanProduct {
	
	private String productId;
	private String productName;
	private String productValid;
	
	public BeanProduct() {
	
	}

	public BeanProduct(String productId, String productName, String productValid) {
		this.productId = productId;
		this.productName = productName;
		this.productValid = productValid;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductValid() {
		return productValid;
	}

	public void setProductValid(String productValid) {
		this.productValid = productValid;
	}
	
}
