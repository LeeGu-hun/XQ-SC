package service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import bean.BeanIssuer;
import bean.BeanNcrAttach;
import bean.BeanVendor;
import bean.NcrAuditListCommand;
import bean.NcrAuditSearchCommand;
import bean.NcrBean;
import bean.NcrReplyCommand;
import bean.NcrSearchCommand;

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
		
		sqlSession.insert("ncrSQL.ncrIssue", nb);
				
	}
	
	public void ncrFileUpload(String originalfileName, String saveFileName, long fileSize) {
	    HashMap<String, Object> hm = new HashMap<>();
	    hm.put("originalfileName", originalfileName);
	    hm.put("saveFileName", saveFileName);
	    hm.put("fileSize", fileSize);
	    sqlSession.insert("ncrSQL.ncrFileUpload", hm);
	}

	public List<NcrBean> getNcrList(NcrSearchCommand nsc) {
		List<NcrBean>ncrList = sqlSession.selectList("ncrSQL.getNcrList",nsc);
		return ncrList;
	}

	public List<BeanVendor> getVendorList(String vendor_name) {
		System.out.println(vendor_name);
		List<BeanVendor> vendorlist = sqlSession.selectList("ncrSQL.getVendorList",vendor_name);	
		return vendorlist;
	}

	public List<BeanIssuer> getIssuerList(String issuer_name) {	
		List<BeanIssuer> issuerlist = sqlSession.selectList("ncrSQL.getIssuerList",issuer_name);	
		return issuerlist;
	}

	public List<NcrBean> getNcrDetail(int ncr_id) {
		List<NcrBean> ncrlist = sqlSession.selectList("ncrSQL.getNcrDetailList",ncr_id);
		return ncrlist;
	}
	
	public List<BeanNcrAttach> getFileList(int ncr_id) {
		List<BeanNcrAttach> uploadFileList = sqlSession.selectList("ncrSQL.getFileList",ncr_id);
		return uploadFileList;
	}

	public void ncrComplete(int ncr_id) {
		
		sqlSession.insert("ncrSQL.ncrComplete", ncr_id);
	}

	public void saveVendorReply(NcrReplyCommand nrc) {
		System.out.println("service"+ nrc.getNcr_id());
		sqlSession.insert("ncrSQL.saveVendorReply", nrc);
		
	}
	public void replyFileUpload(String originalfileName, String saveFileName, long fileSize) {
	    HashMap<String, Object> hm = new HashMap<>();
	    hm.put("originalfileName", originalfileName);
	    hm.put("saveFileName", saveFileName);
	    hm.put("fileSize", fileSize);
	    sqlSession.insert("ncrSQL.replyFileUpload", hm);
	}
	
}
