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

	// regular vendor
	public int regularVencorCount() {
		return sqlSession.selectOne("auditSQL.regularVencorCount");
	}

	// new vendor
	public int newVendorCount() {
		return sqlSession.selectOne("auditSQL.newVendorCount");
	}

	// *********audit list********//

	// total list
	public List<AuditBean> auditList() {
		List<AuditBean> listBean = sqlSession.selectList("auditSQL.auditAllList");
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

	// 移댄뀒怨좊━ 由ъ뒪�듃
	public List<BeanCategory> cateList() {
		return sqlSession.selectList("auditSQL.cateList");
	}

	// �봽濡쒕뜒�듃 由ъ뒪�듃
	public List<BeanProduct> prodList(String CATEGORY_ID) {
		List<BeanProduct> list = sqlSession.selectList("auditSQL.prodList", CATEGORY_ID);

		return list;

	}
	
	//�룊媛� 寃곌낵 �엯�젰 page 
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
	


	public String idInsert(AuditBean ab) {
		String id = "A"+idForm.format(auditId()+1);
		ab.setAUDIT_ID(id);
		sqlSession.insert("auditSQL.newAuditPlan", ab);
		return id;
	}
	
	//audit score update 
	public void updateScore(AuditBean ab) {
		sqlSession.update("auditSQL.updateScore", ab);
		System.out.println("service源뚯쭊 �삤�굹�뿬?");
	}
	
	//audit plan insert 
	public void planInsert(AuditBean ab) {
		sqlSession.insert("auditSQL.newAuditPlan", ab);
		
	}
	
	//auditor list 
	public List<BeanMember> getAuditorList(String MEMBER_NAME) {	
		List<BeanMember> aidotorList = sqlSession.selectList("auditSQL.getAuditorList",MEMBER_NAME);	
		return aidotorList;
	}
 
	

	
	public List<AuditBean> name() {
		return sqlSession.selectOne("auditSQL.name");
	}
	
	public void plan(AuditBean ab) {
		sqlSession.insert("auditSQL.newPlan", ab);
	}
	
	

}
