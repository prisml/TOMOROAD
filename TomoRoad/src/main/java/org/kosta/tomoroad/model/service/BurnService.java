package org.kosta.tomoroad.model.service;

import org.kosta.tomoroad.model.vo.BurnListVO;

public interface BurnService {	

	BurnListVO getBurnList();	

	BurnListVO getBurnList(String pageNo);


}
