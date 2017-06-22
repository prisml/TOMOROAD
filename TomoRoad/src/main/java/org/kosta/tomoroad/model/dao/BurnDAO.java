package org.kosta.tomoroad.model.dao;

import java.util.List;

import org.kosta.tomoroad.model.utils.PagingBean;
import org.kosta.tomoroad.model.vo.BurnCommentVO;
import org.kosta.tomoroad.model.vo.BurnVO;
import org.kosta.tomoroad.model.vo.MessageVO;

public interface BurnDAO {

	int getTotalCount();

	List<BurnVO> getBurnList(PagingBean pagingBean);

	BurnVO findBurnByNo(String no);

	void writeBurn(BurnVO bvo);

	void updateHits(String no);

	List<BurnCommentVO> findBurnCommentByNo(String no);

	String findCommentMemberId(int no);
	void updateBurn(BurnVO bvo);

	void deleteBurn(String no);

	List<BurnVO>  getBurnListByStation(PagingBean pagingBean, String stationName);

	int getTotalCountByStation(String stationName);

	void registeComment(BurnCommentVO vo);

	void deleteComment(BurnCommentVO vo);

	void updateComment(BurnCommentVO vo);

	void replyComment(BurnCommentVO vo);

	List<String> getStationNameList();

	int countComment(String no);

	int isNewMsg(String receiver);

	List<String> findId(String id, String searcher);

	Object getMessageList(String sender, String receiver);

	void sendMessage(String sender, String receiver, String text);

	List<MessageVO> getFilteredMessage(String id);

}
