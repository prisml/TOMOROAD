package org.kosta.tomoroad.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.StationDAO;
import org.kosta.tomoroad.model.vo.StationVO;
import org.springframework.stereotype.Service;

@Service
public class StationServiceImpl implements StationService {
	@Resource
	private StationDAO dao;

	@Override
	public List<String> getKeyword(String keyword) {
		return dao.getKeyword(keyword);
	}

	@Override
	public List<StationVO> getTourInfoData() {
		System.out.println("service다");
		return dao.getTourInfoData();
	}

	@Override
	public StationVO getDetailInfo(String name) {
		return dao.getDetailInfo(name);
	}
	@Override
	public List<StationVO> getAllStationInfo() throws IOException{
		List<StationVO> list=dao.getAllStationInfo();
		StringBuffer sbuf = new StringBuffer();
		for(int i=0;i<list.size();i++){
		URL url= new URL("http://api.wunderground.com/api/5e1e5a83789f94e3/conditions/lang:KR/q/"+list.get(i).getLat()+","+list.get(i).getLng()+".json");
		HttpURLConnection connection = (HttpURLConnection)url.openConnection();
		InputStream is = connection.getInputStream();
		InputStreamReader isr = new InputStreamReader(is);
		BufferedReader br = new BufferedReader(isr);
		String str;
		while((str=br.readLine()) != null){
			sbuf.append(str+"\r\n");
		}
		String info=sbuf.toString();
		String[] result = info.replaceAll("\"", "").split(",");
			for(int r=0;r<result.length;r++){
				if(result[r].contains("icon_url")){
					String cityurl = result[r].trim();
					list.get(i).setCityurl(cityurl.substring(9));
				}
			}
		}
		return list;
	}
}
