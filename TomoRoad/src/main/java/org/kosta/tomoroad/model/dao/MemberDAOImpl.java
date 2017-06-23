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
	public MemberVO findId(MemberVO memberVO) {
		return template.selectOne("member.findId", memberVO);
	}

	@Override
	public void friend_Request(HashMap<String,String> friend) {
		template.insert("member.friend_Request",friend);
	}
	@Override
	public void friend_Accept(HashMap<String,String> friend) {
		template.update("member.friend_Accept",friend);
	}
	@Override
	public void friend_Refuse(HashMap<String,String> friend) {
		template.update("member.friend_Refuse",friend);
	}
	@Override
	public void friend_Block(HashMap<String,String> friend) {
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
		List<HashMap<String,String>> list =  template.selectList("member.friendBlockListBySenderId", id);
		return list;
	}
	
	@Override
	public String getFriendId(HashMap<String,String> friend) {
		return template.selectOne("member.getFriendId", friend);
	}
	@Override
	public void deleteFriend(HashMap<String,String> friend) {
		template.delete("deleteFriend",friend);
	}
	
	@Override
	public void unBlockFriend(HashMap<String,String> friend) {
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
		template.update("profileReset",profileInfo);
	}
	@Override
	public void updatePw(MemberVO vo) {
		template.update("member.updatePw",vo);
		
	}
	@Override
	public MemberVO findMember(MemberVO vo) {
		return template.selectOne("member.findMember", vo);
	}
	@Override
	public String findPw(MemberVO vo) {
		return template.selectOne("member.findPw", vo);
	}

	public int friend_RequestInfo(String id) {
		return template.selectOne("member.friend_RequestInfo", id);
	}
	
	public int checkFriend(HashMap<String,String> friend){
		return template.selectOne("member.checkFriend", friend);
	}
	@Override
	public void updateMemberByManager(MemberVO vo) {
		template.update("member.updateMemberByManager",vo);
		
	}
	@Override
	public int totalFrined(String id) {
		template.selectOne("member.totalFriend",id);
		return template.selectOne("member.totalFriend",id);
	}

}
