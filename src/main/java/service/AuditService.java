package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bean.AuditBean;
import bean.AuditProd;
import bean.BeanCategory;
import bean.BeanProduct;

@Service
public class AuditService {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<AuditBean> auditList() {
		List<AuditBean> listBean = sqlSession.selectList("auditSQL.auditList");
		return listBean;
	}
	
	public List<AuditBean> auditListReport() {
		List<AuditBean> listResult = sqlSession.selectList("auditSQL.auditListReport");
		return listResult; 
	}
	public List<AuditBean> auditResult() {
		List<AuditBean> auditResult = sqlSession.selectList("auditSQL.auditResult");
		return auditResult; 
	}

	//카테고리 리스트
	public List<BeanCategory> cateList() {
		return sqlSession.selectList("auditSQL.cateList");
	}
	
	//프로덕트 리스트
	public List<BeanProduct> prodList(String CATEGORY_ID) {
		List<BeanProduct> list = sqlSession.selectList("auditSQL.prodList",CATEGORY_ID);
		return list;
		
	}
	
	//아이디 선택시 해당사항 보여줌
	public List<AuditBean> auditSelectId(String AUDIT_ID) {
		List<AuditBean> auditSelectId = sqlSession.selectList("auditSQL.selectAuditID",AUDIT_ID);
		return auditSelectId; 
	}
	
	
	public int auditCount() {
		return sqlSession.selectOne("auditSQL.selectCount");
	}
	
	public int auditCountNotYet() {
		return sqlSession.selectOne("auditSQL.selCountNotYet");
	}
	
	public int auditCountConfirm() {
		return sqlSession.selectOne("auditSQL.selCountConfirm");
	}
	

}
