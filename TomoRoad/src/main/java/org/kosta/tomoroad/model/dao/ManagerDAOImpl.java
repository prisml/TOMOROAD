package org.kosta.tomoroad.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.vo.ManagerVO;
import org.kosta.tomoroad.model.vo.MemberVO;
import org.kosta.tomoroad.model.vo.PlaceVO;
import org.kosta.tomoroad.model.vo.StationVO;
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

	@Override
	public MemberVO getIdFromMember(String id) {
		MemberVO vo = template.selectOne("manager.getIdFromMember",id);
		return vo;
	}

	@Override
	public void updateStation(StationVO vo) {
		template.update("manager.updateStation",vo);
	}

	@Override
	public StationVO getStationListManager(String name) {
	//	System.out.println(template.selectOne("manager.getStationListManager",name).toString());
		return template.selectOne("manager.getStationListManager",name);
	}

	@Override
	public List<StationVO> getStationNameListManager() {
		return template.selectList("manager.getStationNameListManager");
	}

	@Override
	public List<PlaceVO> getPlaceList() {
		return template.selectList("manager.getPlaceList");
	}

	@Override
	public PlaceVO getNoFromPlace(int no) {
		PlaceVO vo = template.selectOne("manager.getNoFromPlace",no);
		return vo;
	}

	@Override
	public void updatePlaceMember(PlaceVO vo) {
		template.update("manager.updatePlaceMember",vo);	
		
	}

	@Override
	public void insertPlaceManager(PlaceVO vo) {
		template.insert("manager.insertPlaceManager",vo);
		
	}

	@Override
	public void deletePlaceManager(int no) {
		template.delete("manager.deletePlaceManager",no);	
		
	}
}