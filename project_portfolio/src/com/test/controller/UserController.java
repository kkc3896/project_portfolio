package com.test.controller;







import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.been.UserBean;
import com.test.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	//회원가입_join_view
	@GetMapping(value = "User_Join_view")
	public String User_Join_view(UserBean userBean) {		
		System.out.println("join.jsp실행");
		return "user/join";
	}
	
	// 회원가입_join_pro
	@PostMapping(value = "User_Join_pro")
	public String User_Join_pro(UserBean userBean, Model model, String user_id) throws Exception {

		int idCheck = userService.id_Check(user_id);
		// idCheck가 1이면 중복된 아이디가 있다는 것이니 회원가입 화면으로 보내자.
		try {
			if(idCheck == 1) {
				System.out.println("중복된아이디가 있어 리턴하지 못한다.");
				return "user/join";
			} else {
				userService.user_Join(userBean);
				model.addAttribute("userBean", userBean);
				return "user/join_pro";
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("오류다~~~~~~~~~");
			e.printStackTrace();
		}
		
		return "user/join_pro";
	}
	
	//로그인_login_view
	@GetMapping(value = "User_Login_view")
	public String User_Login_view(UserBean userBean ) throws Exception {
		System.out.println("login.jsp실행");
		return "user/login";
	}
	
	//로그인 처리
	@PostMapping(value = "User_Login_pro")
	public String User_Login_pro(UserBean userBean, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		HttpSession session = req.getSession();
		
		UserBean userBean2 = null;
		userBean2 = userService.user_Login(userBean);
		
		if(userBean2 == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			session.setAttribute("member", userBean2);
		}
		
		return "user/login_pro";
	}
	
	// 로그아웃_logout - 로그아웃은 별도의 mapper, dao, service 없이 컨트롤러만 작성하고 view단에서 적용시킨다, 로그아웃시 홈 메인화면으로 넘어간다
	@GetMapping("User_Logout")
	public String User_Logout(HttpSession session) {
		session.invalidate();
		
		System.out.println("로그아웃 컨트롤러 실행");
		System.out.println("로그아웃 컨트롤러 실행");
		System.out.println("로그아웃 컨트롤러 실행");
		return "redirect:/";
	}
	
	// 회원정보수정페이지를 보여주는 컨트롤러
	@GetMapping("Join_Update_View")
	public String join_Update_View() throws Exception{
		
		return "user/join_update";
	}
	
	// 회원정보수정 처리를 하는 컨트롤러
	@PostMapping("Join_Update_Pro")
	public String join_Update_Pro(UserBean userBean, HttpSession session) throws Exception{
		userService.join_Update(userBean);
		
		//회원정보 수정후 로그아웃이 되게 하기 위함
		session.invalidate();
			
		return "user/join_update_pro";	
	}
	
	// 회원 탈퇴		//추후에 본인계정 스스로 탈퇴가능, 관리자 계정에서는 유저관리할 수 있게 별도로 만들자. 
	@GetMapping("user_Delete")
	public String user_Delete(@RequestParam String user_id,
							   Model model,
							   HttpSession session) throws Exception {
		
		userService.user_Delete(user_id);
		model.addAttribute("delete_user_id", user_id);
		
		// 로그인 상태를 끊기위해..
		session.invalidate();
		
		return "redirect:/";	
	}
	
	// 아이디중복확인
	@PostMapping("id_Check")
	@ResponseBody
	public int id_Check(String user_id, Model model) throws Exception {
		int idCheck = userService.id_Check(user_id);
		model.addAttribute("idCheck", idCheck);

		return idCheck;

	}
	
	
}
