package bean;

public class NcrReplyBean {
	private int ncr_id, reply_id;
	private String reply_date,replier_id,replier_name,reply_description,reply_from;
	public int getNcr_id() {
		return ncr_id;
	}
	public void setNcr_id(int ncr_id) {
		this.ncr_id = ncr_id;
	}
	public int getReply_id() {
		return reply_id;
	}
	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	public String getReplier_id() {
		return replier_id;
	}
	public void setReplier_id(String replier_id) {
		this.replier_id = replier_id;
	}
	public String getReplier_name() {
		return replier_name;
	}
	public void setReplier_name(String replier_name) {
		this.replier_name = replier_name;
	}
	public String getReply_description() {
		return reply_description;
	}
	public void setReply_description(String reply_description) {
		this.reply_description = reply_description;
	}
	public String getReply_from() {
		return reply_from;
	}
	public void setReply_from(String reply_from) {
		this.reply_from = reply_from;
	}
	public NcrReplyBean(int ncr_id, int reply_id, String reply_date, String replier_id, String replier_name,
			String reply_description, String reply_from) {
		super();
		this.ncr_id = ncr_id;
		this.reply_id = reply_id;
		this.reply_date = reply_date;
		this.replier_id = replier_id;
		this.replier_name = replier_name;
		this.reply_description = reply_description;
		this.reply_from = reply_from;
	}
	public NcrReplyBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
