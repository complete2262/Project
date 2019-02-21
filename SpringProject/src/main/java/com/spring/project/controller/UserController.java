package com.spring.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.project.service.PuserService;
import com.spring.project.vo.Login;
import com.spring.project.vo.Page;
import com.spring.project.vo.Pboard;
import com.spring.project.vo.Puser;


@Controller
public class UserController {

	@Autowired(required=true)
	@Qualifier("user") // 해당 serviceImple을 호출하여 객체 자동 생성
	private PuserService uDAO ;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	
	/*@RequestMapping(value="/")
	public String home() {
		return "user/index";
	}*/
	
	@RequestMapping(value="/pdiclogo")
	public ModelAndView pdiclogo(ModelAndView mav) throws ServletException, IOException{
	   mav.setViewName("user/logo");
	   return mav;
	}
	@RequestMapping(value="/main")
    public String main() {
	   return "user/main";
	}
	
	@RequestMapping(value="/index")
	public String index() {
		return "user/index";
	}
	
	@RequestMapping(value="/jumboinclude")
	   public ModelAndView jomboinclude(ModelAndView mav) throws ServletException, IOException{
	      System.out.println();
	      mav.setViewName("user/index_include");
	      return mav;
	   }
	
	@RequestMapping(value="/join_form")
	public String joinf() {
		return "user/joinForm";
	}
	
	@RequestMapping(value="/logout")
	public String logout() {
		return "user/logout";
	}
	
	@RequestMapping(value="/login_form")
	public String loginf() {
		return "user/loginForm";
	}
	
	
	@RequestMapping(value="/login")
	public ModelAndView userLogin
	(HttpServletRequest request, ModelAndView mav, Login lvo)  
			throws ServletException, IOException {
		String rawPassword = lvo.getPassword(); // 1234
		lvo = uDAO.uLogin(lvo);
		if(lvo==null){
			mav.setViewName("user/loginFail");
		}
		else {
		String encodedPassword = lvo.getPassword(); // 암호화 된 비밀번호
			if(passwordEncoder.matches(rawPassword, encodedPassword)) {
				HttpSession session = request.getSession();
				session.setAttribute("Identity", lvo);
				mav.setViewName("user/index");
			}else {
				mav.setViewName("user/loginFail");
			}
		}
		return mav;
	} // userLogin

