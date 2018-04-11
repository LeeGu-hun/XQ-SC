package bean;

public class BeanNcrAttach {
	private String ncr_id;
	private int file_num;
    private String o_name;
    private String file_name;
    private long file_size;
	public String getNcr_id() {
		return ncr_id;
	}
	public void setNcr_id(String ncr_id) {
		this.ncr_id = ncr_id;
	}
	public int getFile_num() {
		return file_num;
	}
	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public long getFile_size() {
		return file_size;
	}
	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}
	public BeanNcrAttach() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BeanNcrAttach(String ncr_id, int file_num, String o_name, String file_name, long file_size) {
		super();
		this.ncr_id = ncr_id;
		this.file_num = file_num;
		this.o_name = o_name;
		this.file_name = file_name;
		this.file_size = file_size;
	}


}
