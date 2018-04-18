package service;

import java.text.DecimalFormat;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bean.AuditBean;
import bean.AuditKind;
import bean.AuditProd;
import bean.AuditSubmitBean;
import bean.BeanCategory;
import bean.BeanChecklist;
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

	// regular vendor
	public int regularVencorCount() {
		return sqlSession.selectOne("auditSQL.regularVencorCount");
	}

	// new vendor
	public int newVendorCount() {
		return sqlSession.selectOne("auditSQL.newVendorCount");
	}

	// complete
	public int completeCount() {
		return sqlSession.selectOne("auditSQL.completeCount");
	}

	// *********audit list********//

	// total list
	public List<AuditBean> auditList() {
		List<AuditBean> listBean = sqlSession.selectList("auditSQL.auditAllList");
		return listBean;
	}

	// complete list
	public List<AuditBean> auditComplist() {
		List<AuditBean> listBean = sqlSession.selectList("auditSQL.auditCompleatList");
		return listBean;
	}

	// regular vendor list
	public List<AuditBean> auditReVendor() {
		List<AuditBean> listBean = sqlSession.selectList("auditSQL.auditReVendor");
		return listBean;
	}

	// new Vendor list
	public List<AuditBean> auditNewVendor() {
		List<AuditBean> auditResult = sqlSession.selectList("auditSQL.auditNewVendor");
		return auditResult;
	}

	// 카테고리 리스트
	public List<BeanCategory> cateList() {
		return sqlSession.selectList("auditSQL.cateList");
	}

	// 프로덕트 리스트
	public List<BeanProduct> prodList(String CATEGORY_ID) {
		List<BeanProduct> list = sqlSession.selectList("auditSQL.prodList", CATEGORY_ID);

		return list;

	}
	
	//평가 결과 입력 page 
	public List<AuditBean> auditListReport() {
		List<AuditBean> listResult = sqlSession.selectList("auditSQL.auditListReport");
		return listResult; 
	}
	
	public List<AuditBean> auditResult() {
		List<AuditBean> auditResult = sqlSession.selectList("auditSQL.auditResult");
		return auditResult; 
	}

	// 체크리스트
	public List<CheckListBean> checkList(String AUDIT_KIND_ID) {
		List<CheckListBean> list = sqlSession.selectList("auditSQL.checkList", AUDIT_KIND_ID);
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
	
	public void updateAuditId(AuditSubmitBean auditId) {

		int ai = auditId();
		
		auditId.setAUDIT_ID("A"+idForm.format(ai+1));
		sqlSession.insert("adminSQL.ckListInsert", auditId);
	}
	
	//audit score update 
	public void updateScore(AuditBean ab) {
		sqlSession.update("auditSQL.updateScore", ab);
		System.out.println("service까진 오나여?");
	}
	
	//audit plan insert 
	public void planInsert(AuditBean ab) {
		sqlSession.insert("auditSQL.newAuditPlan", ab);
		
	}
	
	public List<AuditBean> name() {
		return sqlSession.selectOne("auditSQL.name");
	}
	
	

}
