package yjc.wdb.shop;



import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import yjc.wdb.domain.Member;
import yjc.wdb.domain.Product;
import yjc.wdb.domain.Shop;
import yjc.wdb.service.SellShopService;

@Controller
public class ShopSellerController {
	
	@Inject
	private SellShopService service;
	
	@RequestMapping(value="mainShopInfo", method=RequestMethod.GET)		//판매자 메인
	public String mainShopInfo(HttpSession session, Model model) throws Exception{
		

		return "seller/mainShopInfo";
	}
	
	@RequestMapping(value="mainShopMod", method=RequestMethod.POST)		//판매자 메인
	public String mainShopMod(HttpSession session, Shop shop) throws Exception{
		
		Member member= (Member) session.getAttribute("member");
		int mem_no = member.getMember_no();
		List<Shop> list = service.myshop(mem_no); //리스트이지만 매장이 한개라고 가정 한개만 쓰도록 하겠음
		
		int shop_no = list.get(0).getShop_no();
		
		shop.setShop_no(shop_no);
		service.updateShop(shop);
		return "redirect:/mainShopInfo";
	}
	
	@RequestMapping(value="mainShopProd", method=RequestMethod.GET)		//판매자 메인
	public String mainShopProd(HttpSession session, Model model) throws Exception{
		Member member= (Member) session.getAttribute("member");
		int mem_no = member.getMember_no();
		List<Shop> list = service.myshop(mem_no); //리스트이지만 매장이 한개라고 가정 한개만 쓰도록 하겠음
		int shop_no = list.get(0).getShop_no();

		List<Product> plist = service.getProd(shop_no);
		model.addAttribute("plist", plist);
		return "seller/mainShopProd";
	}
	

	
	
}