	@RequestMapping(value="/detail")
	public ModelAndView userDetail
	(HttpServletRequest request, ModelAndView mav, Login lvo, Puser uvo) 
			throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		lvo = (Login)session.getAttribute("Identity");
		System.out.println(lvo);
		
		
		uvo = uDAO.uDetail(lvo);
		System.out.println(uvo);
		mav.setViewName("user/editPrivate");
		return mav;
	} // userDetail
	

	@RequestMapping(value="/myWork_board")
	public ModelAndView myWork_Board(HttpServletRequest request, 
			ModelAndView mav, Login lvo, Pboard bvo, Page pvo) 
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("Identity") == null) {
		
			int id = Integer.parseInt(request.getParameter("id"));
			
				String pageSizeStr= "10";
				
				int pageNum=0;
				
				if(pvo !=null && pvo.getPageNum() >0) {
					pageNum = pvo.getPageNum();
				}else {
					pageNum =1;
					pvo.setPageNum(pageNum);
				}
				mav.addObject("pageNum", pageNum);
				
				int totalRecord = uDAO.totalRecord_board(bvo);
				int pageSize = Integer.parseInt(pageSizeStr);
				int totalPage = totalRecord / pageSize;
				if((totalRecord % pageSize) != 0) {
					totalPage ++;
				}
				if (totalPage == 0 ) {
					totalPage ++;
				}
				
				mav.addObject("totalRecord", totalRecord);
				mav.addObject("totalPage", totalPage);
				mav.addObject("id", id);
				
				pvo.setPageSize(pageSize);
				mav.addObject("myWork_board", uDAO.getWorkList_board(pvo, bvo, lvo));
				mav.setViewName("user/myWork_board_nick");
			
		}
		else if(session.getAttribute("Identity") != null) {
			lvo = (Login)session.getAttribute("Identity");
			System.out.println("lvo.getId() => " +lvo.getId());
			System.out.println("request.getParameter(\"id\") = > " + request.getParameter("id"));
			if(lvo.getId() == Integer.parseInt(request.getParameter("id"))){
				//int id = Integer.parseInt(request.getParameter("id"));
				
				String pageSizeStr= "10";
				
				int pageNum=0;
				
				if(pvo !=null && pvo.getPageNum() >0) {
					pageNum = pvo.getPageNum();
				}else {
					pageNum =1;
					pvo.setPageNum(pageNum);
				}
				mav.addObject("pageNum", pageNum);
				
				int totalRecord = uDAO.totalRecord_board(bvo);
				int pageSize = Integer.parseInt(pageSizeStr);
				int totalPage = totalRecord / pageSize;
				if((totalRecord % pageSize) != 0) {
					totalPage ++;
				}
				if (totalPage == 0 ) {
					totalPage ++;
				}
				
				mav.addObject("totalRecord", totalRecord);
				mav.addObject("totalPage", totalPage);
				mav.addObject("id", lvo.getId());
				
				pvo.setPageSize(pageSize);
				mav.addObject("myWork_board", uDAO.getWorkList_board(pvo, bvo, lvo));
				mav.setViewName("user/myWork_board");
			}
			else if(lvo.getId() != Integer.parseInt(request.getParameter("id"))) {
				int id = Integer.parseInt(request.getParameter("id"));
			
				bvo.setPuser_id(lvo.getId());
				String pageSizeStr= "10";
				
				int pageNum=0;
				
				if(pvo !=null && pvo.getPageNum() >0) {
					pageNum = pvo.getPageNum();
				}else {
					pageNum =1;
					pvo.setPageNum(pageNum);
				}
				mav.addObject("pageNum", pageNum);
				
				int totalRecord = uDAO.totalRecord_board(bvo);
				int pageSize = Integer.parseInt(pageSizeStr);
				int totalPage = totalRecord / pageSize;
				if((totalRecord % pageSize) != 0) {
					totalPage ++;
				}
				if (totalPage == 0 ) {
					totalPage ++;
				}
				
				mav.addObject("totalRecord", totalRecord);
				mav.addObject("totalPage", totalPage);
				mav.addObject("id", id);
				
				pvo.setPageSize(pageSize);
				mav.addObject("myWork_board", uDAO.getWorkList_board(pvo, bvo, lvo));
				mav.setViewName("user/myWork_board_nick");
			}
		}
		
		
			return mav ;
		
	}//myWork_Board
	
	@RequestMapping(value="/myWork_reply")
	public ModelAndView myWork_reply(HttpServletRequest request, 
			ModelAndView mav, Login lvo, Pboard bvo, Page pvo) 
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.getAttribute("Identity");
		
		String pageSizeStr= "10";
		
		int pageNum=0;
		
		if(pvo !=null && pvo.getPageNum() >0) {
			pageNum = pvo.getPageNum();
		}else {
			pageNum =1;
			pvo.setPageNum(pageNum);
		}
		mav.addObject("pageNum", pageNum);
		
		int totalRecord = uDAO.totalRecord_reply(bvo);
		int pageSize = Integer.parseInt(pageSizeStr);
		int totalPage = totalRecord / pageSize;
		if((totalRecord % pageSize) != 0) {
			totalPage ++;
		}
		if (totalPage == 0 ) {
			totalPage ++;
		}
		pvo.setPageSize(pageSize);
		mav.addObject("totalRecord", totalRecord);
		mav.addObject("totalPage", totalPage);
		mav.addObject("id", lvo.getId());
		
		mav.addObject("myWork_reply", uDAO.getWorkList_reply(pvo, bvo, lvo));
		System.out.println(uDAO.getWorkList_reply(pvo, bvo, lvo));
		mav.setViewName("user/myWork_reply");
		
			return mav ;
		
	}//myWork_reply
			

	@RequestMapping(value="/insert")
	public ModelAndView userInsert(ModelAndView mav, Puser uvo)
			throws ServletException, IOException {

		uvo.setEmail(uvo.getEmail_id()+"@"+uvo.getEmail_site());
		String password = uvo.getPassword();
		System.out.println("password"+password);
		String encryptPassword = passwordEncoder.encode(password);
		uvo.setEncryptPassword(encryptPassword);
		System.out.println("encryptPassword"+encryptPassword);
		int cnt = uDAO.uInsert(uvo);
		if(cnt>0) {
			mav.setViewName("user/joinSuccess");
		}else {
			mav.setViewName("user/joinFail");
		}
		return mav;
	} // userInsert 
	
	@RequestMapping(value="/idcheck", method = { RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int idDupCheck
	(HttpServletRequest request, Puser uvo)  
			throws ServletException, IOException {
		return uDAO.uIdcheck(uvo);
	} // idDupCheck
	
	@RequestMapping(value="/nNamecheck", method = { RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int nNameCheck
	(HttpServletRequest request, Puser uvo)  
			throws ServletException, IOException {
		return uDAO.uNnamecheck(uvo);
	} // nNameCheck
	

	@RequestMapping(value="/update")
	public ModelAndView userUpdate
	(HttpServletRequest request, ModelAndView mav, Puser uvo, Login lvo) 
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		lvo = (Login)session.getAttribute("Identity");
		uvo.setId(lvo.getId());
		uvo.setEmail(uvo.getEmail_id()+"@"+uvo.getEmail_site());
		String password = uvo.getPassword();
		System.out.println("password"+password);
		String encryptPassword = passwordEncoder.encode(password);
		uvo.setEncryptPassword(encryptPassword);
		System.out.println("encryptPassword"+encryptPassword);
		int cnt = uDAO.uUpdate(uvo);
	

		if(cnt>0) {
			mav.setViewName("user/loginForm");
		}else {
			mav.setViewName("user/updateFail");
		}
		return mav;
	} // userUpdate

	@RequestMapping(value="/delete")
	public ModelAndView userDelete
	(HttpServletRequest request, ModelAndView mav, 
			Puser uvo, Login lvo) 
					throws ServletException, IOException {
		
			HttpSession  session = request.getSession(false) ;
			lvo = (Login)session.getAttribute("Identity") ;
		System.out.println(lvo);
		/*uDAO.uDeleteSub(lvo);
		uDAO.uDeleteSub2(lvo);*/
		int cnt = uDAO.uDelete(uvo,lvo);
		
		if(cnt>0) {
			mav.setViewName("user/deleteSuccess");
		}else {
			mav.setViewName("member/deleteFail");
		}
		return mav;
	} // userDelete
	
	
 
} // class
