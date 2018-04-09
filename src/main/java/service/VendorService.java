package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import bean.BeanCategory;
import bean.BeanProduct;
import bean.BeanVendor;


public class VendorService {

	@Autowired
	private SqlSession sqlSession;
	
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
		sqlSession.insert("vendorSQL.vendorRegister", beanvendor);

	}

	


	
	
	

}
