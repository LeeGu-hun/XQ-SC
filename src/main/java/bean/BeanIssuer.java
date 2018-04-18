package bean;

public class BeanIssuer {
	
	String issuer_id ,issuer_name;

	public String getIssuer_id() {
		return issuer_id;
	}

	public void setIssuer_id(String issuer_id) {
		this.issuer_id = issuer_id;
	}

	public String getIssuer_name() {
		return issuer_name;
	}

	public void setIssuer_name(String issuer_name) {
		this.issuer_name = issuer_name;
	}

	public BeanIssuer(String issuer_id, String issuer_name) {
		super();
		this.issuer_id = issuer_id;
		this.issuer_name = issuer_name;
	}

	public BeanIssuer() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
