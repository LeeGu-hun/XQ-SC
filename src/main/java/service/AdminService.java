package service;

import java.text.DecimalFormat;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import bean.BeanCategory;
import bean.BeanChecklist;
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
	
	public void insertMember(BeanMember member) {
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
	
	public BeanMember selMember(String mId) {
		return sqlSession.selectOne("adminSQL.selMember", mId);
	}

	public void updateMember(BeanMember member) {
		sqlSession.update("adminSQL.memberUpdate", member);
	}

	/////////////////////////////////////////Setting////////
	
	public int cateCount() {
		return sqlSession.selectOne("adminSQL.cateCount");
	}

	public void insertCate(BeanCategory category) {
		category.setCATEGORY_ID("C_"+idForm.format(cateCount()+1));
		sqlSession.insert("adminSQL.cateInsert", category);
	}
	
	public List<BeanCategory> cateList(){
		return sqlSession.selectList("adminSQL.cateList");
	}
	
	public BeanCategory selCate(String cateId) {
		return sqlSession.selectOne("adminSQL.selCategory", cateId.trim());
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
	
	/////////////////////////////////////////CHECKLIST////////
	
	public List<BeanChecklist> allCKList() {
		return sqlSession.selectList("adminSQL.allckList");
	}
	
	public BeanChecklist selCkList(String ckId) {
		return sqlSession.selectOne("adminSQL.selCkL", ckId);
	}
	
	public int cklCount() {
		return sqlSession.selectOne("adminSQL.ckLCount");
	}
	
	public void uploadCkList(BeanChecklist ckList) {

		int dM = cklCount();
		
		ckList.setCHECKLIST_ID("ck"+idForm.format(dM+1));
		sqlSession.insert("adminSQL.ckListInsert", ckList);
	}

	public void updateCkList(BeanChecklist ckList) {
		sqlSession.update("adminSQL.ckListUpdate", ckList);
	}
	
	public void changeCkList(BeanChecklist ckList) {
		
	}
	
}
