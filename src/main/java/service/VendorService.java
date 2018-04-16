package service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import bean.BeanCategory;
import bean.BeanProduct;
import bean.BeanVendor;
import bean.ListCommand;
import bean.VendorStatus;





public class VendorService {

	@Autowired
	private SqlSession sqlSession;
	
	
	
	/*   vendor등록   */
	public List<BeanVendor> registerList() {
		List<BeanVendor> list = sqlSession.selectList("vendorSQL.registerList");
		return list;
	}
	
	public int registerCount() {
		return sqlSession.selectOne("vendorSQL.registerCount");
	}
	
	public BeanVendor vendorView(String VENDOR_ID) {
		BeanVendor vendor = sqlSession.selectOne("vendorSQL.vendordView", VENDOR_ID);
		return vendor;
	}
	public BeanVendor vendorUpdate(String VENDOR_ID) {	
		BeanVendor vendor = sqlSession.selectOne("vendorSQL.vendorUpdate", VENDOR_ID);
		return vendor;
	}
	public BeanVendor vendorDelete(String VENDOR_ID) {	
		BeanVendor vendor = sqlSession.selectOne("vendorSQL.vendorDelete", VENDOR_ID);
		return vendor;
	}
	
	
	
	/*   vendor를 member등록   */
	
	public void vendorMemRegister(BeanVendor beanvendor) {
		 sqlSession.insert("vendorSQL.vendorMemRegister", beanvendor);
	}
	
	/*   newVendor등록   */
	public int vendorCount() {
		return sqlSession.selectOne("vendorSQL.vendorCount");
	}
	
	public List<BeanCategory> cateList() {
		return sqlSession.selectList("vendorSQL.cateList");
	}
	
	public List<BeanProduct> prodList(String CATEGORY_ID) {
		List<BeanProduct> list = sqlSession.selectList("vendorSQL.prodList",CATEGORY_ID);
		return list;
		
	}
	
	public void vendorRegister(BeanVendor beanvendor) {
		 sqlSession.insert("vendorSQL.newVendorRegister", beanvendor);
	}
	
	
	/*   vendor현황   */
	public List<BeanVendor> vendorList() {
		List<BeanVendor> list = sqlSession.selectList("vendorSQL.vendorList");
		return list;
	}
	
	public List<VendorStatus> vendorStatusList(ListCommand listCommand) {
		
		Date from = listCommand.getFrom();
		Date to = listCommand.getTo();
		SimpleDateFormat dt = 
				new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); 
		Calendar cal = Calendar.getInstance();
		int year, month, day;
		String from_s="", to_s="";
		
		Date fromWord = (from == null)?new Date():from;
		cal.setTime(fromWord);
		year = cal.get(cal.YEAR);
		month = cal.get(cal.MONTH) + 1 ;
		day= (from == null)?1:cal.get(cal.DATE);
		from_s = year+"-"+month+"-"+day+" 00:00:00.0";

		Date toWord = (to == null)?new Date():to;
		cal.setTime(toWord);
		year = cal.get (cal.YEAR);
		month = cal.get (cal.MONTH) + 1 ;
		day= cal.get(cal.DATE);
		to_s = year+"-"+month+"-"+day+" 23:59:59.0";
		
		try { 
			from = dt.parse(from_s);
			to = dt.parse(to_s);
		} catch (ParseException e) { } 
		listCommand.setFrom(from);
		listCommand.setTo(to);
		
		List<VendorStatus> results = sqlSession.selectList("vendorSQL.getStatusList");
	
		return results;
	}
	
	
	

	


	
	
	

}
