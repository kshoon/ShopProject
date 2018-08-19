package yjc.wdb.shop;



import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import yjc.wdb.domain.Alram;
import yjc.wdb.domain.Member;
import yjc.wdb.domain.Product;
import yjc.wdb.domain.Shop;
import yjc.wdb.dto.WishDTO;
import yjc.wdb.dto.shopSellWishDTO;
import yjc.wdb.service.SellShopService;

@Controller
public class ShopSellerController {
	
	@Inject
	private SellShopService service;
	
	@RequestMapping(value="mainShopInfo", method=RequestMethod.GET)		//판매자 매장정보
	public String mainShopInfo(HttpSession session, Model model) throws Exception{
		

		return "seller/mainShopInfo";
	}
	
	
	@RequestMapping(value="selectNos", method=RequestMethod.GET)		//판매자 매장정보
	@ResponseBody public List<Product> selectNos() throws Exception{
		
		return service.selectNos();
	}
	
	@RequestMapping(value="selectSsw", method=RequestMethod.GET)		//판매자 매장정보
	@ResponseBody public List<shopSellWishDTO> selectSsw(HttpSession session) throws Exception{
		Member member= (Member) session.getAttribute("member");
		int mem_no = member.getMember_no();
		List<Shop> list = service.myshop(mem_no); //리스트이지만 매장이 한개라고 가정 한개만 쓰도록 하겠음
		int shop_no = list.get(0).getShop_no();
		
		return service.selectSsw(shop_no);
	}
	@RequestMapping(value="mainShopProd", method=RequestMethod.GET)		//판매자 상품관리
	public String mainShopProd(HttpSession session,String id, Model model) throws Exception{
		System.out.println("prod "+id);
		Member member= (Member) session.getAttribute("member");
		int mem_no = member.getMember_no();
		List<Shop> list = service.myshop(mem_no); //리스트이지만 매장이 한개라고 가정 한개만 쓰도록 하겠음
		int shop_no = list.get(0).getShop_no();

		List<Product> plist = service.getProd(shop_no);		
		
		if (id != null && id != "") {
			List<Product> plist2 = uniPlist(plist, id);
		
			model.addAttribute("plist", plist2);
			System.out.println("모델2");
		}else {
			model.addAttribute("plist", plist);
			System.out.println("모델1");
		}
		return "seller/mainShopProd";
	}
	
	@RequestMapping(value="mainShopNearW", method=RequestMethod.GET)		//근처 위시
	public String mainShopNearW(HttpSession session, Model model) throws Exception{
		Member member= (Member) session.getAttribute("member");
		int mem_no = member.getMember_no();
		List<Shop> list = service.myshop(mem_no); //리스트이지만 매장이 한개라고 가정 한개만 쓰도록 하겠음
		int shop_no = list.get(0).getShop_no();
		List<shopSellWishDTO> plist = service.shopSellWish(shop_no);
		model.addAttribute("plist", plist);
		model.addAttribute("slist", list.get(0));
		return "seller/mainShopNearW";
	}
	
	@RequestMapping(value="mainShopInsertP", method=RequestMethod.GET)		//상품 추가
	public String mainShopInsertP(HttpSession session,String id, Model model) throws Exception{
		Member member= (Member) session.getAttribute("member");
		int mem_no = member.getMember_no();
		List<Shop> list = service.myshop(mem_no); //리스트이지만 매장이 한개라고 가정 한개만 쓰도록 하겠음
		
		int shop_no = list.get(0).getShop_no();
		
		List<Product> plist = service.getPlist(shop_no);
		if (id != null && id != "") {
			List<Product> plist2 = uniPlist(plist, id);
			model.addAttribute("plist", plist2);
			System.out.println("모델2");
		}else {
			model.addAttribute("plist", plist);
			System.out.println("모델1");
		}
		return "seller/mainShopInsertP";
	}
	
