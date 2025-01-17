package com.myproject.my.member.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.myproject.my.member.service.MemberService;
import com.myproject.my.member.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Value("#{util['file.upload.path']}")
	private String CURR_IMAGE_PATH;
	
	@Value("#{util['file.download.path']}")
	private String WEB_PATH;
	
	
	@RequestMapping("/registView")
	public String registView() {
		return "member/registView";
	}
	
	@RequestMapping("/registDo")
	public String registDO(MemberVO vo) {
		
//		if (vo.pw != pwCheck) {
//			System.out.println("비밀번호가 다릅니다");
//		}
		try {
			vo.setMemPw(passwordEncoder.encode(vo.getMemPw()));
			memberService.registMember(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
	
	@RequestMapping("/loginView")
	public String loginView() {
		return "member/loginView";
	}
	
	@RequestMapping("/loginDo")
	public String loginDo(MemberVO vo, boolean remember, HttpSession session, HttpServletResponse response) throws Exception {
		MemberVO login = memberService.loginMember(vo);
		boolean match = passwordEncoder.matches(vo.getMemPw(), login.getMemPw());
		if (login == null || !match) {
			return "redirect:/loginView";
		}
		session.setAttribute("login", login);
		if(remember) {
			// 쿠키생성
			Cookie cookie = new Cookie("rememberId", login.getMemId());
			response.addCookie(cookie);
		}else {
			// 쿠키 삭제
			// 동일한 key 값을 가지는 쿠키의 유효시간을 0으로
			Cookie cookie = new Cookie("rememberId", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		return "redirect:/";
	}
	
	@RequestMapping("/logoutDo")
	public String logoutDo(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		
		if(session.getAttribute("login") == null) {
			return "redirect:/loginView";
		}
		return "member/mypage";
	}
	@ResponseBody
	@PostMapping("/files/upload")
	public Map<String, Object> uploadFiles(
				HttpSession session
			  , @RequestParam("uploadImage") MultipartFile uploadImage) throws Exception{
		MemberVO vo = (MemberVO) session.getAttribute("login");
		String imgPath = memberService.profileUpload(vo, CURR_IMAGE_PATH, WEB_PATH, uploadImage);
		Map<String, Object> map = new HashMap<>();
		map.put("message", "success");
		map.put("imagePath", imgPath);
		return map;
	}
    @ResponseBody
    @RequestMapping("/idCheck")
    public Map<String, Object> checkId(@RequestParam("memId") String memId){
    	Map<String, Object> map = new HashMap<>();
    	int cnt = memberService.idCheck(memId);
		map.put("cnt", cnt);
        return map;
    }
    @ResponseBody
    @RequestMapping("/changeProfile")
    public Map<String, Object> changeProfile(HttpSession session
    									  , @RequestBody MemberVO vo){
    	MemberVO log = (MemberVO) session.getAttribute("login");
    	vo.setMemId(log.getMemId());
    	MemberVO result = memberService.changeProfile(vo);
    	log.setMemNm(result.getMemNm());
    	log.setMemEmail(result.getMemEmail());
    	Map<String, Object> map = new HashMap<>();
    	map.put("result",result);
    	return map;
    }
}























