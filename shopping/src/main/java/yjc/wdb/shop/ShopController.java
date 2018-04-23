package yjc.wdb.shop;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import yjc.wdb.domain.Product;
import yjc.wdb.domain.SearchKeyword;
import yjc.wdb.service.ShopService;

@Controller
public class ShopController {
	
	@Inject
	private ShopService service;
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public void main() {
	
	}
	
	@RequestMapping(value="mainSearch", method=RequestMethod.POST)
	@ResponseBody public List<Product> mainSearch(@RequestParam("keyword")String keyword) {
		SearchKeyword sk = new SearchKeyword();
		sk.setKeyword(keyword);
		return service.searchPro(sk);
	}
	
	@RequestMapping(value="join", method=RequestMethod.GET)
	public void join() {
	
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
