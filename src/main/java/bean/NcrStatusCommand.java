package bean;

public class NcrStatusCommand {
 private String vendor_id, issuer_id,ncr_comp;

public String getVendor_id() {
	return vendor_id;
}

public void setVendor_id(String vendor_id) {
	this.vendor_id = vendor_id;
}

public String getIssuer_id() {
	return issuer_id;
}

public void setIssuer_id(String issuer_id) {
	this.issuer_id = issuer_id;
}

public String getNcr_comp() {
	return ncr_comp;
}

public void setNcr_comp(String ncr_comp) {
	this.ncr_comp = ncr_comp;
}

public NcrStatusCommand(String vendor_id, String issuer_id, String ncr_comp) {
	super();
	this.vendor_id = vendor_id;
	this.issuer_id = issuer_id;
	this.ncr_comp = ncr_comp;
}

public NcrStatusCommand() {
	super();
	// TODO Auto-generated constructor stub
}
 
 
}
