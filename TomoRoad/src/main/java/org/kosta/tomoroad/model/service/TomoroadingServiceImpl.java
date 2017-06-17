package org.kosta.tomoroad.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Set;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.TomoroadingDAO;
import org.kosta.tomoroad.model.vo.ConnectionVO;
import org.kosta.tomoroad.model.vo.StationVO;
import org.springframework.stereotype.Service;

@Service
public class TomoroadingServiceImpl implements TomoroadingService {
	@Resource(name = "tomoroadingDAOImpl")
	private TomoroadingDAO dao;
	// 역 연결정보 list
	private List<ConnectionVO> connectionList;
	
	// 역 연결 그래프
	private Map<String, Integer>[] map;

	// 역 index
	private Map<String, Integer> stationIdx = new HashMap<String, Integer>();

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.kosta.tomoroad.model.service.TomoroadingService#locationInfo(java.
	 * lang.String)
	 */
	@Override
	public StationVO locationInfo(String name) {
		return dao.locationInfo(name);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> makeRoute(String[] bucket, String depart, String arrived) {
		connectionList = dao.getConnectionList();
		map = new HashMap[dao.getNumberOfStation()];
		List<String> result = new ArrayList<String>();
		List<StationVO> stationList = dao.getStationList();
		for (int i = 0; i < stationList.size(); i++) { // 역 index setting
			stationIdx.put(stationList.get(i).getName(), i);
			map[i] = new HashMap<String, Integer>();
		}

		for (int i = 0; i < connectionList.size(); i++) { // 역 연결 그래프 생성
			ConnectionVO vo = connectionList.get(i);
			map[stationIdx.get(vo.getDepart().getName())].put(vo.getArrived().getName(), vo.getSpendTime());
			map[stationIdx.get(vo.getArrived().getName())].put(vo.getDepart().getName(), vo.getSpendTime());
		}

		Set<String> bucketSet = new HashSet<String>();
		for (String station : bucket)
			bucketSet.add(station);

		StationVO path = getMaxViaStation(depart, bucketSet);
		appendStation(result, path);
		deleteBucket(bucketSet, path);
		path = getMaxViaStation(path.getName(), bucketSet);
		appendStation(result,path);
		stationList = getShortestPath(path.getName());
		path = stationList.get(stationIdx.get(arrived));
		appendStation(result,path);
		result.add(arrived);
		// to do!!!!!@@@@
		return result;
	}

	private void deleteBucket(Set<String> bucketSet, StationVO path) {
		while(path.getChild()!=null){
			if(bucketSet.contains(path.getName()))
				bucketSet.remove(path.getName());
		}
	}

	private void appendStation(List<String> result, StationVO path) {
		while(path.getChild()!=null)
			result.add(path.getName());
	}

	private StationVO getMaxViaStation(String depart, Set<String> bucketSet) {
		// stationIdx와 map으로 2중 map 구현 -> 출발지를 stationIdx에서 구하고 map에서 해당 도착지를
		// 넣으면 걸리는 시간을 구한다.
		
		StationVO svo = dao.getStationInfo(depart); // 출발지를 0 으로 세팅
		svo.setSpendTime(0);
		List<StationVO> stationList = getShortestPath(depart);

		int maxStation = 0;
		int minTime = Integer.MAX_VALUE;
		StationVO result = null;
		for (String bucket : bucketSet) {
			int count = getStationCountByRoute(stationList.get(stationIdx.get(bucket)), bucketSet);
			if (count > maxStation) {
				result = stationList.get(stationIdx.get(bucket));
				minTime = stationList.get(stationIdx.get(bucket)).getSpendTime();
				maxStation = count;
			} else if (count == maxStation && minTime > stationList.get(stationIdx.get(bucket)).getSpendTime()) {
				result = stationList.get(stationIdx.get(bucket));
				minTime = stationList.get(stationIdx.get(bucket)).getSpendTime();
			}
		}
		return result;
	}

	private List<StationVO> getShortestPath(String depart) {
		// 역 list
		List<StationVO> stationList = dao.getStationList();
		
		// 경로 찾는 queue
		Queue<ConnectionVO> route = new LinkedList<ConnectionVO>();

		route.add(new ConnectionVO(null, new StationVO(depart), 0));
		// 출발지로부터 모든 역까지 소요되는 시간을 구하여 stationList.spendTime에 넣는다
		while (!route.isEmpty()) {
			ConnectionVO nowStation = route.remove();
			int index = stationIdx.get(nowStation.getArrived().getName());
			Map<String, Integer> temp = map[index];
			for (String key : temp.keySet()) {
				if (nowStation.getSpendTime() + map[index].get(key) < stationList.get(stationIdx.get(key))
						.getSpendTime()) {
					stationList.get(stationIdx.get(key)).setSpendTime(nowStation.getSpendTime() + map[index].get(key));
					route.add(new ConnectionVO(nowStation.getArrived(), stationList.get(stationIdx.get(key)),
							nowStation.getSpendTime() + map[index].get(key)));
					stationList.get(stationIdx.get(key)).setChild(nowStation.getArrived());
				}
			}
		}
		return stationList;
	}

	private int getStationCountByRoute(StationVO stationVO, Set<String> bucketSet) {
		int count = 0;
		while (stationVO.getChild() != null) {
			if (bucketSet.contains(stationVO.getName()))
				count++;
			stationVO = stationVO.getChild();
		}
		return count;
	}
}
