package bean;

public class AdminMem {
	private int start, end;
	private String mDepart, mValid;
	
	public AdminMem(int start, int end, String mDepart, String mValid) {
		this.start = start;
		this.end = end;
		this.mDepart = mDepart;
		this.mValid = mValid;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getmDepart() {
		return mDepart;
	}
	public void setmDepart(String mDepart) {
		this.mDepart = mDepart;
	}
	public String getmValid() {
		return mValid;
	}
	public void setmValid(String mValid) {
		this.mValid = mValid;
	}
}