	@RequestMapping(value="mainShopInsertPSearch", method=RequestMethod.GET)		//상품 추가
	public String mainShopInsertPSearch(HttpSession session,String keyword, Model model) throws Exception{
		Member member= (Member) session.getAttribute("member");
		int mem_no = member.getMember_no();
		List<Shop> list = service.myshop(mem_no); //리스트이지만 매장이 한개라고 가정 한개만 쓰도록 하겠음
		
		int shop_no = list.get(0).getShop_no();
		List<Product> plist = service.IpSearch(shop_no, keyword);
		System.out.println(plist.size());
		model.addAttribute("plist", plist);
		return "seller/mainShopInsertP";
	}
	
	@RequestMapping(value="mainShopInsertPW", method=RequestMethod.GET)		//상품 추가
	public String mainShopInsertPW(HttpSession session,String id, Model model) throws Exception{
		Member member= (Member) session.getAttribute("member");
		int mem_no = member.getMember_no();
		List<Shop> list = service.myshop(mem_no); //리스트이지만 매장이 한개라고 가정 한개만 쓰도록 하겠음
		
		int shop_no = list.get(0).getShop_no();
		
		List<Product> plist = service.getPWlist(shop_no);
		if (id != null && id != "") {
			List<Product> plist2 = uniPlist(plist, id);
			model.addAttribute("plist", plist2);
			System.out.println("모델2");
		}else {
			model.addAttribute("plist", plist);
			System.out.println("모델1");
		}
		return "seller/mainShopInsertPW";
	}
	
	@RequestMapping(value="mainShopSold", method=RequestMethod.GET)		//판매자 상품관리
	public String mainShopSold(HttpSession session,String id, Model model) throws Exception{
		Member member= (Member) session.getAttribute("member");
		int mem_no = member.getMember_no();
		List<Shop> list = service.myshop(mem_no); //리스트이지만 매장이 한개라고 가정 한개만 쓰도록 하겠음
		int shop_no = list.get(0).getShop_no();

		List<Product> plist = service.getSold(shop_no);		
		model.addAttribute("plist", plist);

		return "seller/mainShopSold";
	}
	
	@RequestMapping(value="mainShopAlram", method=RequestMethod.GET)		//판매자 매장정보
	public String mainShopAlram(HttpSession session, Model model) throws Exception{
		Member member= (Member) session.getAttribute("member");
		int mem_no = member.getMember_no();
		List<Alram> alist = service.getAlram(mem_no);

		model.addAttribute("alist", alist);
		return "seller/mainShopAlram";
	}	
	
	
	
	

	@RequestMapping(value="alramRem", method=RequestMethod.GET)		//알람 삭제
	@ResponseBody public void alramRem(int alram_no) throws Exception{
		service.remAlr(alram_no);
	}	
	
	
	
	
	
	
	@RequestMapping(value="mainShopMod", method=RequestMethod.POST)		//판매자 매장수정
	public String mainShopMod(HttpSession session, Shop shop) throws Exception{
		
		Member member= (Member) session.getAttribute("member");
		int mem_no = member.getMember_no();
		List<Shop> list = service.myshop(mem_no); //리스트이지만 매장이 한개라고 가정 한개만 쓰도록 하겠음
		
		int shop_no = list.get(0).getShop_no();
		shop.setShop_no(shop_no);
		System.out.println(shop.getShop_no());
		System.out.println(shop.getShop_name());
		System.out.println(shop.getShop_bh());
		service.updateShop(shop);
		return "redirect:/mainShopInfo";
	}	
	
	@RequestMapping(value="mainShopPush", method=RequestMethod.GET)		//홍보 푸쉬
	public String mainShopPush(HttpSession session, Model model) throws Exception{
		return "seller/mainShopPush";
	}
	
	
	@RequestMapping(value="SPProd", method=RequestMethod.GET)		//위시리스트 삭제
	public String SPProd(HttpSession session, int prod_no, int mem_no, RedirectAttributes rttr) throws Exception{
		List<Shop> list = service.myshop(mem_no); //리스트이지만 매장이 한개라고 가정 한개만 쓰도록 하겠음		
		int shop_no = list.get(0).getShop_no();
		service.deleteSPP(prod_no, shop_no);

		return"redirect:mainShopProd";
	}
	
