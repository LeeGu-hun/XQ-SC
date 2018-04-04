package service;

import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;


import bean.NcrAuditListCommand;
import bean.NcrAuditSearchCommand;

public class NcrService {

	@Autowired
	private SqlSession sqlSession;
	
	public List<NcrAuditListCommand> getAuditList(String vendorName, String dateFrom, String dateTo) {
		NcrAuditSearchCommand sc=new NcrAuditSearchCommand(vendorName,dateFrom,dateTo);
		
		List<NcrAuditListCommand> auditList = sqlSession.selectList("ncrSQL.getAuditList", sc);
		
		
		return auditList;
		
	}

}
