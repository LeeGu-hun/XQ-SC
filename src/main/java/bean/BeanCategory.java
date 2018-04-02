package bean;

public class BeanCategory {
	
	private String categoryId;
	private String categoryName;
	private String categoryValid;
	
	public BeanCategory() {
	
	}

	public BeanCategory(String categoryId, String categoryName, String categoryValid) {
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.categoryValid = categoryValid;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryValid() {
		return categoryValid;
	}

	public void setCategoryValid(String categoryValid) {
		this.categoryValid = categoryValid;
	}
	
}
