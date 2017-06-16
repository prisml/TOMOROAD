package org.kosta.tomoroad.model.service;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.ManagerDAO;
import org.kosta.tomoroad.model.vo.ManagerVO;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImpl implements ManagerService{
	@Resource(name="managerDAOImpl")
	private ManagerDAO managerDAO;
	
	@Override
	public ManagerVO managerLogin(ManagerVO managerVO) {
		return managerDAO.managerLogin(managerVO);
	}



}
