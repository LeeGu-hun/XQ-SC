package service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bean.BeanMember;
import spring.AuthInfo;
import spring.IdPasswordNotMatchingException;
import spring.MemberNotFoundException;

@Service
public class LoginService {

	@Autowired
	private SqlSession sqlSession;
	
	public AuthInfo authenticate(String id, String password) {
		BeanMember m = sqlSession.selectOne("loginSQL.loginCheck", id);
		if(m == null) 
			throw new MemberNotFoundException();
		if(!m.mathPassword(password))
			throw new IdPasswordNotMatchingException();
		return new AuthInfo(m.getMEMBER_ID(),m.getMEMBER_DEPART(),m.getMEMBER_NAME());
	}
}
