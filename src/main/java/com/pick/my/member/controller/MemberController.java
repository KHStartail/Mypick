package com.pick.my.member.controller;



import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.json.simple.JSONObject;

import com.fasterxml.jackson.databind.JsonNode;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.pick.my.member.domain.Member;
import com.pick.my.member.service.MemberService;



@Controller
public class MemberController {
	
	private kakao_restapi kakao = new kakao_restapi();
	@Autowired
	private MemberService service;

	@RequestMapping(value="loginView.pick",method=RequestMethod.GET)
	public String loginView() {
		return "common/login";
	}
	
	@ResponseBody
	@RequestMapping(value="/login.pick", method=RequestMethod.POST)
	public String memberLogin(HttpServletRequest request, HttpServletResponse response) {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		Member memberOne = new Member();
		memberOne.setUserId(userId);
		memberOne.setUserPwd(userPwd);
		String answer = "success";
		try {
			Member loginUser = service.loginMember(memberOne);
			if(loginUser != null) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				answer = "success";
			}else {
				answer = "no";
			}
			return answer;
			
			
		}catch(Exception e) {
			request.setAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="/logout.pick", method=RequestMethod.GET)
	public String memberLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
			return "redirect:index.jsp";
			
		}else {
			request.setAttribute("msg", "로그아웃 실패!");
			return "common/errorPage";
		}
}
	
	@RequestMapping(value="enrollView.pick",method=RequestMethod.GET)
	public String enrollview() {
		return "member/memberJoin";
	}
	@RequestMapping(value="findIdPwdView.pick",method=RequestMethod.GET)
	public String findIdPwdView() {
		return "member/findid";
	}
	@RequestMapping(value="managerEnrollView.pick",method=RequestMethod.GET)
	public String managerEnrollview() {
		return "member/managerJoin";
	}
	@RequestMapping(value="home.pick",method=RequestMethod.GET)
	public String homeView() {
		return "redirect:index.jsp";
	}
	@RequestMapping(value="memberModifyView.pick",method=RequestMethod.GET)
	public String memberModifyView() {
		return "member/membermodify";
	}
	
	
	@RequestMapping(value="memberRegister.pick",method = RequestMethod.POST)
	public String memberRegister(HttpServletRequest request
			,@ModelAttribute Member member
			,@RequestParam("post") String post
			,@RequestParam("address1") String address1
			,@RequestParam("address2") String address2
			) {

		member.setUserAddr(post+","+address1+","+address2);
		try {
			int result = service.registerMember(member);
			if(result > 0) {
				return  "redirect:index.jsp";
			}else {
				request.setAttribute("msg", "회원가입 실패");
				return "common/erroePage";
			}
		}catch (Exception e) {
		request.setAttribute("msg", e.toString());
		return "common/errorPage";
		}
	}


	@RequestMapping(value="managerRegister.pick",method = RequestMethod.POST)
	public String managerRegister(HttpServletRequest request
			,@ModelAttribute Member member
			,@RequestParam("post") String post
			,@RequestParam("address1") String address1
			,@RequestParam("address2") String address2
			) {

		member.setUserAddr(post+","+address1+","+address2);
		try {
			int result = service.registerMember(member);
			if(result > 0) {
				return  "redirect:index.jsp";
			}else {
				request.setAttribute("msg", "회원가입 실패");
				return "common/erroePage";
			}
		}catch (Exception e) {
		request.setAttribute("msg", e.toString());
		return "common/errorPage";
		}
	}

	
	@ResponseBody 
	@RequestMapping(value="checkDupId.pick", method = RequestMethod.GET)
	public String idDuplicateCheck(@RequestParam("userId") String userId){
		int result = service.checkIdDup(userId);
		return String.valueOf(result); 
	}



	@RequestMapping(value = "/phoneCheck.pick", method = RequestMethod.GET)
	@ResponseBody 
	public String sendSMS(@RequestParam("userPhone") String userPhoneNumber) {
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성 
		service.certifiedPhoneNumber(userPhoneNumber,randomNumber); 
		return Integer.toString(randomNumber); 
	}
	
	@ResponseBody
	@RequestMapping(value = "/findId.pick", method = RequestMethod.POST)
	public String searchId(@RequestParam("userPhone") int userPhone){
		String userId = service.searchId(userPhone);
		return userId;
	}
    
	@RequestMapping(value ="/modifyPwd.pick", method = RequestMethod.POST)
	public ModelAndView modifyPwd(@RequestParam("userPwd") String userPwd,
			@RequestParam("userId") String userId,
			ModelAndView mv, 
			Member member) { 
		member.setUserId(userId);
		member.setUserPwd(userPwd);
		int result = service.modifyPwd(member);
		
		if(result > 0) {
			mv.setViewName("common/login");
		}else{
			
		}
		return mv; 
	}
	
	
	@RequestMapping(value = "/findPwd.pick", method = RequestMethod.POST)
	public ModelAndView searchPwd(@RequestParam("userId") String userId,
			@RequestParam("userPhone") int userPhone,
			Member member){
		ModelAndView mv = new ModelAndView();
		member.setUserId(userId);
		member.setUserPhone(userPhone);
		Member member2 = service.searchPwd(member);
		
		if(member2 != null) {
			mv.addObject("member",member.getUserId());
			mv.setViewName("member/modifypwd");
			
			
		}else {
			mv.setViewName("common/login");
		}
		return mv;
	}

	@RequestMapping(value = "memberDelete.pick", method = RequestMethod.GET)
	public String memberDelete(@RequestParam("userId") String userId, Model model) {
		int result = service.removeMember(userId);
		if (result>0) {
			return "redirect:logout.pick";
		}else {
			model.addAttribute("msg", "회원탈퇴 실패");
			return "common/errorPage";
		}
	}
	
	
