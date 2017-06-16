package org.kosta.tomoroad.model.service;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.TomoroadingDAO;
import org.kosta.tomoroad.model.vo.ConnectionVO;
import org.kosta.tomoroad.model.vo.StationVO;
import org.springframework.stereotype.Service;

@Service
public class TomoroadingServiceImpl implements TomoroadingService {
	@Resource(name="tomoroadingDAOImpl")
	private TomoroadingDAO dao;
	
	/* (non-Javadoc)
	 * @see org.kosta.tomoroad.model.service.TomoroadingService#locationInfo(java.lang.String)
	 */
	@Override
	public StationVO locationInfo(String name){
		return dao.locationInfo(name);
	}
	
	@Override
	public List<StationVO> makeRoute(String[] station, String depart, String arrived) {
		boolean check[] = new boolean[station.length];
		Map<String, Integer> map = new HashMap<String, Integer>();
		List<ConnectionVO> list = dao.getStationConnection();
		List<StationVO> stationList = dao.getStationList();
		Map<String, Integer> stationMap = new HashMap<String, Integer>();
		@SuppressWarnings("unchecked")
		Map<String, Integer>[] connection = new HashMap[stationList.size()];
		Queue<ConnectionVO> route = new LinkedList<ConnectionVO>();
		
		for(int i=0;i<stationList.size();i++){
			stationMap.put(stationList.get(i).getName(), i);
			connection[i] = new HashMap<String, Integer>();
		}
		
		for(int i=0;i<list.size();i++){
			connection[stationMap.get(list.get(i).getDepart().getName())].put(list.get(i).getArrived().getName(), list.get(i).getSpendTime());
			connection[stationMap.get(list.get(i).getArrived().getName())].put(list.get(i).getDepart().getName(), list.get(i).getSpendTime());
		}
		
		route.add(new ConnectionVO(null,new StationVO(depart),0));
		int dptNo = stationMap.get(depart);
		while(!route.isEmpty()){
			ConnectionVO nowStation = route.remove();
		}
		return null;
	}
}
