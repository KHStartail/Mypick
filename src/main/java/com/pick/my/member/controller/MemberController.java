package com.pick.my.member.controller;



import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
			request.setAttribute("msg", "???????????? ??????!");
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
				request.setAttribute("msg", "???????????? ??????");
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
				request.setAttribute("msg", "???????????? ??????");
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
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//?????? ?????? 
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
	public String memberDelete(@RequestParam("userId") String userId, HttpServletRequest request) {
		int result = service.removeMember(userId);
		HttpSession session = request.getSession();
		if(session != null) {
			
		if (result>0) {
			session.invalidate();
			return "redirect:index.jsp";
			
		}else {
			
			return "common/errorPage";
		}
		
	}
		return "redirect:index.jsp";
	}
	
	


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
		
		// ????????? ???????????? ??????
		@RequestMapping(value = "/login/oauth_kakao")
		public String oauthKakao(
				@RequestParam(value = "code", required = false) String code
				, Model model) throws Exception {

	        String access_Token = getAccessToken(code);
	        
	        
	        HashMap<String, Object> userInfo = getUserInfo(access_Token);
	        JSONObject kakaoInfo =  new JSONObject(userInfo);
	        model.addAttribute("kakaoInfo", kakaoInfo);
	        
	        return "redirect:index.jsp"; //?????? ????????? ?????? ??????
		}
		
	    //????????????
		public String getAccessToken (String authorize_code) {
	        String access_Token = "";
	        String refresh_Token = "";
	        String reqURL = "https://kauth.kakao.com/oauth/token";

	        try {
	            URL url = new URL(reqURL);

	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	            //  URL????????? ???????????? ?????? ??? ??? ??????, POST ?????? PUT ????????? ????????? setDoOutput??? true??? ???????????????.
	            conn.setRequestMethod("POST");
	            conn.setDoOutput(true);

	            //	POST ????????? ????????? ???????????? ???????????? ???????????? ?????? ??????
	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	            StringBuilder sb = new StringBuilder();
	            sb.append("grant_type=authorization_code");
	            sb.append("&client_id=f8071907fae4877f2a0f469e969f639f");  //????????? ???????????? key
	            sb.append("&redirect_uri=http://localhost:8181/login/oauth_kakao");     // ????????? ????????? ?????? ??????
	            sb.append("&code=" + authorize_code);
	            bw.write(sb.toString());
	            bw.flush();

	            //    ?????? ????????? 200????????? ??????
	            int responseCode = conn.getResponseCode();

	            //    ????????? ?????? ?????? JSON????????? Response ????????? ????????????
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }

	            //    Gson ?????????????????? ????????? ???????????? JSON?????? ?????? ??????
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
		
	    //??????????????????
	    public HashMap<String, Object> getUserInfo (String access_Token) {

	        //    ???????????? ????????????????????? ?????? ????????? ?????? ??? ????????? HashMap???????????? ??????
	        HashMap<String, Object> userInfo = new HashMap<String, Object>();
	        String reqURL = "https://kapi.kakao.com/v2/user/me";
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("GET");

	            //    ????????? ????????? Header??? ????????? ??????
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

	    
	    @RequestMapping(value="myPageMain.pick", method=RequestMethod.GET)
	    public String myPageMainView(
	    		@RequestParam("userNo") int userNo, 
	    		Model model) {
	    	Member member = service.printOneMember(userNo);
	    	model.addAttribute( "loginUser", member);
	        return "myPage/mypageMain";
	    }
	    
	    
	    @RequestMapping(value="myPageModify.pick", method=RequestMethod.GET)
	    public String myPageModifyView(
	    		@RequestParam("userNo") int userNo, 
	    		Model model) {
	    	Member member = service.printOneMember(userNo);
	    	model.addAttribute( "loginUser", member);
	        return "myPage/modifytool";
	    }
	    
	    
	    @RequestMapping(value = "myPageProfile.pick", method = {RequestMethod.GET, RequestMethod.POST})
		public String myPageProfileUpdate(
				@ModelAttribute Member member,
				Model model,
				HttpServletRequest request,
				@RequestParam(value = "reloadFile", required = false) MultipartFile reloadFile)  {
	    	if (reloadFile != null && !reloadFile.isEmpty()) {
				if (member.getFilePath() != null) {
					deleteFile(member.getFilePath(), request);
				}
				String savePath = saveFile(reloadFile, request);
				if (savePath != null) {
					member.setFilePath(reloadFile.getOriginalFilename());
				}
			}
			int result = service.updateMember(member);
			if (result > 0) {
				return "redirect:index.jsp";
			} else {
				return "redirect:index.jsp";
			}
		}

		private String saveFile(MultipartFile file, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\proFiles";
			File folder = new File(savePath);
			if (!folder.exists()) {
				folder.mkdir();
			}
			String filePath = folder + "\\" + file.getOriginalFilename();
			try {
				file.transferTo(new File(filePath));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return filePath;
		}

		private void deleteFile(String filePath, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String deletePath = root + "\\proFiles";
			File deleteFile = new File(deletePath + "\\" + filePath);
			if (deleteFile.exists()) {
				deleteFile.delete();
			}
		}
	    
	    
	 }
	

