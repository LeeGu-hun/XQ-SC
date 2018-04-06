package service;

import java.text.DecimalFormat;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import bean.BeanCategory;
import bean.BeanMember;
import bean.BeanProduct;

public class AdminService {
	
	@Autowired
	private SqlSession sqlSession;
	
	DecimalFormat idForm = new DecimalFormat("00000");
	
	

	/////////////////////////////////////////Member////////
	
	public List<BeanMember> allMemberList() {
		return sqlSession.selectList("adminSQL.memberList");
	}
	
	public int memberCount(String depart) {
		return sqlSession.selectOne("adminSQL.memberCount", depart);
	}
	
	public void uploadMember(BeanMember member) {
		String depart = member.getMEMBER_DEPART().trim();
		int dM = memberCount(depart);
		
		if(depart.equals("ADMIN")) {
			member.setMEMBER_ID("A"+idForm.format(dM+1));
		}else if(depart.equals("QUALITY")) {
			member.setMEMBER_ID("Q"+idForm.format(dM+1));
		}else if(depart.equals("PURCHASE")) {
			member.setMEMBER_ID("P"+idForm.format(dM+1));
		}else {
			member.setMEMBER_ID("V"+idForm.format(dM+1));
		}

		sqlSession.insert("adminSQL.memberInsert", member);
	}

	/////////////////////////////////////////Setting////////
	
	public int cateCount() {
		return sqlSession.selectOne("adminSQL.cateCount");
	}

	public void uploadCate(String cateName, int cateCount) {
		
		BeanCategory category = new BeanCategory();
		category.setCATEGORY_ID("C_"+idForm.format(cateCount+1));
		category.setCATEGORY_NAME(cateName);
		
		System.out.println(category.getCATEGORY_ID());
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
		product.setPRODUCT_ID("P_"+idForm.format(prodCount+1));
		product.setPRODUCT_NAME(prodName);
		sqlSession.insert("adminSQL.prodInsert", product);
	}
	
	public List<BeanProduct> prodList(){
		return sqlSession.selectList("adminSQL.prodList");
	}
	
	
	/////////////////////////////////////////
	
}
