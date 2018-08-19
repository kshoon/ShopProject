package yjc.wdb.shop;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import yjc.wdb.domain.Alram;
import yjc.wdb.domain.Bookmark;
import yjc.wdb.domain.Member;
import yjc.wdb.domain.Product;
import yjc.wdb.domain.SearchKeyword;
import yjc.wdb.domain.Shop;
import yjc.wdb.domain.Wishlist;
import yjc.wdb.dto.GpsDTO;
import yjc.wdb.dto.InsertDTO;
import yjc.wdb.dto.LoginDTO;
import yjc.wdb.dto.MakDTO;
import yjc.wdb.dto.MakLatLon;
import yjc.wdb.dto.WishDTO;
import yjc.wdb.dto.alrListDTO;
import yjc.wdb.dto.fMapDTO;
import yjc.wdb.dto.makLDTO;
import yjc.wdb.service.ShopService;

@Controller
public class ShopController {
	
	@Inject
	private ShopService service;
	
	@RequestMapping(value="asdf")
	public void asdf() {
		
	}
	
	//*************** https://wdbshop.zz.am/shop/main **********/
	@RequestMapping(value="main", method=RequestMethod.GET)		//메인(로그인 전, 판매자, 구매자)
	public String main(HttpSession session, Model model) throws Exception{
		if(session.getAttribute("member")==null) {
			return "login2";
		}
		Member member = (Member) session.getAttribute("member");
		if(member.getMember_category()==3) { //세션 저장된 멤버가 판매자라면
			List<Shop> slist = service.getShopMem(member.getMember_no());
			Shop shop = slist.get(0);
			model.addAttribute("shop", shop);
			return "mainS2";
		}
		List<WishDTO> wlist = service.getwish(member.getMember_no());
		model.addAttribute("wlist", wlist);
		return "main";
	}
	
	
	@RequestMapping(value="mainS", method=RequestMethod.GET)		//판매자 메인
	public String mainS(HttpSession session, Model model) throws Exception{
		Member member = (Member) session.getAttribute("member");
		List<Product> plist = service.getShopProd(member.getMember_no());
		List<Shop> slist = service.getShopMem(member.getMember_no());
		Shop shop = slist.get(0);
		model.addAttribute("plist", plist);
		model.addAttribute("shop", shop);
		System.out.println(shop.getShop_name());
		return "mainS";
	}
	
	@RequestMapping(value="mainSearch", method=RequestMethod.POST)		// 검색창 결과
	@ResponseBody public List<Product> mainSearch(@RequestParam("keyword")String keyword) throws Exception{
		SearchKeyword sk = new SearchKeyword();
		sk.setKeyword(keyword);
		return service.searchPro(sk);
	}
	
	@RequestMapping(value="fMap", method=RequestMethod.GET)		// 메인에서 지도에 뛰울 모든 매장
	@ResponseBody public List<fMapDTO> fMap(HttpSession session) throws Exception{
		Member member = (Member) session.getAttribute("member");		//로그인한 회원정보
		int mem_no =  member.getMember_no();							//회원번호
		List<Shop> slist = service.getShop();							//모든 매장 정보
		 								//결과 dto,매장정보,매장이파는물품중 위시list
		List<fMapDTO> flist = new ArrayList<fMapDTO>();					//결과dto를 담을 리스트

		for(int i =0; i<slist.size(); i++) {
			List<String> pnlist = service.ShopPName(slist.get(i).getShop_no(), mem_no);	//스트링리스트
			fMapDTO fMapdto= new fMapDTO();
			fMapdto.setShop(slist.get(i));
			fMapdto.setPnlist(pnlist);
			System.out.println(slist.get(i).getShop_name());
			flist.add(i, fMapdto);

		}
		return flist;
	}
	
