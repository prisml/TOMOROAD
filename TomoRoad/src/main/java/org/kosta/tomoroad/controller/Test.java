package org.kosta.tomoroad.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class Test {
	public static void main(String[] args) throws IOException {
		StringBuffer sbuf = new StringBuffer();
		URL url= new URL("http://api.wunderground.com/api/5e1e5a83789f94e3/conditions/lang:KR/q/38.211553,128.591290.json");
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
					System.out.println(cityurl.substring(9));
				}
		}
	}
}
