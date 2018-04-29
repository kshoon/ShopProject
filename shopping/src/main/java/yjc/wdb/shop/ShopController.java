package yjc.wdb.shop;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import yjc.wdb.domain.Member;
import yjc.wdb.domain.Product;
import yjc.wdb.domain.SearchKeyword;
import yjc.wdb.dto.LoginDTO;
import yjc.wdb.service.ShopService;

@Controller
public class ShopController {
	
	@Inject
	private ShopService service;
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public void main(Member member) {
		
	
	}
	
	
	@RequestMapping(value="mainSearch", method=RequestMethod.POST)
	@ResponseBody public List<Product> mainSearch(@RequestParam("keyword")String keyword) throws Exception{
		SearchKeyword sk = new SearchKeyword();
		sk.setKeyword(keyword);
		return service.searchPro(sk);
	}
	
	@RequestMapping(value="join", method=RequestMethod.GET)
	public void join() {
	
	}
//	@RequestMapping(value="join", method=RequestMethod.POST)
//	public void main2(LoginDTO dto, HttpSession session, Model model) throws Exception {
//		Member member = service.login(dto);
//		model.addAttribute("member", member);
//	}
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join2(Member member, Model model) {
		member.setMember_no(2);
		model.addAttribute("member", member);
//		rttr.addAttribute("member", member);RedirectAttributes rttr
		return "main";
	}
	
	@RequestMapping(value="imgTest", method=RequestMethod.GET)
	public void imgTest() {
	
	}
	
	@RequestMapping(value="map", method=RequestMethod.GET)
	public String map() {
		return "/map/mapTest";
	}
	@RequestMapping(value="map2", method=RequestMethod.GET)
	public String map2() {
		return "/map/mapTest2";
	}
	
	@RequestMapping(value="registerform1", method=RequestMethod.GET)
	public String registerform1() {
		return"/register/registerform1";
	}
	@RequestMapping(value="registerform2", method=RequestMethod.GET)
	public String registerform2() {
		return"/register/registerform2";
	}
	
	@RequestMapping(value="registerform3", method=RequestMethod.GET)
	public String registerform3() {
		return"/register/registerform3";
	}
	
	
}