	@RequestMapping(value="mainInsertwish", method=RequestMethod.GET)	//위시 추가 (검색창 밑에서)
	public String mainInsertwish(HttpSession session, @RequestParam("prod_no")int prod_no,RedirectAttributes rttr) throws Exception{
		System.out.println("mainInsertwish:"+prod_no);
		Member member= (Member) session.getAttribute("member");
		int mem_no = member.getMember_no();
		WishDTO dto = new WishDTO(prod_no, mem_no);
		int wish_no = 0;

		if(checkWishList(mem_no, prod_no) != null) {		//있는지 확인여부
			wish_no = checkWishList(mem_no, prod_no).getWishlist_no();
			service.updateWish(wish_no);	//있을 시 날짜갱신
		}else {
			service.insertWish(dto);		//없을 시 추가
		}
		service.updateNos(prod_no);//검색횟수
		List<WishDTO> wlist = getWishList(mem_no);
		rttr.addFlashAttribute("wlist", wlist);


		return "redirect:/main";
	}
	@RequestMapping(value="mainSearchBtn", method=RequestMethod.GET)		//위시 추가(버튼 클릭시)
	public String mainSearchBtn(HttpSession session, @RequestParam("keyval")String keyval, RedirectAttributes rttr) throws Exception{
		Member member= (Member) session.getAttribute("member");
		int mem_no = member.getMember_no();
		
		System.out.println("mainSearchBtn:"+keyval);
		
		InsertDTO dto = new InsertDTO(keyval, mem_no);
		if(service.selectProductList(keyval) == null) {	
			service.insertBtnWish(keyval);
		}

		WishDTO dto2 = new WishDTO();
		dto2 = service.selectProductList(keyval);
		dto2.setMember_no(mem_no);

		int prod_no = dto2.getProduct_no();
		int wish_no = 0;
		System.out.println("prod"+prod_no);

		if(checkWishList(mem_no, prod_no)!=null) {
			wish_no = checkWishList(mem_no, prod_no).getWishlist_no();
			System.out.println(wish_no);
			service.updateWish(wish_no);
		}else {
		service.insertWish(dto2);
		}
		service.updateNos(prod_no);//검색횟수
		List<WishDTO> wlist = getWishList(mem_no);

		rttr.addFlashAttribute("wlist", wlist);

		return "redirect:/main";
	}
	
	@RequestMapping(value="removeWish", method=RequestMethod.GET)		//위시리스트 삭제
	public String removeWish(HttpSession session, int wish_no, RedirectAttributes rttr) throws Exception{
		Member member= (Member) session.getAttribute("member");
		int mem_no = member.getMember_no();
		
		service.deleteW(wish_no, mem_no);
		List<WishDTO> wlist = getWishList(mem_no);

		rttr.addFlashAttribute("wlist", wlist);

		return"redirect:/main";
	}
	
	@RequestMapping(value="join", method=RequestMethod.GET)		//옛날 로그인화면
	public void join() {
	
	}
	@RequestMapping(value="login2", method=RequestMethod.GET)	//현재 로그인화면
	public void login2() {
	
	}

