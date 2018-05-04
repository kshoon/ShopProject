package yjc.wdb.shop;

import java.util.ArrayList;
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
import yjc.wdb.domain.Shop;
import yjc.wdb.domain.Wishlist;
import yjc.wdb.dto.InsertDTO;
import yjc.wdb.dto.LoginDTO;
import yjc.wdb.dto.MakDTO;
import yjc.wdb.dto.MakLatLon;
import yjc.wdb.dto.WishDTO;
import yjc.wdb.dto.makLDTO;
import yjc.wdb.service.ShopService;

@Controller
public class ShopController {
	
	@Inject
	private ShopService service;
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String main(HttpSession session, Model model) throws Exception{
		if(session.getAttribute("member")==null) {
			return "login2";
		}
		Member member = (Member) session.getAttribute("member");
		List<WishDTO> wlist = service.getwish(member.getMember_no());
		model.addAttribute("wlist", wlist);
		return "main";
	}
	
	
	@RequestMapping(value="mainSearch", method=RequestMethod.POST)
	@ResponseBody public List<Product> mainSearch(@RequestParam("keyword")String keyword) throws Exception{
		SearchKeyword sk = new SearchKeyword();
		sk.setKeyword(keyword);
		return service.searchPro(sk);
	}
	
	@RequestMapping(value="mainInsertwish", method=RequestMethod.GET)
	public String mainInsertwish(@RequestParam("prod_no")int prod_no,@RequestParam("member_no") int mem_no,RedirectAttributes rttr) throws Exception{
		WishDTO dto = new WishDTO();
		dto.setInsert(prod_no, mem_no);
		service.insertWish(dto);
		List<WishDTO> wlist = getWishList(mem_no);
		
		Member member = new Member();
		member = service.getMem(mem_no);
//		model.addAttribute("wlist", wlist);
//		model.addAttribute("member", member);
		rttr.addFlashAttribute("wlist", wlist);
		rttr.addFlashAttribute("member", member);
	//	LoginDTO Ldto = 
	//	model.addAttribute("dto", Ldto);
		return "redirect:/main";
	}
	@RequestMapping(value="mainSearchBtn", method=RequestMethod.GET)
	public String mainSearchBtn(@RequestParam("keyval")String keyval,@RequestParam("member_no") int mem_no,RedirectAttributes rttr) throws Exception{
		System.out.println(mem_no);
		System.out.println("왔니");
		InsertDTO dto = new InsertDTO();
		dto.setInsert(keyval, mem_no);
		if(service.selectProductList(keyval) == null) {	
			System.out.println("널값");
			service.insertBtnWish(dto);
		}
		System.out.println("2");
		Thread.sleep(1000);
		WishDTO dto2 = new WishDTO();
		dto2 = service.selectProductList(keyval);
		dto2.setMember_no(mem_no);
		System.out.println(dto2.getProduct_no());
		System.out.println(dto2.getMember_no());
		service.insertWish(dto2);
		System.out.println("4");
		List<WishDTO> wlist = getWishList(mem_no);
		
		Member member = new Member();
		//member_no값으로 멤버객체 구하기
		member = service.getMem(mem_no);
//		model.addAttribute("wlist", wlist);
//		model.addAttribute("member", member);
		rttr.addFlashAttribute("wlist", wlist);
		rttr.addFlashAttribute("member", member);
	//	LoginDTO Ldto = 
	//	model.addAttribute("dto", Ldto);
		return "redirect:/main";
	}
	
	@RequestMapping(value="removeWish", method=RequestMethod.GET)
	public String removeWish(int wish_no,@RequestParam("member_no") int mem_no, RedirectAttributes rttr) throws Exception{
		service.deleteW(wish_no, mem_no);
		List<WishDTO> wlist = getWishList(mem_no);
		Member member = new Member();
		member = service.getMem(mem_no);
		rttr.addFlashAttribute("wlist", wlist);
		rttr.addFlashAttribute("member", member);
		return"redirect:/main";
	}
	
