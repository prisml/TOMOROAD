package org.kosta.tomoroad.model.service;

import java.util.List;

import org.kosta.tomoroad.model.vo.ManagerVO;
import org.kosta.tomoroad.model.vo.MemberVO;

public interface ManagerService {


	ManagerVO managerLogin(ManagerVO managerVO);
	
	List<MemberVO> getMemberList();

	void updateMemberByManager(MemberVO vo);

	void deleteMemberByManager(String id);
	
}
