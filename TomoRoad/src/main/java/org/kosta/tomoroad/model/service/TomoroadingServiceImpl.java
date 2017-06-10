package org.kosta.tomoroad.model.service;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.TomoroadingDAO;
import org.kosta.tomoroad.model.vo.StationVO;
import org.springframework.stereotype.Service;

@Service
public class TomoroadingServiceImpl implements TomoroadingService {
	@Resource(name="TomoroadingDAOImpl")
	private TomoroadingDAO dao;
	
	/* (non-Javadoc)
	 * @see org.kosta.tomoroad.model.service.TomoroadingService#locationInfo(java.lang.String)
	 */
	@Override
	public StationVO locationInfo(String name){
		return dao.locationInfo(name);
	}
}
