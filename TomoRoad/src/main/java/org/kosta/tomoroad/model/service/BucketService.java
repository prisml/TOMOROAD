package org.kosta.tomoroad.model.service;

import java.util.List;

import org.kosta.tomoroad.model.vo.BucketVO;

public interface BucketService {

	int findBucket(BucketVO vo);

	void insertBucket(BucketVO vo);

	void deleteBucket(BucketVO vo);

	List<BucketVO> selectBucketList(String id);

}