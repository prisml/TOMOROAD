package org.kosta.tomoroad.model.dao;

import java.util.List;

import org.kosta.tomoroad.model.utils.PagingBean;
import org.kosta.tomoroad.model.vo.BurnVO;

public interface BurnDAO {

	int getTotalCount();

	List<BurnVO> getBurnList(PagingBean pagingBean);

	BurnVO findBurnByNo(String no);

}