	@RequestMapping(value="join", method=RequestMethod.GET)
	public void join() {
	
	}
	@RequestMapping(value="login2", method=RequestMethod.GET)
	public void login2() {
	
	}
//	@RequestMapping(value="join", method=RequestMethod.POST)
//	public void main2(LoginDTO dto, HttpSession session, Model model) throws Exception {
//		Member member = service.login(dto);
//		model.addAttribute("member", member);
//	}
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join2(LoginDTO dto, Model model) throws Exception{
	
		Member member = service.login(dto);
		int mem_no = member.getMember_no();
	//	List<WishDTO> wlist = service.getwish(mem_no);
		List<WishDTO> wlist = getWishList(mem_no);
		
		
		
		model.addAttribute("wlist", wlist);
		model.addAttribute("member", member);
//		rttr.addAttribute("member", member);RedirectAttributes rttr
		return "main";
	}
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String login(LoginDTO dto, HttpSession session) throws Exception {

		System.out.println("loginPost Controller!!");

		String returnURL = "";
		List<WishDTO> wlist;
		if (session.getAttribute("login") != null) {
			//기존 login 세션 값 존재하면?
			session.removeAttribute("login"); //기존 세션 제거
		}
		
		//로그인 성공시 -> Member 객체 반환
		Member vo = service.login(dto);
		System.out.println("Controller의 vo:"+vo);
		System.out.println("Controller - vo의 member_no:"+vo.getMember_no());
		if (vo != null) { //로그인 성공
			session.setAttribute("login", vo); //세션에 login이라는 이름으로 Member객체 저장!
			session.setAttribute("member", vo);
			wlist = getWishList(vo.getMember_no());
			session.setAttribute("wlist", wlist);
			returnURL = "redirect:/main";
		} else { //로그인 실패
			returnURL = "redirect:/login2"; //로그인 폼 다시 감
		}
		
		return returnURL;
		
	}
	@RequestMapping(value="logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login2";
	}
	
	@RequestMapping(value="mak", method=RequestMethod.GET)
	@ResponseBody public List<MakLatLon> mak(@RequestParam("prod_no")int prod_no, double lat1, double lon1) throws Exception{
		makLDTO makl = new makLDTO();
		List<MakDTO> makL = service.makList(prod_no);

		List<MakLatLon> Mlalo = new ArrayList<MakLatLon>();		
		MakLatLon malalo;
		for(int i =0; i<makL.size();i++) {
		double lat2 = makL.get(i).getShop_gps_latitude();
		double lon2 = makL.get(i).getShop_gps_longitude();
		double met = makl.distance(lat1, lon1, lat2, lon2);
		malalo = new MakLatLon();
		malalo.setLat(lat2);
		malalo.setLon(lon2);
		malalo.setDto(makL.get(i));
		malalo.setMet(met);
		Mlalo.add(malalo);
		}//상품이 있는 매장들  lat1,lon1이 자기 위치오면 자기 위치랑 거리계산한 배열이 metL, makL은 매장들 담겨있는 리스트

		return Mlalo;
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
	
	@RequestMapping(value="fGPS", method=RequestMethod.GET)
	@ResponseBody public List<MakLatLon> fGPS(@RequestParam("member_no")int mem_no, double lat, double lon) throws Exception{
		makLDTO makl = new makLDTO();
		List<MakDTO> makL = service.shopList();

		List<MakLatLon> Mlalo = new ArrayList<MakLatLon>();
		List<MakLatLon> Mlalo2 = new ArrayList<MakLatLon>();	
		MakLatLon malalo;
		MakLatLon malalo2;
		for(int i =0; i<makL.size();i++) {
		double lat2 = makL.get(i).getShop_gps_latitude();
		double lon2 = makL.get(i).getShop_gps_longitude();
		double met = makl.distance(lat, lon, lat2, lon2);
			if(met<100000.0) {
					malalo = new MakLatLon();
					malalo.setLat(lat2);
					malalo.setLon(lon2);
					malalo.setDto(makL.get(i));
					malalo.setMet(met);
					Mlalo.add(malalo);
			}
		}//상품이 있는 매장들  lat1,lon1이 자기 위치오면 자기 위치랑 거리계산한 배열이 metL, makL은 매장들 담겨있는 리스트
		//lat,l
		List<WishDTO> list = getWishList(mem_no);
		for(int i =0; i<list.size();i++) {
			if(Mlalo.get(i).getDto().getProduct_no()==list.get(i).getProduct_no()) {
				malalo2 = new MakLatLon();
				malalo2.setLat(Mlalo.get(i).getLat());
				malalo2.setLon(Mlalo.get(i).getLon());
				malalo2.setMet(Mlalo.get(i).getMet());
//				malalo2.setwish
				Mlalo2.add(malalo2);
			}
		}
		
		return Mlalo;
	}

	private List<WishDTO> getWishList(int mem_no) throws Exception{
			return service.getwish(mem_no);			
	}
	
}
