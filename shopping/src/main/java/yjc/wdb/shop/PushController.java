package yjc.wdb.shop;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import yjc.wdb.service.MemberService;
import yjc.wdb.service.ShopService;

@Controller
public class PushController {
	
	@Inject
	private ShopService service;
	@Inject
	private MemberService servicem;
	
	@RequestMapping(value = "push/sendPush", method = RequestMethod.GET)
	public void sendPush() {

	}

	@RequestMapping(value = "push/token", method = RequestMethod.GET)
	public void token() {

	}

	@RequestMapping(value = "push/mobile/sendFCM")
	public String index(Model model, HttpServletRequest request, HttpSession session, String message) throws Exception {

		// List<MobileTokenVO> tokenList = fcmService.loadFCMInfoList(vo);
		//
		// String token = tokenList.get(count).getDEVICE_ID();

		String msg = message;

		System.out.println("sendPush에서 받아온 message: " + msg);

		final String apiKey = "AIzaSyDqC5s-Z1SGPv9JcNXtHRPSgYsToYRZuB4";
		URL url = new URL("https://fcm.googleapis.com/fcm/send");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setDoOutput(true);
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Type", "application/json");
		conn.setRequestProperty("Authorization", "key=" + apiKey);

		conn.setDoOutput(true);

		String userId = (String) request.getSession().getAttribute("ssUserId");

		// // 이렇게 보내면 주제를 ALL로 지정해놓은 모든 사람들한테 알림을 날려준다.
		// String input = "{\"notification\" : {\"title\" : \"여기다 제목 넣기 \", \"body\" :
		// \"여기다 내용 넣기\"}, \"to\":\"/topics/ALL\"}";
		//
		// 이걸로 보내면 특정 토큰을 가지고있는 어플에만 알림을 날려준다 위에 둘중에 한개 골라서 날려주자
		String input = "{\"notification\" : {\"sound\" : \"default\", \"title\" : \"쇼핑깜빡이 \", \"body\" : \"" + msg + "\"},"
				+ "\"to\":\"f-hAhaox21A:APA91bHQhcOjyKXDyyty3OxRDSfFlVa4m8Km0XOZ5mvxiJsYnjyOiP-2P4VNu9R7Gd_7AwgB_FYVBm0SHnYk2450PkiM2LDO_x6ZpvACxeLIA8fz9y5dRNW0K0Z_eK5eJiHofWRVH0iD\"}";

		OutputStream os = conn.getOutputStream();

		// 서버에서 날려서 한글 깨지는 사람은 아래처럼 UTF-8로 인코딩해서 날려주자
		os.write(input.getBytes("UTF-8"));
		os.flush();
		os.close();

		int responseCode = conn.getResponseCode();
		System.out.println("\nSending 'POST' request to URL : " + url);
		System.out.println("Post parameters : " + input);
		System.out.println("Response Code : " + responseCode);

		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
		// print result
		System.out.println(response.toString());

		return "jsonView";
	}
	@RequestMapping(value="pushToBuyer", method = RequestMethod.GET	)
	public String pushToBuyer(HttpServletRequest request, HttpSession session, String searchText, String member_id) {
        
	      try {
	         int count = service.productbool(searchText);
	         String token = servicem.getToken(member_id);
	         
	         System.out.println("count: " + count);
	         System.out.println("token: " + token);
	         
	         if (count == 0) {
	            String msg = searchText;
	            String pushMsg = searchText+"를 원하는 손님이 나타났습니다!";
	            
	            System.out.println("token: " + token);
	            System.out.println("sendPush에서 받아온 message: " + msg);
	               
	               final String apiKey = "AIzaSyDqC5s-Z1SGPv9JcNXtHRPSgYsToYRZuB4";
	               URL url = new URL("https://fcm.googleapis.com/fcm/send");
	               HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	               conn.setDoOutput(true);
	               conn.setRequestMethod("POST");
	               conn.setRequestProperty("Content-Type", "application/json");
	               conn.setRequestProperty("Authorization", "key=" + apiKey);

	               conn.setDoOutput(true);
	               
	               String userId =(String) request.getSession().getAttribute("ssUserId");

//	               // 이렇게 보내면 주제를 ALL로 지정해놓은 모든 사람들한테 알림을 날려준다.
//	               String input = "{\"notification\" : {\"title\" : \"여기다 제목 넣기 \", \"body\" : \"여기다 내용 넣기\"}, \"to\":\"/topics/ALL\"}";
//	               
	               // 이걸로 보내면 특정 토큰을 가지고있는 어플에만 알림을 날려준다  위에 둘중에 한개 골라서 날려주자
	               String input = "{\"notification\" : {\"sound\" : \"default\",  \"title\" : \"쇼핑깜빡이 \", \"body\" : \""+pushMsg+"\"," 
	                     + "\"click_action\" : \"seller.html\"},"
	                     + "\"to\":\""+token+"\"}";

	               OutputStream os = conn.getOutputStream();
	               
	               // 서버에서 날려서 한글 깨지는 사람은 아래처럼  UTF-8로 인코딩해서 날려주자
	               os.write(input.getBytes("UTF-8"));
	               os.flush();
	               os.close();

	               int responseCode = conn.getResponseCode();
	               System.out.println("\nSending 'POST' request to URL : " + url);
	               System.out.println("Post parameters : " + input);
	               System.out.println("Response Code : " + responseCode);
	               
	               BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	               String inputLine;
	               StringBuffer response = new StringBuffer();

	               while ((inputLine = in.readLine()) != null) {
	                   response.append(inputLine);
	               }
	               in.close();
	               // print result
	               System.out.println(response.toString());
	               

	       return "jsonView";
	         }
	         
	      } catch (Exception e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      return "";
	   }
}