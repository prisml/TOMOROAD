package org.kosta.tomoroad.model.dao;

import java.util.HashMap;

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
	public void friend(String senderID, String receiverID) {
		HashMap<String,String> friend = new HashMap<String,String>();
		friend.put("senderID", senderID);
		friend.put("receiverID",receiverID);
		template.insert("member.friend",friend);
	}
	@Override
	public MemberVO findId(MemberVO memberVO) {
		System.out.println(memberVO);
		return template.selectOne("member.findId", memberVO);
	}
	@Override
	public MemberVO findPw(MemberVO memberVO) {
		return template.selectOne("member.findPw", memberVO);
	}	
}
