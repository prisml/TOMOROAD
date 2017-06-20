package org.kosta.tomoroad.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.ManagerDAO;
import org.kosta.tomoroad.model.vo.ManagerVO;
import org.kosta.tomoroad.model.vo.MemberVO;
import org.kosta.tomoroad.model.vo.StationVO;
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
	@Override
	public void updateMemberByManager(MemberVO vo) {
		managerDAO.updateMemberByManager(vo);	
		
	}
	@Override
	public void deleteMemberByManager(String id) {
		managerDAO.deleteMemberByManager(id);	
		
	}
	@Override
	public MemberVO getIdFromMember(String id) {
		return managerDAO.getIdFromMember(id);
		
	}

	@Override
	public void updateStation(StationVO vo) {
		managerDAO.updateStation(vo);
		
	}
	@Override
	public StationVO getStationListManager(String name) {
		//System.out.println("service");
		return managerDAO.getStationListManager(name);
	}
	@Override
	public List<StationVO> getStationNameListManager() {
		return managerDAO.getStationNameListManager();
	}



}
