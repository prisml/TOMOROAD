package org.kosta.tomoroad.model.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.BurnDAO;
import org.kosta.tomoroad.model.utils.PagingBean;
import org.kosta.tomoroad.model.vo.BurnCommentVO;
import org.kosta.tomoroad.model.vo.BurnVO;
import org.kosta.tomoroad.model.vo.ListVO;
import org.kosta.tomoroad.model.vo.MessageVO;
import org.springframework.stereotype.Service;

@Service
public class BurnServiceImpl implements BurnService {
	@Resource(name = "burnDAOImpl")
	private BurnDAO burnDAO;

	@Override
	public ListVO<BurnVO> getBurnList(){
		return getBurnList("1");
	}

	@Override
	public ListVO<BurnVO> getBurnList(String pageNo) {
		int totalCount = burnDAO.getTotalCount();

		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(1, 5, 4, totalCount);
		} else {
			pagingBean = new PagingBean(Integer.parseInt(pageNo), 5, 4, totalCount);
		}

		return new ListVO<BurnVO>(burnDAO.getBurnList(pagingBean), pagingBean);

	}

	@Override
	public BurnVO findBurnByNo(String no) {
		return burnDAO.findBurnByNo(no);
	}

	@Override
	public void writeBurn(BurnVO bvo) {
		burnDAO.writeBurn(bvo);
	}

	@Override
	public void updateHits(String no) {
		burnDAO.updateHits(no);
	}
	@Override
	public List<BurnCommentVO> findBurnCommentByNo(String no) {
		return burnDAO.findBurnCommentByNo(no);
	}
	@Override
	public String findCommentMemberId(int no) {
		return burnDAO.findCommentMemberId(no);
	}
	
	@Override
	public void updateBurn(BurnVO bvo) {
		burnDAO.updateBurn(bvo);
	}

	@Override
	public void deleteBurn(String no) {
		burnDAO.deleteBurn(no);
	}

	@Override
	public ListVO<BurnVO> getBurnListByStation(String stationName, String pageNo) {
		int totalCount = burnDAO.getTotalCountByStation(stationName);		

		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(1, 5, 4, totalCount);
		} else {
			pagingBean = new PagingBean(Integer.parseInt(pageNo), 5, 4, totalCount);
		}
		return new ListVO<BurnVO>(burnDAO.getBurnListByStation(pagingBean, stationName), pagingBean);		
	}

	@Override
	public List<String> getStationNameList() {		
		return burnDAO.getStationNameList();
	}

	@Override
	public void registeComment(BurnCommentVO vo) {
		burnDAO.registeComment(vo);
	}

	@Override
	public void deleteComment(BurnCommentVO vo) {
		String member_id=burnDAO.findCommentMemberId(vo.getNo());
		if(member_id.equals(vo.getMember_id())){
		burnDAO.deleteComment(vo);
		}else{
			System.out.println("비정상적인 삭제시도 발생.");
		}
	}

	@Override
	public void updateComment(BurnCommentVO vo) {
		String member_id=burnDAO.findCommentMemberId(vo.getNo());
		if(member_id.equals(vo.getMember_id())){
			burnDAO.updateComment(vo);
		}else{
			System.out.println("비정상적인 댓글 수정 시도발생.");
		}
	}

	@Override
	public void replyComment(BurnCommentVO vo) {
		burnDAO.replyComment(vo);
	}
	
	@Override
	public int CountComment(String no){
		return burnDAO.countComment(no);
	}
	
	@Override
	public int isNewMsg(String receiver) {
		return burnDAO.isNewMsg(receiver);
	}

	@Override
	public List<String> findId(String id, String searcher) {
		return burnDAO.findId(id, searcher);
	}

	@Override
	public Object getMessageList(String sender, String receiver) {
		burnDAO.updateCheck(sender, receiver);
		return burnDAO.getMessageList(sender, receiver);
	}

	@Override
	public Object sendMessage(String sender, String receiver, String text) {
		burnDAO.sendMessage(sender, receiver, text);		
		return burnDAO.getMessageList(sender, receiver);
	}

	@Override
	public List<MessageVO> getFilteredMessage(String id) {
		HashMap<String, MessageVO> map = new HashMap<String, MessageVO>();
		
		List<MessageVO> list = burnDAO.getFilteredMessage(id);	
		String a = null;
		for(MessageVO mvo : list){
			if(mvo.getSender().equals(id)){
				a = mvo.getReceiver();
			}else{
				a = mvo.getSender();
			}
			
			if(map.containsKey(a)==false){
				map.put(a, mvo);
			}
		}
	
		list.clear();
		Iterator<MessageVO> it = map.values().iterator();
		while(it.hasNext()){
			list.add(it.next());
		}	
		return list;
		
	}
	
}


