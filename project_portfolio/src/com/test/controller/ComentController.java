package com.test.controller;

import java.net.InetAddress;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.been.ComentBean;
import com.test.service.ComentService;

@Controller
public class ComentController {
	@Autowired
	private ComentService comentService;
	

	// 댓글 조회 - view
	@GetMapping("ComentList")
	public String ComentList(Model model) throws Exception{
		
		// 댓글 조회
		List<ComentBean> ComentList = comentService.comentList();
		model.addAttribute("ComentList", ComentList);
		
		return "coment/coment";
	}
	
	// 댓글 작성 view
//	@GetMapping("ComentWriteView")
//	public String ComentWriteView() throws Exception{
//		return "coment/coment_write";
//	}
	
	// 댓글 작성 처리
	@PostMapping("comentWrite")
	public String comentWrite(ComentBean comentBean, HttpServletRequest req) throws Exception{
		//ip주소를 가져오기위해..
		String ip = req.getRemoteAddr();
		//ip주소를 위의 코드로만 가져오면 아래의 0:0:...처럼 보이기에 아래의 코드를 추가한다. 
		if(ip.equalsIgnoreCase("0:0:0:0:0:0:0:1")){
		    InetAddress inetAddress=InetAddress.getLocalHost();
		    ip=inetAddress.getHostAddress();
		}
		
		// ip 확인 테스트
//		System.out.println("클라이언트IP 주소: "+ ip);
		
		// 가져온 ip를 remote_addr에 셋팅해준다.
		comentBean.setRemote_addr(ip);
		
		comentService.comentWrite(comentBean);
		
		return "redirect:ComentList";
	}
	

	// 댓글 수정
	
	// 댓글 삭제
	
}
