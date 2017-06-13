package org.kosta.tomoroad.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	List<HashMap<String,String>> friend_RequestList(String receiverID);
	
	void friend_Accept(String senderID,String receiverID);
	
	void friend_Refuse(String senderID,String receiverID);
	
	void friend_Block(String id,String blockId);

	List<HashMap<String,String>> friendList(String id);
	
	List<HashMap<String,String>> friendBlockList(String id);
	
	String getFriendId(String id,String selectId);
	
	void deleteFriend(String id,String deleteId);
	
	void unBlockFriend(String id,String unBlockId);

	String getProfileById(String id);

	void profileFileUpload(HashMap<String,String> profileName);
	
	void profileReset(HashMap<String,String> profileInfo);
}
