package org.kosta.tomoroad.model.burn;

import java.util.ArrayList;

import org.kosta.tomoroad.model.pagingbean.PagingBean;

public interface BurnService {

	int getTotalCount();

	ArrayList<BurnVO> getBurnList(PagingBean pagingBean);

}
