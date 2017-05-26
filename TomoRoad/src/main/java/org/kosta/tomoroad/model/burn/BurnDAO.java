package org.kosta.tomoroad.model.burn;

import java.util.List;

import org.kosta.tomoroad.model.pagingbean.PagingBean;

public interface BurnDAO {

	int getTotalCount();

	List<BurnVO> getBurnList(PagingBean pagingBean);

}
