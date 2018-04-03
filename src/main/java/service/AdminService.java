package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import bean.BeanCategory;
import bean.BeanProduct;

public class AdminService {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int cateCount() {
		return sqlSession.selectOne("adminSQL.cateCount");
	}

	public void uploadCate(String cateName, int cateCount) {
		
		BeanCategory category = new BeanCategory();
		category.setCATEGORY_ID("CATE_"+(cateCount+1));
		category.setCATEGORY_NAME(cateName);
		sqlSession.insert("adminSQL.cateInsert", category);
	}
	
	public List<BeanCategory> cateList(){
		return sqlSession.selectList("adminSQL.cateList");
	}
	
	public int prodCount() {
		return sqlSession.selectOne("adminSQL.prodCount");
	}
	
	public List<BeanProduct> selCateList(String cateId) {
		return sqlSession.selectList("adminSQL.selCateList", cateId);
	}
	
	public void uploadProduct(String cateId, String prodName, int prodCount) {
		BeanProduct product = new BeanProduct();
		product.setCATEGORY_ID(cateId);
		product.setPRODUCT_ID("P_"+(prodCount+1));
		product.setPRODUCT_NAME(prodName);
		sqlSession.insert("adminSQL.prodInsert", product);
	}
	
	public List<BeanProduct> prodList(){
		return sqlSession.selectList("adminSQL.prodList");
	}
	
}