	@RequestMapping(value="join", method=RequestMethod.POST)	//옛날 로그인2
	public String join2(LoginDTO dto, Model model) throws Exception{
	
		Member member = service.login(dto);
		int mem_no = member.getMember_no();
		List<WishDTO> wlist = getWishList(mem_no);
		
		
		model.addAttribute("wlist", wlist);
		model.addAttribute("member", member);
		return "main";
	}
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)	//모바일 로그인
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
	@RequestMapping(value="logout")								//로그아웃
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login2";
	}
	
	@RequestMapping(value="mak", method=RequestMethod.GET)		//근처 매장 갯수, 매장정보/현재좌표와의 거리/상품정보  리턴
	@ResponseBody 
	public List<MakLatLon> mak(@RequestParam("prod_no")int prod_no, double lat1, double lon1) throws Exception{
			makLDTO makl = new makLDTO();
				List<MakDTO> makL = service.makList(prod_no);		//물품을 가진 매장리스트 추출
					List<MakLatLon> Mlalo = new ArrayList<MakLatLon>();		
		MakLatLon malalo;
		for(int i =0; i<makL.size();i++) {
		double lat2 = makL.get(i).getShop_gps_latitude();
		double lon2 = makL.get(i).getShop_gps_longitude();
		double met = makl.distance(lat1, lon1, lat2, lon2);	// 47 == 4.7km
		malalo = new MakLatLon();
		malalo.setLat(lat2);
		malalo.setLon(lon2);
		malalo.setDto(makL.get(i));
		malalo.setMet(met);
		Mlalo.add(malalo);
		}//상품이 있는 매장들  lat1,lon1이 자기 위치오면 자기 위치랑 거리계산한 배열이 metL, makL은 매장들 담겨있는 리스트
		return Mlalo;
	}
	@RequestMapping(value="tMap", method=RequestMethod.GET)		// 지도에 뛰울 지정 매장
	@ResponseBody public fMapDTO tMap(HttpSession session, int shop_no) throws Exception{
		Member member = (Member) session.getAttribute("member");		//로그인한 회원정보
		int mem_no =  member.getMember_no();							//회원번호
		System.out.println(shop_no);
		Shop shop = service.getShopOne(shop_no);							//모든 매장 정보
		 								//결과 dto,매장정보,매장이파는물품중 위시list

		List<String> pnlist = service.ShopPName(shop_no, mem_no);	//스트링리스트
		fMapDTO fMapdto= new fMapDTO();
		fMapdto.setShop(shop);
		fMapdto.setPnlist(pnlist);

		return fMapdto;
	}
	@RequestMapping(value="bMN", method=RequestMethod.GET)		// 북마크 추가
	@ResponseBody void bMN(HttpSession session, int shop_no) throws Exception{
		Member member = (Member) session.getAttribute("member");		//로그인한 회원정보
		int mem_no =  member.getMember_no();							//회원번호
		service.insertBm(mem_no,shop_no);
	}
	@RequestMapping(value="bMI", method=RequestMethod.GET)		// 북마크 삭제
	@ResponseBody void bMI(HttpSession session, int shop_no) throws Exception{
		Member member = (Member) session.getAttribute("member");		//로그인한 회원정보
		int mem_no =  member.getMember_no();							//회원번호
		service.deleteBm(mem_no,shop_no);
	}
	@RequestMapping(value="sBM", method=RequestMethod.GET)		// 북마크 조회
	@ResponseBody String sBM(HttpSession session, int shop_no) throws Exception{
		Member member = (Member) session.getAttribute("member");		//로그인한 회원정보
		int mem_no =  member.getMember_no();			//회원번호
		
		int cnt = service.selectBm1(mem_no);
				
		String result = "fail";
		if(cnt>0) {
			List<Bookmark> blist = service.selectBm(mem_no);
			for(int i=0; i<blist.size(); i++) {
				if(blist.get(i).getShop_no() == shop_no) {
					result="success";
					break;
				}else {
					result="fail";
				}
			}
		}else {
			result="fail";
		}
		return result;
	}
	@RequestMapping(value="imgTest", method=RequestMethod.GET)		//무쓸모
	public void imgTest() {
	
	}
	
	@RequestMapping(value="map", method=RequestMethod.GET)			//무쓸모2
	public String map() {
		return "/map/mapTest";
	}
	@RequestMapping(value="map2", method=RequestMethod.GET)			//무쓸모3
	public String map2() {
		return "/map/mapTest2";
	}
	
	@RequestMapping(value="registerform1", method=RequestMethod.GET) //회원가입1
	public String registerform1() {
		return"/register/registerform1";
	}
	@RequestMapping(value="registerform2", method=RequestMethod.GET) //회원가입2
	public String registerform2() {
		return"/register/registerform2";
	}
	
	@RequestMapping(value="registerform3", method=RequestMethod.GET) //회원가입3
	public String registerform3() {
		return"/register/registerform3";
	}
	
	@RequestMapping(value="shopOne", method=RequestMethod.GET)		//최단거리 넘어가는 부분
	@ResponseBody public Shop shopOne (int shop_no, Model model) throws Exception{
		Shop shop = service.getShopOne(shop_no);
		
		return shop;
	}
	@RequestMapping(value="prodOne", method=RequestMethod.GET)		//최단거리 넘어가는 부분
	@ResponseBody public Product prodOne (int prod_no, Model model) throws Exception{
		Product prod = service.getProdOne(prod_no);
		
		return prod;
	}
	
	@RequestMapping(value="insertAlrTest", method=RequestMethod.GET)		//알람?
	@ResponseBody public void InsertAlrTest (String keyval) throws Exception{
		int product_no = service.prodName(keyval);
		String content = keyval + "를 원하는 손님이 나타났습니다.";
		Alram alram = new Alram();
		alram.setMember_no(3);
		alram.setProduct_no(product_no);
		alram.setAlram_content(content);
		alram.setAlram_distance(3000);
		service.InsAlrTest(alram);
	}
	
	@RequestMapping(value="remAll", method=RequestMethod.GET)		//위시리스트 삭제
	@ResponseBody public void remAlll(HttpSession session, int wish_no) throws Exception{
		Member member= (Member) session.getAttribute("member");
		int mem_no = member.getMember_no();	
		service.deleteW(wish_no, mem_no);
	}
	
	@RequestMapping(value="modSearch", method=RequestMethod.GET)		//매장지정 검색
	@ResponseBody public List<Shop> modSearch(int option, String keyval) throws Exception{
		String opt;
		if(option == 1) {
			opt = "shop_name";
		}else{
			opt = "addr_dong";
		}
		return service.modSearch(opt, keyval); 
		
	}
	
	@RequestMapping(value="bookList", method=RequestMethod.GET)
	@ResponseBody public List<Shop> bookList(HttpSession session) throws Exception{
		Member member= (Member) session.getAttribute("member");
		int mem_no = member.getMember_no();
		List<Shop> bookLi;
		if(service.selectBm1(mem_no)>0) {
			bookLi = service.selectBookSN(mem_no);
		}else {
			bookLi = null;
		}
		return bookLi;
	}
	
	@RequestMapping(value="booklatlon", method=RequestMethod.GET)
	@ResponseBody public GpsDTO booklatlon(int shop_no) throws Exception{
	
		
		return service.selectGps(shop_no);
	}
	@RequestMapping(value="fGPS", method=RequestMethod.GET)			//안쓰이는듯함
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
	
	@RequestMapping(value="wishNew", method=RequestMethod.GET)			//안쓰이는듯함
	@ResponseBody List<WishDTO> wishNew(HttpSession session, int a, int b, Model model) throws Exception{
		Member member = (Member) session.getAttribute("member");
		int member_no = member.getMember_no();
		String pName = "b.product_name";
		String wishL = "a.wishList_date";
		switch(a) {
		case 0 :
			pName = null;
			break;
		case 1 :
			pName += " asc";
			break;
		case 2 :
			pName += " desc";
			break;
		}
		switch(b) {
		case 0 :
			wishL = null;
			break;
		case 1 :
			wishL += " asc";
			break;
		case 2 :
			wishL += " desc";
			break;
		}
		String order=pName+","+wishL;
		List<WishDTO> wlist = service.wishNew(member_no, order);
		for(int i =0; i<wlist.size();i++) {
			System.out.println(wlist.get(i).getProduct_name());
		}
		model.addAttribute("wlist", wlist);
		return wlist;
	}
	
	@RequestMapping(value="distance", produces = "application/text; charset=utf8")		// 거리후 근처 상점 소팅
	@ResponseBody public String distance(double lat, double lon, String callback,
			@RequestParam(value="prod_name", required=false) String prod_name,@RequestParam(value="prod_no", defaultValue = "0") int prod_no) throws Exception{
		System.out.println("dis"+prod_name);
		if(prod_name != null) {
			if(service.selectProductList(prod_name) == null) {	
				service.insertBtnWish(prod_name);
			}
			prod_no = service.selectProductList(prod_name).getProduct_no();
			System.out.println("distance들어옴" + prod_no);
		}
		
		makLDTO makl = new makLDTO();	//거리계산 클래스
		List<alrListDTO> alrL = service.alrList(prod_no);		//모든 상점, 상품번호, 좌표
		

		
		for(int i =0; i<alrL.size();i++) {
			double lat2 = alrL.get(i).getShop_gps_latitude();
			double lon2 = alrL.get(i).getShop_gps_longitude();
			double met = makl.distance(lat, lon, lat2, lon2);	//거리계산
			System.out.println("dista거리 : "+met);
				if(met>1000000.0) {//10km
					alrL.remove(i);
				}
			alrL.get(i).setMet(met);
			alrL.get(i).setKey_no(prod_no);
			}
		System.out.println(alrL.size());
		String result = null;
		ObjectMapper mapper = new ObjectMapper();
		
		 try {
			result=mapper.writeValueAsString(alrL);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return callback+"("+result+")";
	}

	private List<WishDTO> getWishList(int mem_no) throws Exception{		//위시리스트 불러오는 메소드
			return service.getwish(mem_no);			
	}
	
	private Wishlist checkWishList(int mem_no, int prod_no) throws Exception{	//위시에 있는 물품인지 확인
			return service.checkWish(mem_no, prod_no);
	}
	
	
	@RequestMapping(value="newMapTest", produces = "application/text; charset=utf8")		
	public String newMapTest() {
		return "newMapTest";
	}
}
