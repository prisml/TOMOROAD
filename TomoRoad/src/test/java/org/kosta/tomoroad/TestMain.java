package org.kosta.tomoroad;

import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;

public class TestMain {
	public static void main(String[] args) throws FileNotFoundException {
/*		String test = "서울역-용산역[16]-영등포역-(안양역)-수원역-(오산역)-(서정리역)-평택역-(성환역)-천안역-(소정리역)-(전의역)-조치원역-(부강역)-(신탄진역)-대전역-(옥천역)-(이원역)-(지탄역)-(심천역)-(각계역)-영동역-(황간역)-(추풍령역)-김천역-구미역-(사곡역)-(약목역)-왜관역-(신동역)-대구역-동대구역-(경산역)-(남성현역)-(청도역)-(상동역)-밀양역-(삼랑진역)-(원동역)-(물금역)-(화명역)-구포역-(사상역)-부산역-서대전역-(계룡역)-(연산역)-논산역-(강경역)-(함열역)-익산역-김제역-신태인역-정읍역-(백양사역)-장성역-광주송정역-나주역-(다시역)-함평역-(무안역)-(몽탄역)-일로역-(임성리역)-목포역-익산역-(삼례역)-전주역-(임실역)-오수역-남원역-곡성역-구례구역-순천역-여천역-여수엑스포역-천안역-아산역-온양온천역-[17]-(도고온천역)-신례원역-예산역-(삽교역)-홍성역-광천역-(청소역)-대천역-웅천역-(판교역)-서천역-장항역-군산역-(대야역)-익산역-청량리역-(덕소역)-양평역-(용문역)-(지평역)-(석불역)-(일신역)-(매곡역)-(양동역)-(삼산역)-(동화역)-원주역-(반곡역)-(신림역)-제천역-단양역-(희방사역)-풍기역-영주역-안동역-의성역-(탑리역)-(화본역)-(신녕역)-(북영천역)-영천역-(건천역)-(서경주역)-경주역-부전역-(센텀역)-신해운대역-기장역-(좌천역)-(월내역)-(남창역)-(덕하역)-태화강역-호계역-(불국사역)-경주역-안강역-포항역-조치원역-오송역-청주역-오근장역-청주공항역-증평역-음성역-주덕역-충주역-(삼탄역)-김천역-(옥산역)-(청리역)-상주역-(함창역)-점촌역-용궁역-(개포역)-예천역-영주역-(삼랑진역)-(한림정역)-진영역-(진례역)-창원중앙역-창원역-마산역-중리역-함안역-군북역-반성역-진주역-(완사역)-북천역-(횡천역)-하동역-(진상역)-광양역-순천역-벌교역-조성역-예당역-득량역-보성역-(명봉역)-이양역-능주역-화순역-효천역-서광주역-광주송정역-광주송정역-(극락강역)-광주역-하양역-(북영천역)-영천역-제천역-(쌍룡역)-영월역-예미역-민둥산역-사북역-고한역-태백역-영주역-봉화역-춘양역-(임기역)-(현동역)-(분천역)-(양원역)-(승부역)-석포역-(철암역)-(동백산역)-도계역-(신기역)-동해역-묵호역-정동진역-강릉역[18]";
		test= test.replace("(", "");
		test= test.replace(")", "");
		test= test.replace("[", "");
		test= test.replace("]", "");
		test= test.replace("0", "");
		test= test.replace("1", "");
		test= test.replace("2", "");
		test= test.replace("3", "");
		test= test.replace("4", "");
		test= test.replace("5", "");
		test= test.replace("6", "");
		test= test.replace("7", "");
		test= test.replace("8", "");
		test= test.replace("9", "");
		String arr[] = test.split("-");
		Set<String> set = new HashSet<String>();
		for(int i=0;i<arr.length;i++){
			set.add(arr[i]);
		}
		Iterator<String> it = set.iterator();
		List<String> list = new ArrayList<String>();
		while(it.hasNext()){
			list.add(it.next());
		}
		Collections.sort(list, new Comparator<String>(){
		      public int compare(String obj1, String obj2)
		      {
		            return obj1.compareToIgnoreCase(obj2);
		      }
		});
		
		for(int i=0;i<list.size();i++){
			System.out.print(list.get(i) + " ");
			if(i%34==0)System.out.println("\n");
			
		}*/
		Map<String, Integer> map[] = new HashMap[2];
		map[0] = new HashMap<String, Integer>();
		map[1] = new HashMap<String, Integer>();
		map[0].put("1", 1);
		map[0].put("2", 2);
		map[1].put("1", 1);
		map[1].put("2", 2);
		System.out.println(map[0].get("1")+" "+map[1].get("2"));
	}
}
