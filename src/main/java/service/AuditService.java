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
import bean.AuditProd;
import bean.AuditResultSearch;
import bean.AuditSubmitBean;
import bean.BeanCategory;
import bean.BeanChecklist;
import bean.BeanIssuer;
import bean.BeanMember;
import bean.BeanProduct;
import bean.CheckListBean;
import bean.DateCommand;



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
	
	public List<AuditResultSearch> getSearch(AuditResultSearch search) {
		return sqlSession.selectList("auditSQL.resultSearch",search);
	}
 
	public List<AuditBean> name() {
		return sqlSession.selectOne("auditSQL.name");
	}
	
	
	//Result Page Plan Date Search
	public List<AuditResultSearch> getByPlanDate(DateCommand dateCommand) {
		Date from = dateCommand.getFrom();
		Date to = dateCommand.getTo();
		SimpleDateFormat dt = 
				new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); 
		Calendar cal = Calendar.getInstance();
		int year, month, day;
		String from_s="", to_s="";
		
		Date fromWord = (from == null)?new Date():from;
		cal.setTime(fromWord);
		year = cal.get(cal.YEAR);
		month = cal.get(cal.MONTH) + 1 ;
		day= (from == null)?1:cal.get(cal.DATE);
		from_s = year+"-"+month+"-"+day+" 00:00:00.0";

		Date toWord = (to == null)?new Date():to;
		cal.setTime(toWord);
		year = cal.get (cal.YEAR);
		month = cal.get (cal.MONTH) + 1 ;
		day= cal.get(cal.DATE);
		to_s = year+"-"+month+"-"+day+" 23:59:59.0";
		
		try { 
			from = dt.parse(from_s);
			to = dt.parse(to_s);
		} catch (ParseException e) { } 
		dateCommand.setFrom(from);
		dateCommand.setTo(to);
		List<AuditResultSearch> results = sqlSession.selectList(
				"auditSQL.getByPlanDate", dateCommand);
		return results;
	}
	
	public List<AuditResultSearch> getByScoreDate(DateCommand dateCommand) {
		Date from = dateCommand.getFrom();
		Date to = dateCommand.getTo();
		SimpleDateFormat dt = 
				new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); 
		Calendar cal = Calendar.getInstance();
		int year, month, day;
		String from_s="", to_s="";
		
		Date fromWord = (from == null)?new Date():from;
		cal.setTime(fromWord);
		year = cal.get(cal.YEAR);
		month = cal.get(cal.MONTH) + 1 ;
		day= (from == null)?1:cal.get(cal.DATE);
		from_s = year+"-"+month+"-"+day+" 00:00:00.0";

		Date toWord = (to == null)?new Date():to;
		cal.setTime(toWord);
		year = cal.get (cal.YEAR);
		month = cal.get (cal.MONTH) + 1 ;
		day= cal.get(cal.DATE);
		to_s = year+"-"+month+"-"+day+" 23:59:59.0";
		
		try { 
			from = dt.parse(from_s);
			to = dt.parse(to_s);
		} catch (ParseException e) { } 
		dateCommand.setFrom(from);
		dateCommand.setTo(to);
		List<AuditResultSearch> results = sqlSession.selectList(
				"auditSQL.getByScoreDate", dateCommand);
		return results;
	}
	


}
