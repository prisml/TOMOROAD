package org.kosta.tomoroad.model.dao;

import java.util.List;

import org.kosta.tomoroad.model.vo.ManagerVO;
import org.kosta.tomoroad.model.vo.MemberVO;
import org.kosta.tomoroad.model.vo.PlaceVO;
import org.kosta.tomoroad.model.vo.StationVO;

public interface ManagerDAO {


	ManagerVO managerLogin(ManagerVO managerVO);

	List<MemberVO> getMemberList();

	void updateMemberByManager(MemberVO vo);

	void deleteMemberByManager(String id);

	MemberVO getIdFromMember(String id);

	void updateStation(StationVO vo);
	
	List<StationVO> getStationNameListManager();

	StationVO getStationListManager(String name);

	List<PlaceVO> getPlaceList();

	PlaceVO getNoFromPlace(int no);

	void updatePlaceManager(PlaceVO vo);

	void insertPlaceManager(PlaceVO vo);

	void deletePlaceManager(int no);
}
