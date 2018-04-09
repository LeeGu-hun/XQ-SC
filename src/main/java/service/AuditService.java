package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bean.AuditBean;
import bean.AuditProd;

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

	
	public int auditCount() {
		return sqlSession.selectOne("auditSQL.selectCount");
	}
	
	public int auditCountNotYet() {
		return sqlSession.selectOne("auditSQL.selCountNotYet");
	}
	
	public int auditCountConfirm() {
		return sqlSession.selectOne("auditSQL.selCountConfirm");
	}
	
	public List<AuditBean> selCate() {
		List<AuditBean> selCate = sqlSession.selectList("auditSQL.selCate");
		return selCate;
	}
	
	public List<AuditProd> selProd() {
		List<AuditProd> selProd = sqlSession.selectList("auditSQL.selProd");
		return selProd;
		
	}
	
	


}
