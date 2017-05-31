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
	public void deleteMember(MemberVO vo) {
		template.delete("member.deleteMember",vo);		
	}
	@Override
	public MemberVO findIdByPwNameTel(MemberVO memberVO) {
		return template.selectOne("member.findIdByPwNameTel", memberVO);
	}
	@Override
	public MemberVO findPwByIdNameTel(MemberVO memberVO) {
		return template.selectOne("member.findPwByIdNameTel", memberVO);
	}	
	@Override
	public void friend_Request(String senderID, String receiverID) {
		HashMap<String,String> friend = new HashMap<String,String>();
		friend.put("senderID", senderID);
		friend.put("receiverID",receiverID);
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
	public List<String> friend_RequestList(String receiverID) {
		return template.selectList("member.friend_RequestList", receiverID);
	}
	@Override
	public List<String> friendList(String id) {
		List<String> list = template.selectList("member.friendListByReceiverId", id);
		List<String> list2 = template.selectList("member.friendListBySenderId", id);
		for(int i = 0;i<list2.size();i++)
			list.add(list2.get(i));
		System.out.println(list);
		return list;
	}
	@Override
	public String getFriendId(String id, String selectId) {
		HashMap<String,String> friend = new HashMap<String,String>();
		friend.put("id", id);
		friend.put("selectId",selectId);
		return template.selectOne("member.getFriendId", friend);
	}	
}