//	//카카오톡 로그인.. 
//	@RequestMapping(value = "/loginpage_kakao_callback", method = RequestMethod.GET) 
//	public String loginpage_kakao_callback(HttpServletRequest request,
//			HttpServletResponse response, 
//			HttpSession session,
//			Model model) throws Exception { 
//		UrlPathHelper urlPathHelper = new UrlPathHelper();
//		String originalURL = urlPathHelper.getOriginatingRequestUri(request); 
//		Map<String, String[]> paramMap = request.getParameterMap();
//		Iterator keyData = paramMap.keySet().iterator(); 
//		CommonData dto = new CommonData(); 
//		while (keyData.hasNext()) { String key = ((String) keyData.next()); 
//		String[] value = paramMap.get(key); dto.put(key, value[0].toString()); }
//		String url = "https://kauth.kakao.com/oauth/token"; 
//		RestTemplate restTemplate = new RestTemplate(); 
//		HttpHeaders headers = new HttpHeaders(); 
//		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
//		LinkedMultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>(); 
//		map.add("client_id", "REST 앱키를 입력하세요."); 
//		String redirect_url = "http://localhost:8080/user/loginpage_kakao_callback"; 
//		map.add("redirect_uri", redirect_url); map.add("grant_type", "authorization_code");
//		map.add("code", dto.get("code"));
//		HttpEntity<LinkedMultiValueMap<String, String>> request2 = new HttpEntity<LinkedMultiValueMap<String, String>>( map, headers); 
//		CommonData response2 = restTemplate.postForObject(url, request2, CommonData.class);
//		map.clear(); model.addAttribute("access_token", response2.get("access_token")); 
//		return "/user/loginpage_kakao_callback"; 
//		}
	

	@RequestMapping(value = "/login/getKakaoAuthUrl")
		public @ResponseBody String getKakaoAuthUrl(
				HttpServletRequest request) throws Exception {
			String reqUrl = 
					"https://kauth.kakao.com/oauth/authorize"
					+ "?client_id=f8071907fae4877f2a0f469e969f639f"
					+ "&redirect_uri=http://localhost:8181/login/oauth_kakao"
					+ "&response_type=code";
			
			return reqUrl;
		}
		
		// 카카오 연동정보 조회
		@RequestMapping(value = "/login/oauth_kakao")
		public String oauthKakao(
				@RequestParam(value = "code", required = false) String code
				, Model model) throws Exception {

	        String access_Token = getAccessToken(code);
	        
	        
	        HashMap<String, Object> userInfo = getUserInfo(access_Token);
	        JSONObject kakaoInfo =  new JSONObject(userInfo);
	        model.addAttribute("kakaoInfo", kakaoInfo);
	        
	        return "redirect:index.jsp"; //본인 원하는 경로 설정
		}
		
	    //토큰발급
		public String getAccessToken (String authorize_code) {
	        String access_Token = "";
	        String refresh_Token = "";
	        String reqURL = "https://kauth.kakao.com/oauth/token";

	        try {
	            URL url = new URL(reqURL);

	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	            //  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
	            conn.setRequestMethod("POST");
	            conn.setDoOutput(true);

	            //	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	            StringBuilder sb = new StringBuilder();
	            sb.append("grant_type=authorization_code");
	            sb.append("&client_id=f8071907fae4877f2a0f469e969f639f");  //본인이 발급받은 key
	            sb.append("&redirect_uri=http://localhost:8181/login/oauth_kakao");     // 본인이 설정해 놓은 경로
	            sb.append("&code=" + authorize_code);
	            bw.write(sb.toString());
	            bw.flush();

	            //    결과 코드가 200이라면 성공
	            int responseCode = conn.getResponseCode();

	            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }

	            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);

	            access_Token = element.getAsJsonObject().get("access_token").getAsString();
	            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();


	            br.close();
	            bw.close();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }

	        return access_Token;
	    }
		
	    //유저정보조회
	    public HashMap<String, Object> getUserInfo (String access_Token) {

	        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	        HashMap<String, Object> userInfo = new HashMap<String, Object>();
	        String reqURL = "https://kapi.kakao.com/v2/user/me";
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("GET");

	            //    요청에 필요한 Header에 포함될 내용
	            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

	            int responseCode = conn.getResponseCode();

	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }

	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);

	            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

	            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	            String email = kakao_account.getAsJsonObject().get("email").getAsString();
	            String profileimage = kakao_account.getAsJsonObject().get("profileimage").getAsString();
	            userInfo.put("accessToken", access_Token);
	            userInfo.put("nickname", nickname);
	            userInfo.put("email", email);

	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }

	        return userInfo;
	    }
	    
	    @RequestMapping(value = "kakoLogin.pick", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST })
	    public String login(@RequestParam("code") String code, HttpSession session,Model model,Member member) {
	        String access_Token = kakao.getAccessToken(code);
	        HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
	        member.setUserEmail(userInfo.get("email")+"");
	        Member loginUser = service.userchk(member);
	        if(loginUser != null) {
				session.setAttribute("loginUser", loginUser);
	            session.setAttribute("userId", userInfo.get("email")+"");
	            session.setAttribute("access_Token", access_Token);
				 return "redirect:index.jsp";
	        }else {
	        	  model.addAttribute("email",userInfo.get("email")+"");
	        	  return"member/memberJoin";
	        }

	    }
	    @RequestMapping(value="logout.pick")
	    public String logout(HttpSession session) {
	        kakao.kakaoLogout((String)session.getAttribute("access_Token"));
	        session.removeAttribute("access_Token");
	        session.removeAttribute("userId");
	        return "redirect:index.jsp";
	    }

	    
	 }
	

