package org.kosta.tomoroad.model.dao;

import java.util.HashMap;
import java.util.List;

import org.kosta.tomoroad.model.vo.MemberVO;

public interface MemberDAO {
	public MemberVO findMemberById(String id);

	MemberVO login(MemberVO memberVO);

	void registerMember(MemberVO vo);

	int idcheck(String id);

	void updateMember(MemberVO vo);

	public void deleteMember(String id);

	void friend(String senderID,String receiverID);

	MemberVO findId(MemberVO memberVO);

	MemberVO findPw(MemberVO memberVO);

	void friend_Request(HashMap<String,String> friend);
	
	List<String> friend_RequestList(String receiverID);
	
	void friend_Accept(String senderID,String receiverID);
	
	void friend_Refuse(String senderID,String receiverID);

	List<String> friendList(String id);
	
	String getFriendId(String id,String selectId);
	
	void deleteFriend(String id,String deleteId);

	String getProfileById(String id);

	void profileFileUpload(String id);
}
