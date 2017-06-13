package org.kosta.tomoroad.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class MemberDAOImpl implements MemberDAO{
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public MemberVO findMemberById(String id) {
		return template.selectOne("member.findMemberById", id);
	}
	@Override
	public MemberVO login(MemberVO memberVO) {
		return template.selectOne("member.login", memberVO);
	}
	@Override
	public void registerMember(MemberVO vo) {
		template.insert("member.registerMember",vo);			
	}
	@Override
	public int idcheck(String id) {
		return template.selectOne("member.idcheck",id);				
	}
	@Override
	public void updateMember(MemberVO vo) {
		template.update("member.updateMember",vo);		
	}
	@Override
	public void deleteMember(String id) {
		template.delete("member.deleteMember",id);		
	}
	@Override

	public void friend(String senderID, String receiverID) {
		HashMap<String,String> friend = new HashMap<String,String>();
		friend.put("senderID", senderID);
		friend.put("receiverID",receiverID);
		template.insert("member.friend",friend);
	}
	@Override
	public MemberVO findId(MemberVO memberVO) {
		return template.selectOne("member.findId", memberVO);
	}

	@Override
	public void friend_Request(HashMap<String,String> friend) {
		template.insert("member.friend_Request",friend);
	}
	@Override
	public void friend_Accept(String senderID, String receiverID) {
		HashMap<String,String> friend = new HashMap<String,String>();
		friend.put("senderID", senderID);
		friend.put("receiverID",receiverID);
		template.update("member.friend_Accept",friend);
	}
	@Override
	public void friend_Refuse(String senderID, String receiverID) {
		HashMap<String,String> friend = new HashMap<String,String>();
		friend.put("senderID", senderID);
		friend.put("receiverID",receiverID);
		template.update("member.friend_Refuse",friend);
	}
	@Override
	public void friend_Block(String id, String blockId) {
		HashMap<String,String> friend = new HashMap<String,String>();
		friend.put("id", id);
		friend.put("blockId",blockId);
		template.update("member.friend_Block",friend);
	}
	@Override
	public List<HashMap<String,String>> friend_RequestList(String receiverID) {
		return template.selectList("member.friend_RequestList", receiverID);
	}
	@Override
	public List<HashMap<String,String>> friendList(String id) {
		List<HashMap<String,String>> list =  template.selectList("member.friendListByReceiverId", id);
		List<HashMap<String,String>> list2 =  template.selectList("member.friendListBySenderId", id);
		for(int i = 0;i<list.size();i++)
			list2.add(list.get(i));
		return list2;
	}
	
	@Override
	public List<HashMap<String, String>> friendBlockList(String id) {
		List<HashMap<String,String>> list =  template.selectList("member.friendBlockListByReceiverId", id);
		List<HashMap<String,String>> list2 =  template.selectList("member.friendBlockListBySenderId", id);
		for(int i = 0;i<list.size();i++)
			list2.add(list.get(i));
		return list2;
	}
	
	@Override
	public String getFriendId(String id, String selectId) {
		HashMap<String,String> friend = new HashMap<String,String>();
		friend.put("id", id);
		friend.put("selectId",selectId);
		return template.selectOne("member.getFriendId", friend);
	}
	@Override
	public void deleteFriend(String id, String deleteId) {
		HashMap<String,String> friend = new HashMap<String,String>();
		friend.put("id", id);
		friend.put("selectId",deleteId);
		template.delete("deleteFriend",friend);
	}
	
	@Override
	public void unBlockFriend(String id, String unBlockId) {
		HashMap<String,String> friend = new HashMap<String,String>();
		System.out.println(id+" "+unBlockId);
		friend.put("id", id);
		friend.put("unBlockId",unBlockId);
		template.delete("member.unBlockFriend",friend);
	}
	
	@Override
	public String getProfileById(String id) {
		return template.selectOne("getProfileById", id);
	}
	@Override
	public void profileFileUpload(HashMap<String,String> profileName) {
		template.update("profileFileUpload", profileName);
	}
	@Override
	public void profileReset(HashMap<String,String> profileInfo) {
		System.out.println(profileInfo);
		template.update("profileReset",profileInfo);
	}
	@Override
	public void findPw2(MemberVO vo) {
		template.update("member.findPw2",vo);
		
	}
	@Override
	public MemberVO findMember(MemberVO vo) {
		return template.selectOne("member.findMember", vo);
	}
	@Override
	public String findPw(MemberVO vo) {
		return template.selectOne("member.findPw", vo);
	}

}