	@RequestMapping(value="SPSold", method=RequestMethod.GET)		//위시리스트 품절
	public String SPSold(HttpSession session, int prod_no, int mem_no, RedirectAttributes rttr) throws Exception{
		List<Shop> list = service.myshop(mem_no); //리스트이지만 매장이 한개라고 가정 한개만 쓰도록 하겠음		
		int shop_no = list.get(0).getShop_no();
		service.updateSPU(prod_no, shop_no);

		return"redirect:mainShopProd";
	}
	
	@RequestMapping(value="SPProdInsert", method=RequestMethod.GET)		//위시리스트 추가
	public String SPProdInsert(HttpSession session, int prod_no, int mem_no, RedirectAttributes rttr) throws Exception{
		List<Shop> list = service.myshop(mem_no); //리스트이지만 매장이 한개라고 가정 한개만 쓰도록 하겠음		
		int shop_no = list.get(0).getShop_no();
		service.InsertSPP(prod_no, shop_no);

		return"redirect:mainShopInsertP";
	}
	@RequestMapping(value="SPSoldO", method=RequestMethod.GET)		//위시리스트 품절
	public String SPSoldO(HttpSession session, int prod_no, int mem_no, RedirectAttributes rttr) throws Exception{
		List<Shop> list = service.myshop(mem_no); //리스트이지만 매장이 한개라고 가정 한개만 쓰도록 하겠음		
		int shop_no = list.get(0).getShop_no();
		service.updateSPUO(prod_no, shop_no);

		return"redirect:mainShopSold";
	}
	private List<Product> uniPlist(List<Product> plist, String id) {
		List<Product> plist2 = new ArrayList<Product>();
		String[] chs = { 
		        "ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ", 
		        "ㄹ", "ㅁ", "ㅂ", "ㅃ", "ㅅ", 
		        "ㅆ", "ㅇ", "ㅈ", "ㅉ", "ㅊ", 
		        "ㅋ", "ㅌ", "ㅍ", "ㅎ" 
		    };
		String[] ch = new String[plist.size()];
		for(int i=0; i< plist.size(); i++) {
			char chName = plist.get(i).getProduct_name().charAt(0);		//상품이름 첫글자
			
	        if(chName >= 0xAC00  && chName <= 0xD7A3)	//유니코드 한글? "AC00:가" ~ "D7A3:힣" 
	        {
	            int uniVal = chName - 0xAC00;		//
	            int cho = ((uniVal - (uniVal % 28))/28)/21;
	 
	            ch[i] = chs[cho];
	        }else {
	        	ch[i] = String.valueOf(chName);
	        }
		}

		switch (id) {
		case "naviA":
			for (int i = 0; i < plist.size(); i++) {
				System.out.println("ch[i] " + ch[i]);
				if (ch[i].equals("ㄱ") || ch[i].equals("ㄲ")) {
					plist2.add(plist.get(i));
				}
			}
			;
			break;
		case "naviB":
			for (int i = 0; i < plist.size(); i++) {
				if (ch[i].equals("ㄴ")) {
					plist2.add(plist.get(i));
				}
			}
			;
			break;
		case "naviC":
			for (int i = 0; i < plist.size(); i++) {
				if (ch[i].equals("ㄷ") || ch[i].equals("ㄸ")) {
					plist2.add(plist.get(i));
				}
			}
			;
			break;
		case "naviD":
			for (int i = 0; i < plist.size(); i++) {
				if (ch[i].equals("ㄹ")) {
					plist2.add(plist.get(i));
				}
			}
			;
			break;
		case "naviE":
			for (int i = 0; i < plist.size(); i++) {
				if (ch[i].equals("ㅁ")) {
					plist2.add(plist.get(i));
				}
			}
			;
			break;
		case "naviF":
			for (int i = 0; i < plist.size(); i++) {
				if (ch[i].equals("ㅂ") || ch[i].equals("ㅃ")) {
					plist2.add(plist.get(i));
				}
			}
			;
			break;
		case "naviG":
			for (int i = 0; i < plist.size(); i++) {
				if (ch[i].equals("ㅅ") || ch[i].equals("ㅆ")) {
					plist2.add(plist.get(i));
				}
			}
			;
			break;
		case "naviH":
			for (int i = 0; i < plist.size(); i++) {
				if (ch[i].equals("ㅇ")) {
					plist2.add(plist.get(i));
				}
			}
			;
			break;
		case "naviI":
			for (int i = 0; i < plist.size(); i++) {
				if (ch[i].equals("ㅈ") || ch[i].equals("ㅉ")) {
					plist2.add(plist.get(i));
				}
			}
			;
			break;
		case "naviJ":
			for (int i = 0; i < plist.size(); i++) {
				if (ch[i].equals("ㅊ")) {
					plist2.add(plist.get(i));
				}
			}
			;
			break;
		case "naviK":
			for (int i = 0; i < plist.size(); i++) {
				if (ch[i].equals("ㅋ")) {
					plist2.add(plist.get(i));
				}
			}
			;
			break;
		case "naviL":
			for (int i = 0; i < plist.size(); i++) {
				if (ch[i].equals("ㅌ")) {
					plist2.add(plist.get(i));
				}
			}
			;
			break;
		case "naviM":
			for (int i = 0; i < plist.size(); i++) {
				if (ch[i].equals("ㅍ")) {
					plist2.add(plist.get(i));
				}
			}
			;
			break;
		case "naviN":
			for (int i = 0; i < plist.size(); i++) {
				if (ch[i].equals("ㅎ")) {
					plist2.add(plist.get(i));
				}
			}
			;
			break;
		case "naviO":
			for (int i = 0; i < plist.size(); i++) {
				if (ch[i].toLowerCase().equals("a") || ch[i].toLowerCase().equals("b")
						|| ch[i].toLowerCase().equals("c") || ch[i].toLowerCase().equals("d")
						|| ch[i].toLowerCase().equals("e")) {
					plist2.add(plist.get(i));
				}
			}
			;
			break;
		case "naviP":
			for (int i = 0; i < plist.size(); i++) {
				if (ch[i].toLowerCase().equals("f") || ch[i].toLowerCase().equals("g")
						|| ch[i].toLowerCase().equals("h") || ch[i].toLowerCase().equals("i")
						|| ch[i].toLowerCase().equals("j")) {
					plist2.add(plist.get(i));
				}
			}
			;
			break;
		case "naviQ":
			for (int i = 0; i < plist.size(); i++) {
				if (ch[i].toLowerCase().equals("k") || ch[i].toLowerCase().equals("l")
						|| ch[i].toLowerCase().equals("m") || ch[i].toLowerCase().equals("n")
						|| ch[i].toLowerCase().equals("o")) {
					plist2.add(plist.get(i));
				}
			}
			;
			break;
		case "naviR":
			for (int i = 0; i < plist.size(); i++) {
				if (ch[i].toLowerCase().equals("p") || ch[i].toLowerCase().equals("q")
						|| ch[i].toLowerCase().equals("r") || ch[i].toLowerCase().equals("s")
						|| ch[i].toLowerCase().equals("t")) {
					plist2.add(plist.get(i));
				}
			}
			;
			break;
		case "naviS":
			for (int i = 0; i < plist.size(); i++) {
				if (ch[i].toLowerCase().equals("u") || ch[i].toLowerCase().equals("v")
						|| ch[i].toLowerCase().equals("w") || ch[i].toLowerCase().equals("x")
						|| ch[i].toLowerCase().equals("y") || ch[i].toLowerCase().equals("z")) {
					plist2.add(plist.get(i));
				}
			}
			;
			break;
		case "naviT":
			for (int i = 0; i < plist.size(); i++) {
				if (ch[i].toLowerCase().equals("1") || ch[i].toLowerCase().equals("2")
						|| ch[i].toLowerCase().equals("3") || ch[i].toLowerCase().equals("4")
						|| ch[i].toLowerCase().equals("5") || ch[i].toLowerCase().equals("6")
						|| ch[i].toLowerCase().equals("7") || ch[i].toLowerCase().equals("8")
						|| ch[i].toLowerCase().equals("9") || ch[i].toLowerCase().equals("0")) {
					plist2.add(plist.get(i));
				}
			}
			;
			break;
		default:
			break;
		}
		return plist2;
	}
}
