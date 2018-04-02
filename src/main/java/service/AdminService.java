package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import bean.BeanCategory;

public class AdminService {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int cateCount() {
		return sqlSession.selectOne("adminSQL.cateCount");
	}

	public void uploadCate(String cateName, int cateCount) {
		
		BeanCategory category = new BeanCategory();
		category.setCategoryId("CATE_"+cateCount);
		category.setCategoryName(cateName);
		sqlSession.insert("adminSQL.cateInsert", category);
	}
	
	public List<BeanCategory> cateList(){
		return sqlSession.selectList("adminSQL.cateList");
	}
	
}
