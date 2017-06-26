package org.kosta.tomoroad.model.dao;

import java.util.List;

import org.kosta.tomoroad.model.vo.BucketVO;
import org.kosta.tomoroad.model.vo.StationVO;

public interface BucketDAO {
	
	int findBucket(BucketVO vo);

	void insertBucket(BucketVO vo);

	void deleteBucket(BucketVO vo);

	List<BucketVO> selectBucketList(String id);

	List<StationVO> getStationList();

}