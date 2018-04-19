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
import bean.NcrCount;
import bean.VendorStatus;
import bean.VendorValid;





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

	public List<BeanVendor> getVendorList(String vendor_name) {
		
		List<BeanVendor> vendorlist = sqlSession.selectList("ncrSQL.getVendorList",vendor_name);	
		return vendorlist;
	}
	public List<BeanProduct> productList() {
		List<BeanProduct> list = sqlSession.selectList("vendorSQL.productList");
		return list;
	}


	
	public List<NcrCount> ncrCount() {
		List<NcrCount> lists = sqlSession.selectList("vendorSQL.ncrCount");
		return lists;
	}
	public List<VendorValid> getValid() {
		List<VendorValid> result = sqlSession.selectList("vendorSQL.getValid");
		return result;
	}
	
	
	
	public List<VendorStatus> vendorStatusList(ListCommand listCommand) {
		List<VendorStatus> results = sqlSession.selectList("vendorSQL.getStatusList", listCommand);
		return results;
	}
	}
	
	
	

	


	
	
	


