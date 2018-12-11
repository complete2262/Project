package com.spring.project.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.project.service.PreplyService;
import com.spring.project.vo.Login;
import com.spring.project.vo.Page;
import com.spring.project.vo.Pboard;
import com.spring.project.vo.Preply;

@Controller
public class ReplyController {
   
   @Autowired(required=true)
   @Qualifier("reply")
   private PreplyService rDAO;
   
   
   @RequestMapping(value="/replyf")
   public String joinf() {
      return "reply/rInsertForm";
   }

   

      @RequestMapping(value="/rlist")
      public ModelAndView getReplyList(HttpServletRequest request, 
                                 ModelAndView mav, Page pvo, Pboard bvo, Login lvo, Preply rvo)
                  throws ServletException, IOException {
         System.out.println("---list-----------------------------------------------");
         System.out.println(rvo);
         int pboard1_id = (Integer.parseInt(request.getParameter("id")));
         int puser_id = (Integer.parseInt(request.getParameter("puser_id")));
         System.out.println("puser_id = "+puser_id);
         List<HashMap<String, Preply>> list= rDAO.getReplyList(rvo);
         int totalRecord = rDAO.totalRecord(pboard1_id);
         System.out.println(totalRecord);
         System.out.println(list);
         int listSize=list.size();
         System.out.println("rvo=>"+rvo);
         rvo.setPboard1_id(pboard1_id);
         System.out.println("rvo2=>"+rvo);
            HashMap<String,Object> rvoInfo  = rDAO.rDetail(rvo);
           System.out.println("rvoInfo"+rvoInfo);
            
            if(!list.isEmpty()) {
               if(list.size()==listSize) {
               System.out.println(rvo);
               mav.addObject("bvoID",pboard1_id);
               mav.addObject("puser_id",puser_id);
               mav.addObject("getReply", list) ;
               mav.addObject("rvoInfo", rvoInfo);
               //mav.addObject("rvoID",list.);
               mav.setViewName("board/replyView");
               }
               return mav;
            }else {
               mav.addObject("bvoID",pboard1_id);
               //mav.addObject("getReply", list) ;
               mav.setViewName("board/replyView");
               return mav;
            }
         
        
         
      } // 
      
   
   
   
   
      @RequestMapping(value="/replyInsert")
      public ModelAndView replyInsert(HttpServletRequest request, ModelAndView mav, 
            Pboard bvo, Preply rvo, Login lvo) 
            throws ServletException, IOException {
         System.out.println("---insert-----------------------------------------------");
         HttpSession session = request.getSession();
         int pboard1_id = (Integer.parseInt(request.getParameter("pboard1_id")));
         System.out.println(pboard1_id);
         lvo = (Login)session.getAttribute("Identity");
         rvo.setPuser_id(lvo.getId());
         rvo.setPboard1_id(pboard1_id);
         System.out.println(rvo);
         
         
         int cnt = rDAO.rInsert(pboard1_id ,rvo);
         if(cnt>0) { mav.setViewName("redirect:boardDetail?id="+pboard1_id); }
         else {
            mav.setViewName("reply/rUpdateFailed");
         }
         return mav;
      }
   @RequestMapping(value="/replyChoice")
   public ModelAndView replyChoice(HttpServletRequest request,ModelAndView mav, Preply rvo) 
         throws ServletException, IOException {
      System.out.println("---replyChoice-----------------------------------------------");
      System.out.println("rvo=>" +rvo);
      int preply1_id = Integer.parseInt(request.getParameter("preply1_id"));
      int pboard1_id = Integer.parseInt(request.getParameter("pboard1_id"));
      System.out.println("Ã¤ÅÃ´­·¶À»‹šrvo=>"+preply1_id);
      System.out.println("Ã¤ÅÃ´­·¶À»‹špboard_id=>"+pboard1_id);
      System.out.println("rvo => "+rvo);
      
      int i = rDAO.rChoiceUpdate(pboard1_id);
      
      
      
      if(i>0) {
         
         mav.setViewName("redirect:boardDetail?id="+pboard1_id);
      }
      
      return mav;
   }
   
   
   
   
   @RequestMapping(value="/replyUpdate")
   public ModelAndView replyUpdate(HttpServletRequest request, ModelAndView mav, Preply rvo) 
         throws ServletException, IOException {
      System.out.println("-----------------replyUpdate-------------------");
      String content = request.getParameter("content");
      rvo.setContent(content);
      int pboard1_id = (Integer.parseInt(request.getParameter("pboard1_id")));
      System.out.println(rvo);
      int cnt = rDAO.rUpdate(rvo);
      System.out.println("cnt = " + cnt);
      if(cnt>0) { mav.setViewName("redirect:rlist?id="+pboard1_id); 
      } else {
         mav.setViewName("board/bUpdateFailed");
      }
      return mav;
   }
   
   @RequestMapping(value="/replyDelete")
   public ModelAndView replyDelete(HttpServletRequest request, ModelAndView mav,Preply rvo) throws ServletException, IOException {
      System.out.println("----------------------------replyDelete");
      System.out.println(rvo);
      System.out.println(request.getParameter("pboard1_id"));
      int pboard1_id = Integer.parseInt(request.getParameter("pboard1_id"));
      System.out.println(pboard1_id);
      rvo.setPboard1_id(pboard1_id);
      
      int cnt = rDAO.rDelete(pboard1_id, rvo);
      if(cnt>0) {
         System.out.println("rDelete Successful! => " + cnt);
         mav.setViewName("redirect:rlist?id="+pboard1_id);
      }else { mav.setViewName("board/rUpdateFailed"); }
      return mav;
   }
   
}