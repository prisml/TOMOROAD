package org.kosta.tomoroad.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.ManagerDAO;
import org.kosta.tomoroad.model.vo.ManagerVO;
import org.kosta.tomoroad.model.vo.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImpl implements ManagerService{
	@Resource(name="managerDAOImpl")
	private ManagerDAO managerDAO;
	
	@Override
	public ManagerVO managerLogin(ManagerVO managerVO) {
		return managerDAO.managerLogin(managerVO);
	}
	@Override
	public List<MemberVO> getMemberList() {
		return managerDAO.getMemberList();
	}



}
