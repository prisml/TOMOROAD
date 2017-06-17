package org.kosta.tomoroad.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.vo.ManagerVO;
import org.kosta.tomoroad.model.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class ManagerDAOImpl implements ManagerDAO{
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public ManagerVO managerLogin(ManagerVO managerVO) {
		return template.selectOne("manager.managerLogin", managerVO);
	}

	@Override
	public List<MemberVO> getMemberList() {
		return template.selectList("manager.getMemberList");
	}

	@Override
	public void updateMemberByManager(MemberVO vo) {
		template.update("manager.updateMemberByManager",vo);		
		
	}

	@Override
	public void deleteMemberByManager(String id) {
		template.delete("manager.deleteMemberByManager",id);	
		
	}
}
