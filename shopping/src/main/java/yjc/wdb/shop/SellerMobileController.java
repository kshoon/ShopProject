package yjc.wdb.shop;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import yjc.wdb.domain.Product;
import yjc.wdb.domain.Shop;
import yjc.wdb.domain.Wishlist;
import yjc.wdb.dto.MyWishShopDTO;
import yjc.wdb.dto.WishDTO;
import yjc.wdb.service.SellMobileService;
import yjc.wdb.service.ShopService;

@Controller
public class SellerMobileController {
	
	@Inject
	private SellMobileService service;
	
	
	@RequestMapping(value="myshop", produces = "application/text; charset=utf8")		// 회원정보로 매장정보
	@ResponseBody public String myshop(@RequestParam("mem_no")int mem_no, String callback) throws Exception{
		List<Shop> list = service.myshop(mem_no);

		String result = null;
		ObjectMapper mapper = new ObjectMapper();
		
		 try {
			result=mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return callback+"("+result+")";
	}
	
	@RequestMapping(value="shophaveProduct" , produces = "application/text; charset=utf8")		//회원이 가진 매장이 파는 상품
	@ResponseBody public String shophaveProduct(@RequestParam("mem_no")int mem_no, String callback) throws Exception{
		List<Shop> list = service.myshop(mem_no); //리스트이지만 매장이 한개라고 가정 한개만 쓰도록 하겠음
		Shop shop = list.get(0);
		int shop_no = shop.getShop_no();
		List<Product> listP = service.shophaveProduct2(shop_no);
		
		String result = null;
		ObjectMapper mapper = new ObjectMapper();
		
		 try {
				result=mapper.writeValueAsString(listP);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 
		
		return callback+"("+result+")";
	}
	
	@RequestMapping(value="wlistNoProduct" , produces = "application/text; charset=utf8")		// 구매자들이 위시에 추가한 물품중 내매장에 없는 목록
	@ResponseBody public String wlistNoProduct(@RequestParam("mem_no")int mem_no, String callback) throws Exception{
		List<Shop> list = service.myshop(mem_no); //리스트이지만 매장이 한개라고 가정 한개만 쓰도록 하겠음
		Shop shop = list.get(0);
		int shop_no = shop.getShop_no();
		
		List<WishDTO> wlist = service.wlistNoProduct(shop_no);
		
		String result = null;
		ObjectMapper mapper = new ObjectMapper();
		 try {
				result=mapper.writeValueAsString(wlist);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return callback+"("+result+")";
	}
	@RequestMapping(value="plist" , produces = "application/text; charset=utf8")		// 모든 물품중 내매장에 없는 목록
	@ResponseBody public String plist(@RequestParam("mem_no")int mem_no, String callback) throws Exception{
		List<Shop> list = service.myshop(mem_no); //리스트이지만 매장이 한개라고 가정 한개만 쓰도록 하겠음
		Shop shop = list.get(0);
		int shop_no = shop.getShop_no();
		
		List<Product> plist = service.plist(shop_no);
		
		String result = null;
		ObjectMapper mapper = new ObjectMapper();
		 try {
				result=mapper.writeValueAsString(plist);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return callback+"("+result+")";
	}
	
	@RequestMapping(value="shopProductIns" , produces = "application/text; charset=utf8")		// 상품 등록
	@ResponseBody public String shopProductIns(@RequestParam("mem_no")int mem_no,@RequestParam("prod_no") int prod_no, String callback) throws Exception{
		List<Shop> list = service.myshop(mem_no); //리스트이지만 매장이 한개라고 가정 한개만 쓰도록 하겠음
		Shop shop = list.get(0);
		int shop_no = shop.getShop_no();
		System.out.println("인설트:"+shop_no+","+prod_no);
		service.shopProductIns(shop_no, prod_no);
		String result = "success";

		return callback+"("+result+")";
	}

	
	@RequestMapping(value="shopProductRem" , produces = "application/text; charset=utf8")		// 상품삭제
	@ResponseBody public String shopProductRem(@RequestParam("mem_no")int mem_no,@RequestParam("prod_no") int prod_no, String callback) throws Exception{
		List<Shop> list = service.myshop(mem_no); //리스트이지만 매장이 한개라고 가정 한개만 쓰도록 하겠음
		Shop shop = list.get(0);
		int shop_no = shop.getShop_no();
		System.out.println("딜리트:"+shop_no+","+prod_no);
		service.shopProductRem(shop_no, prod_no);
		String result = "success";

		return callback+"("+result+")";
	}
	@RequestMapping(value="getShop" , produces = "application/text; charset=utf8")		// 판매자 등록
	@ResponseBody String getShop (@RequestParam("mem_no")int mem_no, String callback) throws Exception{
		List<Shop> slist = service.myshop(mem_no);
		Shop shop = slist.get(0);
		
		String result = null;
		ObjectMapper mapper = new ObjectMapper();
		
		 try {
				result=mapper.writeValueAsString(shop);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return callback+"("+result+")";
	}
	
	@RequestMapping(value="allShop" , produces = "application/text; charset=utf8")		// 매장 전체
	@ResponseBody String AllShop (@RequestParam("mem_no")int mem_no, String callback) throws Exception{
		List<Shop> list = service.AllShop();
		
		String result = null;
		ObjectMapper mapper = new ObjectMapper();
		
		 try {
				result=mapper.writeValueAsString(list);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return callback+"("+result+")";
	}
	
	@RequestMapping(value="MyWishShop" , produces = "application/text; charset=utf8")		// 내 위시 물품 파는 매장
	@ResponseBody String MyWishShop (int mem_no, String callback) throws Exception{
		List<MyWishShopDTO> list = service.MyWishShop(mem_no);
		String result = null;
		ObjectMapper mapper = new ObjectMapper();
		
		 try {
				result=mapper.writeValueAsString(list);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return callback+"("+result+")";
	}
	@RequestMapping(value="BookWishShop" , produces = "application/text; charset=utf8")		// 내 위시 물품 파는 매장
	@ResponseBody String BookWishShop (int mem_no, String callback) throws Exception{
		List<MyWishShopDTO> list = service.BookWishShop(mem_no);
		String result = null;
		ObjectMapper mapper = new ObjectMapper();

		
		 try {
				result=mapper.writeValueAsString(list);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return callback+"("+result+")";
	}
	
	@RequestMapping(value="CheckBook" , produces = "application/text; charset=utf8")		// 내 위시 물품 파는 매장
	@ResponseBody String CheckBook (int mem_no, String callback) throws Exception{
		int chk = service.CheckBook(mem_no);
		String result = null;
		ObjectMapper mapper = new ObjectMapper();
		
		if(chk>0) {
			result = "o";
		}else {
			result = "x";
		}
		 try {
				result=mapper.writeValueAsString(result);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return callback+"("+result+")";
	}
}
