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

	MemberVO findId(MemberVO memberVO);

	void friend_Request(HashMap<String,String> friend);
	
	List<HashMap<String,String>> friend_RequestList(String receiverID);
	
	void friend_Accept(HashMap<String,String> friend);
	
	void friend_Refuse(HashMap<String,String> friend);
	
	void friend_Block(HashMap<String,String> friend);

	List<HashMap<String,String>> friendList(String id);
	
	List<HashMap<String,String>> friendBlockList(String id);
	
	String getFriendId(HashMap<String,String> friend);
	
	void deleteFriend(HashMap<String,String> friend);
	
	void unBlockFriend(HashMap<String,String> friend);

	String getProfileById(String id);

	void profileFileUpload(HashMap<String,String> profileName);
	
	void profileReset(HashMap<String,String> profileInfo);

	void updatePw(MemberVO vo);

	MemberVO findMember(MemberVO vo);

	String findPw(MemberVO vo);
	
	int friend_RequestInfo(String id);

	int checkFriend(HashMap<String,String> friend);

	void updateMemberByManager(MemberVO vo);

	int totalFrined(String id);
	
	Map<String,String> getFriendInfo(HashMap<String,String> friend);
}
