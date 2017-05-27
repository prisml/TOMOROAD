package org.kosta.tomoroad.model.service;

import org.kosta.tomoroad.model.vo.BurnVO;
import org.kosta.tomoroad.model.vo.ListVO;

public interface BurnService {	

	ListVO getBurnList();	

	ListVO getBurnList(String pageNo);

	BurnVO findBurnByNo(String no);


}
