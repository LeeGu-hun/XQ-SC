package service;

import java.text.DecimalFormat;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bean.AuditBean;
import bean.AuditKind;
import bean.AuditProd;
import bean.AuditResultSearch;
import bean.AuditSubmitBean;
import bean.BeanCategory;
import bean.BeanChecklist;
import bean.BeanIssuer;
import bean.BeanMember;
import bean.BeanProduct;
import bean.CheckListBean;

@Service
public class AuditService {

	@Autowired
	private SqlSession sqlSession;
	
	DecimalFormat idForm = new DecimalFormat("00000");

	// ***audit count***//

	// all count
	public int allCount() {
		return sqlSession.selectOne("auditSQL.allCount");
	}

	// *********************audit list***********//

	// total list
	public List<AuditBean> auditList() {
		List<AuditBean> listBean = sqlSession.selectList("auditSQL.auditAllList");
		return listBean;
	}

	// cate list 
	public List<BeanCategory> cateList() {
		return sqlSession.selectList("auditSQL.cateList");
	}

	// prod list
	public List<BeanProduct> prodList(String CATEGORY_ID) {
		List<BeanProduct> list = sqlSession.selectList("auditSQL.prodList", CATEGORY_ID);
		return list;

	}
	
	// audit status 
	public List<AuditBean> auditListReport() {
		List<AuditBean> listResult = sqlSession.selectList("auditSQL.auditListReport");
		return listResult; 
	}
	
	public List<AuditBean> auditResult() {
		List<AuditBean> auditResult = sqlSession.selectList("auditSQL.auditResult");
		return auditResult; 
	}

	// checkList - RE
	public List<CheckListBean> checkListRe() {
		List<CheckListBean> list = sqlSession.selectList("auditSQL.checkListRE");
		return list;
	}
	//checkList - Ne
	public List<CheckListBean> checkListNe() {
		List<CheckListBean> list = sqlSession.selectList("auditSQL.checkListNE");
		return list;
	}

	// audit Type List
	public List<AuditKind> typeList() {
		return sqlSession.selectList("auditSQL.auditType");
	}
	
	//audit Id Get 
	public int auditId() {
		return sqlSession.selectOne("auditSQL.auditId");
	}

	//audit plan insert + id insert
	public String idInsert(AuditBean ab) {
		String id = "A"+idForm.format(auditId()+1);
		ab.setAUDIT_ID(id);
		sqlSession.insert("auditSQL.newAuditPlan", ab);
		return id;
	}
	
	//audit score update 
	public void updateScore(AuditBean ab) {
		sqlSession.update("auditSQL.updateScore", ab);
				}
	
	//auditor list 
	public List<BeanMember> getAuditorList(String MEMBER_NAME) {	
		List<BeanMember> aidotorList = sqlSession.selectList("auditSQL.getAuditorList",MEMBER_NAME);	
		return aidotorList;
	}
	
	public List<CheckListBean> getEachCheckScore(String AUDIT_ID) {
		List<CheckListBean> checkResult = sqlSession.selectList("auditSQL.getCheakResult",AUDIT_ID);
		return checkResult;
	}
	
	public int resultId() {
		return sqlSession.selectOne("auditSQL.resultCount");
	}
	
	public void getCheckResult(AuditSubmitBean audit) {
		String id = "R"+idForm.format(resultId()+1);
		audit.setAUDIT_RESULT_ID(id);
		sqlSession.selectList("auditSQL.checkResult",audit);	
	}
	
	public List<AuditResultSearch> getSearch(AuditResultSearch ars) {
		return sqlSession.selectList("auditSQL.serchList",ars);
	}
 
	public List<AuditBean> name() {
		return sqlSession.selectOne("auditSQL.name");
	}
	


}
