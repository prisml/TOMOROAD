package org.kosta.tomoroad.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.BurnDAO;
import org.kosta.tomoroad.model.utils.PagingBean;
import org.kosta.tomoroad.model.vo.BurnCommentVO;
import org.kosta.tomoroad.model.vo.BurnVO;
import org.kosta.tomoroad.model.vo.ListVO;
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
			pagingBean = new PagingBean(totalCount);
		} else {
			pagingBean = new PagingBean(totalCount, Integer.parseInt(pageNo));
		}

		return new ListVO(burnDAO.getBurnList(pagingBean), pagingBean);

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
		// TODO Auto-generated method stub
		return burnDAO.findBurnCommentByNo(no);
	}
	@Override
	public Object findParentCommentMemberId(int no) {
		// TODO Auto-generated method stub
		return burnDAO.findParentCommentMemberId(no);
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
	public ListVO getBurnListByStation(String stationName, String pageNo) {
		int totalCount = burnDAO.getTotalCountByStation(stationName);		

		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(totalCount);
		} else {
			pagingBean = new PagingBean(totalCount, Integer.parseInt(pageNo));
		}
		return new ListVO(burnDAO.getBurnListByStation(pagingBean, stationName), pagingBean);		
	}

	@Override
	public List<String> getStationNameList() {		
		return burnDAO.getStationNameList();
	}

}
