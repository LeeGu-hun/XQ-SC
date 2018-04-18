package bean;



public class NcrReplyCommand {
	private String ncr_id,replier_id,reply_description;
	public NcrReplyCommand(String ncr_id, String replier_id, String reply_description) {
		super();
		this.ncr_id = ncr_id;
		this.replier_id = replier_id;
		this.reply_description = reply_description;
	}
	

	public NcrReplyCommand() {
		super();
		// TODO Auto-generated constructor stub
	}


	public String getNcr_id() {
		return ncr_id;
	}

	public void setNcr_id(String ncr_id) {
		this.ncr_id = ncr_id;
	}

	public String getReplier_id() {
		return replier_id;
	}

	public void setReplier_id(String replier_id) {
		this.replier_id = replier_id;
	}

	public String getReply_description() {
		return reply_description;
	}

	public void setReply_description(String reply_description) {
		this.reply_description = reply_description;
	}
	
	
}
