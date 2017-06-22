package org.kosta.tomoroad.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.utils.PagingBean;
import org.kosta.tomoroad.model.vo.BurnCommentVO;
import org.kosta.tomoroad.model.vo.BurnVO;
import org.kosta.tomoroad.model.vo.MessageVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BurnDAOImpl implements BurnDAO{
	@Resource
	private SqlSessionTemplate template;

	@Override
	public int getTotalCount() {		
		return template.selectOne("burn.getTotalCount");
	}

	@Override
	public List<BurnVO> getBurnList(PagingBean pagingBean) {		
		return template.selectList("burn.getBurnList",pagingBean);
	}
	
	@Override
	public BurnVO findBurnByNo(String no){
		return template.selectOne("burn.findBurnByNo",no);
	}

	@Override
	public void writeBurn(BurnVO bvo) {		
		template.insert("burn.writeBurn",bvo);		
	}

	@Override
	public void updateHits(String no) {
		template.update("burn.updateHits",no);		
	}

	@Override
	public List<BurnCommentVO> findBurnCommentByNo(String no) {
		return template.selectList("burn.findBurnCommentByNo",no);
	}

	@Override
	public String findCommentMemberId(int no) {
		return template.selectOne("burn.findCommentMemberId",no);
	}
	public void updateBurn(BurnVO bvo) {
		template.update("burn.updateBurn",bvo);		
	}

	@Override
	public void deleteBurn(String no) {
		template.delete("burn.deleteBurn",no);		
	}

	@Override
	public List<BurnVO> getBurnListByStation(PagingBean pagingBean, String stationName) {		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("pagingBean", pagingBean);
		map.put("stationName", stationName);		
		return template.selectList("burn.getBurnListByStation",map);		
	}

	@Override
	public int getTotalCountByStation(String stationName) {		
		return template.selectOne("burn.getTotalCountByStation",stationName);
	}

	@Override
	public void registeComment(BurnCommentVO vo){
		template.insert("burn.registeComment",vo);
	}
	@Override
	public void deleteComment(BurnCommentVO vo){
		template.update("burn.deleteComment",vo);
	}
	@Override
	public void updateComment(BurnCommentVO vo){
		template.update("burn.updateComment",vo);
	}
	@Override
	public void replyComment(BurnCommentVO vo){
		template.insert("burn.replyComment",vo);
	}
	@Override
	public List<String> getStationNameList() {
		return template.selectList("burn.getStationNameList");
	}

	@Override
	public int countComment(String no) {
		return template.selectOne("burn.countComment");
	}

	@Override
	public int isNewMsg(String receiver) {
		return template.selectOne("burn.isNewMsg",receiver);
	}

	@Override
	public List<String> findId(String id, String searcher) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("searcher", searcher);
		return template.selectList("burn.findId",map);
	}

	@Override
	public Object getMessageList(String sender, String receiver) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("sender", sender);
		map.put("receiver", receiver);
		return template.selectList("burn.getMessageList",map);
	}

	@Override
	public void sendMessage(String sender, String receiver, String text) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("sender", sender);
		map.put("receiver", receiver);
		map.put("text", text);
		
		template.insert("burn.sendMessage",map);		
	}

	@Override
	public List<MessageVO> getFilteredMessage(String id) {		
		return template.selectList("burn.getFilteredMessage",id);
	}
	
	
	
	
}
