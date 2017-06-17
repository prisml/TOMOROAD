package org.kosta.tomoroad.model.service;

import java.util.HashMap;
import java.util.List;

import org.kosta.tomoroad.model.vo.MemberVO;

public interface MemberService {

	MemberVO findMemberById(String id);

	MemberVO login(MemberVO memberVO);

	void registerMember(MemberVO vo);

	int idcheck(String id);

	void updateMember(MemberVO vo);

	void deleteMember(String id);

	MemberVO findId(MemberVO memberVO);
	
	void friend_Request(String senderID,String receiverID);
	
	List<HashMap<String,String>> friend_RequestList(String receiverID);
	
	void friend_Accept(String senderID,String receiverID);
	
	void friend_Refuse(String senderID,String receiverID);
	
	void friend_Block(String id,String blockId);

	List<HashMap<String,String>> friendList(String id);
	
	List<HashMap<String,String>> friendBlockList(String id);
	
	void deleteFriend(String id,String deleteId);
	
	void unBlockFriend(String id,String unBlockId);

	String getFriendId(String id, String selectId);

	String getProfileById(String id);

	void profileFileUpload(String id,String profile);
	
	void profileReset(String id,String profileReset);

	void findPw2(MemberVO vo);

	MemberVO findMember(MemberVO vo);

	String findPw(MemberVO vo);
	
	int friend_RequestInfo(String id);



}
