package bean;

public class LoginCommand {
	private String id, password;
	private boolean rememberid;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isRememberid() {
		return rememberid;
	}
	public void setRememberid(boolean rememberid) {
		this.rememberid = rememberid;
	}
	
	
	
}
