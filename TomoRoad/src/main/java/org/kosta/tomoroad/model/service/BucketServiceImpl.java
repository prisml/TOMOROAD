package org.kosta.tomoroad.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.BucketDAO;
import org.kosta.tomoroad.model.vo.BucketVO;
import org.kosta.tomoroad.model.vo.StationVO;
import org.springframework.stereotype.Service;

@Service
public class BucketServiceImpl implements BucketService {
	@Resource(name="bucketDAOImpl")
	private BucketDAO dao;
	
	@Override
	public int findBucket(BucketVO vo){
		//바구니에 역이있는지 확인하는 서비스
		return dao.findBucket(vo);
	}
	@Override
	public void insertBucket(BucketVO vo){
		//바구니에 역을 추가하는 서비스
		dao.insertBucket(vo);
	}
	@Override
	public void deleteBucket(BucketVO vo){
		//바구니에 담긴역을 삭제하는 서비스
		dao.deleteBucket(vo);
	}
	@Override
	public List<BucketVO> selectBucketList(String id){
		//회원의 바구니를 불러오는 서비스
		return dao.selectBucketList(id);
	}
	@Override
	public List<StationVO> getStationList() {
		return dao.getStationList();
	}
}
