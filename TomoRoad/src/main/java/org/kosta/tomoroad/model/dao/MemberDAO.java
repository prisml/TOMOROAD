package org.kosta.tomoroad.model.dao;

import java.util.List;

import org.kosta.tomoroad.model.vo.MemberVO;

public interface MemberDAO {
	public MemberVO findMemberById(String id);

	MemberVO login(MemberVO memberVO);

	void registerMember(MemberVO vo);

	int idcheck(String id);

	void updateMember(MemberVO vo);

	void deleteMember(MemberVO vo);

<<<<<<< HEAD
	void friend(String senderID,String receiverID);

	MemberVO findId(MemberVO memberVO);
=======
	MemberVO findIdByPwNameTel(MemberVO memberVO);
>>>>>>> branch 'master' of https://github.com/prisml/TOMOROAD.git

<<<<<<< HEAD
	MemberVO findPw(MemberVO memberVO);

=======
	MemberVO findPwByIdNameTel(MemberVO memberVO);

	void friend_Request(String senderID,String receiverID);
	
	List<String> friend_RequestList(String receiverID);
	
	void friend_Accept(String senderID,String receiverID);
	
	void friend_Refuse(String senderID,String receiverID);

	List<String> friendList(String id);
	
	String getFriendId(String id,String selectId);
>>>>>>> branch 'master' of https://github.com/prisml/TOMOROAD.git
}
