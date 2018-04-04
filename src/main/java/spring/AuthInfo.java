package spring;

public class AuthInfo {
	private String id,depart, name;

	public AuthInfo(String id, String depart, String name) {
		super();
		this.id = id;
		this.depart = depart;
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDepart() {
		return depart;
	}

	public void setDepart(String depart) {
		this.depart = depart;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	
}
