package org.kosta.tomoroad.model.dao;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.vo.ManagerVO;
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
}
