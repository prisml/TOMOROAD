package org.kosta.tomoroad.model.dao;

import org.kosta.tomoroad.model.vo.MemberVO;

public interface MemberDAO {
	public MemberVO findMemberById(String id);

	MemberVO login(MemberVO memberVO);

	void registerMember(MemberVO vo);

	int idcheck(String id);

	void updateMember(MemberVO vo);

	void deleteMember(MemberVO vo);

	void friend(String senderID,String receiverID);

	MemberVO findIdByPwNameTel(MemberVO memberVO);

	MemberVO findPwByIdNameTel(MemberVO memberVO);

}
