package service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import bean.NcrAuditListCommand;
import bean.NcrAuditSearchCommand;
import bean.NcrBean;

public class NcrService {

	@Autowired
	private SqlSession sqlSession;
	
	public List<NcrAuditListCommand> getAuditList(String vendorName, String dateFrom, 
			String dateTo)throws Exception {
		
		NcrAuditSearchCommand sc=new NcrAuditSearchCommand(vendorName,dateFrom,dateTo);
		List<NcrAuditListCommand>auditList = sqlSession.selectList("ncrSQL.getAuditList", sc);		
		
		return auditList;
		
	}

	public void issueNcr(NcrBean nb) {
		System.out.println(nb.getAudit_id());
		sqlSession.insert("ncrSQL.ncrIssue", nb);
				
	}
	
	public void ncrFileUpload(String originalfileName, String saveFileName, long fileSize) {
	    HashMap<String, Object> hm = new HashMap<>();
	    hm.put("originalfileName", originalfileName);
	    hm.put("saveFileName", saveFileName);
	    hm.put("fileSize", fileSize);
	    sqlSession.insert("ncrSQL.ncrFileUpload", hm);
	}
}
