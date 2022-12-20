package com.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		System.out.println("index");
		return "index";
	}
	
	@GetMapping(value = "header")
	public String header() {
		System.out.println("header.jsp실행");
		return "header/header";
	}
	
	@GetMapping(value = "footer")
	public String footer() {
		System.out.println("footer.jsp실행");
		return "footer/footer";
	}
	
	@GetMapping(value = "main")
	public String main() {
		System.out.println("main.jsp실행");
		return "main/main";
	}
	
	/* 레이아웃 시에만 사용 실제 사용은 JobController.java에 있음
	@GetMapping(value = "job")
	public String job() {
		System.out.println("job.jsp실행");
		return "board/job";
	}
	*/
	@GetMapping(value = "chart")
	public String chart() {
		System.out.println("chart.jsp실행");
		return "chart/chart";
	}
	
	@GetMapping(value = "crawling")
	public String crawling() {
		System.out.println("crawling.jsp실행");
		return "crawling/crawling";
	}
}
