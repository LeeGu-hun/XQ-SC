package service;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bean.AuditBean;
import bean.AuditKind;
import bean.AuditNcrBean;
import bean.AuditResultSearch;
import bean.AuditSubmitBean;
import bean.AuditVendorInfo;
import bean.BeanCategory;
import bean.BeanChecklist;
import bean.BeanIssuer;
import bean.BeanMember;
import bean.BeanProduct;
import bean.BeanVendor;
import bean.CheckListBean;
import bean.DateCommand;

@Service
public class AuditService {
	@Autowired
	private SqlSession sqlSession;
	DecimalFormat idForm = new DecimalFormat("00000");

	// *********************audit Manage Page***********//

	// audit all count
	public int allCount() {
		return sqlSession.selectOne("auditSQL.allCount");
	}
	
	public int ncrCount(String id) {
		return sqlSession.selectOne("auditSQL.ncrCount",id);
	}
	
	public int ncrCountComp(String id) {
		return sqlSession.selectOne("auditSQL.ncrCountComp",id);
	}
	
	public int cutLineScore() {
		return sqlSession.selectOne("auditSQL.cutline");
	}

	// audit list
	public List<AuditBean> auditList() {
		List<AuditBean> listBean = sqlSession.selectList("auditSQL.auditAllList");
		return listBean;
	}
	
	public List<AuditVendorInfo> vendorInfo(String vendorId) {
		List <AuditVendorInfo> vendorInfo = sqlSession.selectList("auditSQL.vendorInfo", vendorId);
		return vendorInfo;
	}

	// *********** audit report page ***********//

	// report page : audit status
	public List<AuditBean> auditListReport(DateCommand dc) {
		List<AuditBean> listResult = sqlSession.selectList("auditSQL.auditListReport", dc);
		return listResult;
	}

	// checkList - RE
	public List<CheckListBean> checkListRe() {
		List<CheckListBean> list = sqlSession.selectList("auditSQL.checkListRE");
		return list;
	}

	// checkList - Ne
	public List<CheckListBean> checkListNe() {
		List<CheckListBean> list = sqlSession.selectList("auditSQL.checkListNE");
		return list;
	}

	// manage page : audit plan insert + id insert
	public void idInsert(AuditBean ab) {
		sqlSession.update("auditSQL.newAuditPlan", ab);
	}

	// report page : next Plan Update (period = 2 years)
	public void nextPlanUpdate(AuditBean bean) {
		sqlSession.update("auditSQL.nextDate", bean);
	}

	// report page : if audit fail vendor sql
	public void auditFalse(AuditBean bean) {
		sqlSession.update("auditSQL.nextDateFalse", bean);
	}
	
	public void resultFalse(AuditResultSearch bean) {
		sqlSession.update("auditSQL.resultFalse", bean);
	}


	// report : audit score update
	public void updateScore(AuditBean ab) {
		sqlSession.update("auditSQL.updateScore", ab);
	}

	// auditor list
	public List<AuditBean> getAuditorList(String auditor_name) {
		List<AuditBean> auditorList = sqlSession.selectList("auditSQL.getAuditorList", auditor_name);
		return auditorList;
	}

	// report page get * audit result* Id
	public int resultId() {
		return sqlSession.selectOne("auditSQL.resultCount");
	}

	// report page : check list *result* insert
	public void getCheckResult(AuditSubmitBean audit) {
		String id = "R" + idForm.format(resultId() + 1);
		audit.setAUDIT_RESULT_ID(id);
		sqlSession.selectList("auditSQL.checkResult", audit);
	}
	
	public int auditId() {
		return sqlSession.selectOne("auditSQL.auditId");
	}
	
	//if pass audit vendor 
	public void regulerVendorRegister(BeanVendor beanvendor) {
		String id = "S" + idForm.format(auditId()+1);
		beanvendor.setAUDIT_ID(id);
		sqlSession.selectList("auditSQL.vendorRegisterRe", beanvendor);
	}

	// ************* result page ************//

	// result each score
	public List<CheckListBean> getEachCheckScore(String id) {
		List<CheckListBean> checkResult = sqlSession.selectList("auditSQL.getCheakResult", id);
		return checkResult;
	}

	// result page get Date
	public List<AuditBean> getDate(String id) {
		List<AuditBean> date = sqlSession.selectList("auditSQL.getDate", id);
		return date;
	}


	public List<AuditResultSearch> getSearch(AuditResultSearch search) {
		return sqlSession.selectList("auditSQL.resultSearch", search);
	}

	public List<AuditBean> name() {
		return sqlSession.selectOne("auditSQL.name");
	}

	// Result Page Plan Date Search
	public List<AuditBean> getAll(DateCommand dateCommand) {
		List<AuditBean> results = sqlSession.selectList("auditSQL.all", dateCommand);
		return results;
	}
	
	public List<AuditBean> incomplete(DateCommand dateCommand) {
		List<AuditBean> results = sqlSession.selectList("auditSQL.incomplete", dateCommand);
		return results;
	}
	
	public List<AuditBean> getPassed(DateCommand dateCommand) {
		List<AuditBean> results = sqlSession.selectList("auditSQL.pass", dateCommand);
		return results;
	}
	
	public List<AuditBean> getNotPassed(DateCommand dateCommand) {
		List<AuditBean> results = sqlSession.selectList("auditSQL.notPassed", dateCommand);
		return results;
	}

	public List<AuditResultSearch> getByScoreDate(DateCommand dateCommand) {
		List<AuditResultSearch> results = sqlSession.selectList("auditSQL.getByScoreDate", dateCommand);
		return results;
	}

	
	
	


	public List<AuditNcrBean> getNcrVendor(String id) {
		List<AuditNcrBean> results = sqlSession.selectList("auditSQL.ncrVendor", id);
		return results;
	}
}
