package yjc.wdb.shop;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import yjc.wdb.domain.Member;
import yjc.wdb.dto.LoginDTO;
import yjc.wdb.service.MemberService;

@Controller
public class MemberController {

	@Inject
	private MemberService service;


	/* 로그인 - 폼 */
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void login() {
	}	
	@ResponseBody
	@RequestMapping(value="loginProcess", method=RequestMethod.GET)
	public Member login(LoginDTO dto) throws Exception {
	      System.out.println(dto.getMember_id());
	      Member vo = new Member();
	      
	      vo = service.login(dto);
	      
	      
	      if (vo != null) {
	         System.out.println("로그인 success라고 합니다");
	         vo.setResult("success");
	      } else {
	         System.out.println("널인가");
	         vo.setResult("failed");
	      }
	      
	      return vo;
	   }
	
} //..end of MemberController!