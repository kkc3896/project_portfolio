package com.test.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.service.CrawlingService;


@Controller
public class CrawlingController {
	@Autowired
	private CrawlingService crawlingService;
	
	@GetMapping(value = "crawling1")
	public void Crawling(String url) throws IOException {
		// 잡코리아
		String URL_job = "https://www.jobkorea.co.kr/recruit/joblist?menucode=local&localorder=1";
		
		// 원티드 
		String URL_one = "https://www.wanted.co.kr/wdlist/518/873?country=kr&job_sort=job.latest_order&years=-1&locations=all";
		
		Document doc = Jsoup.connect(URL_one).get();
		
//		doc.text();
//		System.out.println(doc.html());
//		doc.html();
		
		/**/
		
		Elements elem = doc.select("원하는태그명");
		
		System.out.println("==================================");
		
//		Iterator<Element> ie1 = elem.select("").iterator();
		Iterator<Element> ie1 = elem.iterator();
		while(ie1.hasNext()) {
			System.out.println(ie1.next().text());
		}
		System.out.println("==================================");
		System.out.println("크롤링 끝");
		
	}
	
	
}
