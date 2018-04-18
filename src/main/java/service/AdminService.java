package service;

import java.text.DecimalFormat;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import bean.AdminCkL;
import bean.AdminMem;
import bean.BeanCategory;
import bean.BeanChecklist;
import bean.BeanMember;
import bean.BeanProduct;
import spring.MemberNotFoundException;

public class AdminService {
	
	@Autowired
	private SqlSession sqlSession;
	
	DecimalFormat idForm = new DecimalFormat("00000");
	
	
	//******************************************************
	
	@Transactional
	public void changePassword(String mId, String oldPwd, String newPwd) {
		BeanMember member = selMember(mId);
		if (member == null)
			throw new MemberNotFoundException();
		member.changePassword(oldPwd, newPwd);
		
		updateMember(member);
	}
	
	
	

	/////////////////////////////////////////Member////////
	
	public List<BeanMember> allMemberList() {
		return sqlSession.selectList("adminSQL.memberList");
	}
	
	public List<BeanMember> ingMemberList() {
		return sqlSession.selectList("adminSQL.ingMemberList");
	}
	
	public List<BeanMember> edMemberList() {
		return sqlSession.selectList("adminSQL.edMemberList");
	}
	
	public int memberCount(String depart) {
		return sqlSession.selectOne("adminSQL.memberCount", depart);
	}
	
	@Transactional
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
	
	public int countMem(AdminMem mem) {
		return sqlSession.selectOne("adminSQL.countMem", mem);
	}

	public List<BeanMember> getMemList(AdminMem mem) {
		return sqlSession.selectList("adminSQL.getMemList", mem);
	}
	
	

	/////////////////////////////////////////Setting////////
	
	public int auditPeriod() {
		return sqlSession.selectOne("adminSQL.auditPeriod");
	}

	public void periodUpdate(int aPeriod) {
		sqlSession.update("adminSQL.periodUpdate", aPeriod);
	}	
	
	
	
	
	public int cateCount() {
		return sqlSession.selectOne("adminSQL.cateCount");
	}

	@Transactional
	public void cateInsert(BeanCategory category) {
		category.setCATEGORY_ID("C_"+idForm.format(cateCount()+1));
		sqlSession.insert("adminSQL.cateInsert", category);
	}
	
	public List<BeanCategory> cateList(){
		return sqlSession.selectList("adminSQL.cateList");
	}
	
	public BeanCategory selCate(String cateId) {
		return sqlSession.selectOne("adminSQL.selCategory", cateId.trim());
	}

	public void cateUpdate(BeanCategory category) {
		sqlSession.update("adminSQL.cateUpdate", category);
	}	
	
	
	
	
	
	public List<BeanProduct> selProdCate(String cateId) {
		return sqlSession.selectList("adminSQL.selProdCate", cateId);
	}
	
	public int prodCount() {
		return sqlSession.selectOne("adminSQL.prodCount");
	}

	public BeanProduct selProd(String prodId) {
		return sqlSession.selectOne("adminSQL.selProduct", prodId.trim());
	}
	
	@Transactional
	public void prodInsert(BeanProduct product) {
		product.setPRODUCT_ID("P_"+idForm.format(prodCount()+1));
		sqlSession.insert("adminSQL.prodInsert", product);
	}
	
	public void prodUpdate(BeanProduct product) {
		sqlSession.update("adminSQL.prodUpdate", product);
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
	
	public int ckLSumRe() {
		return sqlSession.selectOne("adminSQL.ckLSumRe");
	}
	
	public int ckLSumNe() {
		return sqlSession.selectOne("adminSQL.ckLSumNe");
	}
	
	@Transactional
	public void insertCkList(BeanChecklist ckList) {
		ckList.setCHECKLIST_ID("ck"+idForm.format(cklCount()+1));
		sqlSession.insert("adminSQL.ckListInsert", ckList);
	}

	public void updateCkList(BeanChecklist ckList) {
		sqlSession.update("adminSQL.ckListUpdate", ckList);
	}
	
	public int countCkL(AdminCkL ackl) {
		return sqlSession.selectOne("adminSQL.countCkL", ackl);
	}

	public List<BeanChecklist> getCkList(AdminCkL ackl) {
		return sqlSession.selectList("adminSQL.getCkList", ackl);
	}
	
}
