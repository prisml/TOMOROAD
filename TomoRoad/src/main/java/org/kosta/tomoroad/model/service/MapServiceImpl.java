package org.kosta.tomoroad.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.MapDAO;
import org.kosta.tomoroad.model.vo.MapVO;
import org.springframework.stereotype.Service;

@Service
public class MapServiceImpl implements MapService {
	@Resource(name="mapDAOImpl")
	private MapDAO dao;
	/* (non-Javadoc)
	 * @see org.kosta.tomoroad.model.service.MapService#getAllStationInfo()
	 */
	@Override
	public List<MapVO> getAllStationInfo(String name){ //LIST를 받아오기위한 서비스
		List<MapVO> list=dao.getAllStationInfo(name);
		return list;
	}
	@Override
	public String weatherInfo(MapVO vo) throws IOException{//날씨정보를 받아오기위한 서비스
		String cityurl = "";
		StringBuffer sbuf = new StringBuffer();
		URL url= new URL("http://api.wunderground.com/api/0e50036e3457fdb4/conditions/lang:KR/q/"
		+vo.getLat()+","+vo.getLng()+".json");
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
					cityurl = result[r].trim().substring(9);
				}
		}
		return cityurl;
	}
}

