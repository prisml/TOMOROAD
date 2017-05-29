package org.kosta.tomoroad.model.service;

import org.kosta.tomoroad.model.vo.MemberVO;

public interface MemberService {

	MemberVO findMemberById(String id);

	MemberVO login(MemberVO memberVO);

	void registerMember(MemberVO vo);

	int idcheck(String id);

	void updateMember(MemberVO vo);

}
