package com.test.service;

import java.io.IOException;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.been.CrawlingBean;
import com.test.dao.CrawlingDao;

@Service
public class CrawlingService {
	@Autowired
	private CrawlingDao crawlingDao;

	// 입력
	public void Crawling_Write(CrawlingBean crawlingBean) throws Exception {
		// 음원사이트 지니 실시간차트 순위 가져올 사이트 주소
		String url = "https://www.genie.co.kr/";

		// JSOUP 라이브러리를 통해 사이트 접속되면, 그 사이트 전체 HTML 소스 저장할 변수
		Document doc = null;

		try {
			// Document에는 페이지의 전체 소스가 저장된다
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 지니 웹 페이지의 전체 소스 중 일부 태그를 선택하기 위해 사용
		// <tr class"list"> 이 태그 내에서 있는 HTML 소스만 element에 저장된다.
		Elements element = doc.select("tr.list");
		for (Element element1 : element) {

			String c_title = element1.select("a.title.ellipsis").text();	// 제목
			String c_ranking = element1.select("td.number").text();			// 순위 text를 크롤링하기위해 String변수를 만들고
			int c_ranking2 = Integer.parseInt(c_ranking);					// 숫자형으로 변환시켜 준다.
			String c_img = element1.select("td a img").attr("src");			// 이미지 링크주소 

//			System.out.print(element1.select("td.number").text() + "\t");	// 순위
//			System.out.println(element1.select("a.title.ellipsis").text() + "\n"); // 제목
//			System.out.println(element1.select("td a img").attr("src") + "\n");
			
			crawlingBean.setC_ranking(c_ranking2);
			crawlingBean.setC_title(c_title);
			crawlingBean.setC_img("https:" + c_img);		

			crawlingDao.Crawling_Write(crawlingBean);
		}

	}
	
	// 조회
	public List<CrawlingBean> Crawling_List() throws Exception {
		
	    return crawlingDao.Crawling_List();
	}

}
