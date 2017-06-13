package org.kosta.tomoroad.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.MemberDAO;
import org.kosta.tomoroad.model.vo.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Resource(name="memberDAOImpl")
	private MemberDAO memberDAO;
	@Override
	public MemberVO findMemberById(String id) {		
		return memberDAO.findMemberById(id);
	}
	@Override
	public MemberVO login(MemberVO memberVO){
		return memberDAO.login(memberVO);
	}
	@Override
	public void registerMember(MemberVO vo) {
		memberDAO.registerMember(vo);
	}
	@Override
	public int idcheck(String id) {		
		return memberDAO.idcheck(id);
	}
	@Override
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);	
	}
	@Override
	public void deleteMember(String id) {
		memberDAO.deleteMember(id);	
	}
	@Override
	public MemberVO findId(MemberVO memberVO) {
		return memberDAO.findId(memberVO);
	}
	@Override
	public MemberVO findPw(MemberVO memberVO) {
		return memberDAO.findPw(memberVO);
	}
	@Override
	public void friend_Request(String senderID, String receiverID) {
		HashMap<String,String> friend = new HashMap<String,String>();
		friend.put("senderID", senderID);
		friend.put("receiverID",receiverID);
		memberDAO.friend_Request(friend);
	}
	@Override
	public List<HashMap<String,String>> friend_RequestList(String receiverID) {
		return memberDAO.friend_RequestList(receiverID);		
	}
	@Override
	public void friend_Accept(String senderID, String receiverID) {
		memberDAO.friend_Accept(senderID, receiverID);		
	}
	@Override
	public void friend_Refuse(String senderID, String receiverID) {
		memberDAO.friend_Refuse(senderID, receiverID);
	}
	@Override
	public void friend_Block(String id, String blockId) {
		memberDAO.friend_Block(id, blockId);
	}
	@Override
	public List<HashMap<String,String>> friendList(String id) {
		return memberDAO.friendList(id);
	}
	
	@Override
	public List<HashMap<String, String>> friendBlockList(String id) {
		return memberDAO.friendBlockList(id);
	}
	
	@Override
	public String getFriendId(String id, String selectId) {
		return memberDAO.getFriendId(id, selectId);
	}
	@Override
	public void deleteFriend(String id, String deleteId) {
		memberDAO.deleteFriend(id, deleteId);
	}
	@Override
	public void unBlockFriend(String id, String unBlockId) {
		memberDAO.unBlockFriend(id, unBlockId);
	}
	@Override
	public String getProfileById(String id) {
		return memberDAO.getProfileById(id);
	}
	@Override
	public void profileFileUpload(String id,String profile) {
		HashMap<String,String> profileName = new HashMap<String,String>();
		profileName.put("id", id);
		profileName.put("profile",profile);
		memberDAO.profileFileUpload(profileName);
	}
	@Override
	public void profileReset(String id,String profileReset) {
		HashMap<String,String> profileInfo = new HashMap<String,String>();
		profileInfo.put("id", id);
		profileInfo.put("profileReset",profileReset);
		memberDAO.profileReset(profileInfo);
	}



}
