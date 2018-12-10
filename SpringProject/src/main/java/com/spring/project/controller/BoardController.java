package com.spring.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.project.service.PboardService;
import com.spring.project.vo.Bridge;
import com.spring.project.vo.Login;
import com.spring.project.vo.Page;
import com.spring.project.vo.Pboard;

@Controller
public class BoardController {
   
   @Autowired(required=true)
   @Qualifier("board")
   private PboardService bDAO;
   
/*   @Autowired(required=true)
   @Qualifier("reply")
   private PreplyService rDAO;*/
   
   /*@Value("${page.PageSize}")
   private String pageSizeStr;*/
   //String pageSizeStr= "5";
   @RequestMapping(value="/binsert_form")
   public String joinf() {
      return "board/bInsertForm";
   }
   @RequestMapping(value="/update_form")
   public ModelAndView updatef(HttpServletRequest request, ModelAndView mav, Pboard bvo) {
      request.getParameter("id");
      System.out.println(request.getParameter("id"));
      System.out.println(bvo.getId());
      mav.addObject("bvof",bDAO.bDetail(bvo));
      mav.setViewName("board/bUpdateForm");
      return mav;
   }
   
   @RequestMapping(value = "/photo_uploader")
       public String photo_uploader() {
          return "board/photo_uploader";
       }
          
   @RequestMapping(value = "/SmartEditor2Skin")
       public String SmartEditor2Skin() {
          return "board/SmartEditor2Skin";
       }
   @RequestMapping(value = "/smart_editor2_inputarea")
      public String smart_editor2_inputarea() {
         return "board/smart_editor2_inputarea";
       }
   
   @RequestMapping(value="/boardList")
   public ModelAndView getBoardList(HttpServletRequest request, 
                              ModelAndView mav, Page pvo, Pboard bvo)
               throws ServletException, IOException {
      String pageSizeStr= "10";
      bvo.setTag(request.getParameter("tag"));
      
      int pageNum=0;
      
      if(pvo !=null && pvo.getPageNum() >0) {
         pageNum = pvo.getPageNum();
      }else {
         pageNum =1;
         pvo.setPageNum(pageNum);
      }
      mav.addObject("pageNum", pageNum);
      
      int totalRecord = bDAO.totalRecord_board(bvo);
      int pageSize = Integer.parseInt(pageSizeStr);
      int totalPage = totalRecord / pageSize;
      if((totalRecord % pageSize) != 0) {
         totalPage ++;
      }
      if (totalPage == 0 ) {
         totalPage ++;
      }
      
      mav.addObject("totalRecord",totalRecord);
      mav.addObject("totalPage", totalPage);
      mav.addObject("tag",pvo.getTag());
      pvo.setPageSize(pageSize);
      mav.addObject("boardList", bDAO.getBoardList(pvo,bvo));
      mav.setViewName("board/boardList");
      
         return mav ;
         
   } // getBoardList
   
   @RequestMapping(value="/likeList")
   public ModelAndView getLikeList(HttpServletRequest request, 
                              ModelAndView mav, Page pvo, Pboard bvo)
               throws ServletException, IOException {
      
      int pageSize = 5;
      
      pvo.setPageSize(pageSize);
      mav.addObject("likeList", bDAO.getlikeList(pvo,bvo));
      mav.addObject("latestList", bDAO.getlatestList(pvo,bvo));
      mav.setViewName("board/likeView");
      
         return mav ;
         
   } // getLikeList
   
   
   @RequestMapping(value="/boardInsert")
   public ModelAndView boardInsert(HttpServletRequest request, ModelAndView mav, Pboard bvo) 
         throws ServletException, IOException {
      String tag = bvo.getTag();
      
      int cnt = bDAO.bInsert(bvo);
      if(cnt>0) { mav.setViewName("redirect:boardList?tag="+tag); }
      else {
         mav.setViewName("board/joinFailed");
      }
      return mav;
   } //boardInsert
   

    @RequestMapping(value = "/file_uploader", method = RequestMethod.POST)
    public String writeBoard(Locale locale, Model model,HttpServletRequest request) {
     
       System.out.println( request.getParameterNames());
     String filename = "";
     String convFilename = "";
     FileSystemResource uploadDir = new FileSystemResource("/resources/photoUpload/");
     
     MultipartHttpServletRequest multipart = (MultipartHttpServletRequest) request;
     MultipartFile file = multipart.getFile("Filedata");
     String callBack = multipart.getParameter("callback_func");
     System.out.println("callback="+callBack);
     if(!file.isEmpty()) {
      
      filename = file.getOriginalFilename();
      System.out.println("filename => "+filename);
       String genId = UUID.randomUUID().toString();//파일중복확인
       System.out.println("genId => "+genId);
       convFilename = genId + "-"+ filename;
       System.out.println("convFilename => "+convFilename);
      try {
       if(file.getSize() > 0){
        File out = new File(uploadDir.getPath() + "/" + convFilename);
        FileCopyUtils.copy(file.getBytes(), out);
        convFilename = out.getName();
       }
      } catch (IOException e) {
       e.printStackTrace();
      }
     
     }

     model.addAttribute("filename", convFilename);
     model.addAttribute("callback_func", callBack);
     
     return "board/file_uploader";
    } // writeBoard

    @RequestMapping(value = "/file_uploader_html5", method = RequestMethod.POST)
    public String writeBoard_html5(Locale locale, Model model,HttpServletRequest request) {
     
       System.out.println( request.getParameterNames());
     String filename = "";
     String convFilename = "";
     FileSystemResource uploadDir = new FileSystemResource("C:/Users/compl/Desktop/SpringGit/SpringProject/src/main/webapp/resources/photoUpload/");
     
     MultipartHttpServletRequest multipart = (MultipartHttpServletRequest) request;
     MultipartFile file = multipart.getFile("Filedata");
     String callBack = multipart.getParameter("callback_func");
     System.out.println("callback="+callBack);
     if(!file.isEmpty()) {
      
      filename = file.getOriginalFilename();
      System.out.println("filename => "+filename);
       String genId = UUID.randomUUID().toString();//파일중복확인
       System.out.println("genId => "+genId);
       convFilename = genId + "-"+ filename;
       System.out.println("convFilename => "+convFilename);
      try {
       if(file.getSize() > 0){
        File out = new File(uploadDir.getPath() + "/" + convFilename);
        FileCopyUtils.copy(file.getBytes(), out);
        convFilename = out.getName();
       }
      } catch (IOException e) {
       e.printStackTrace();
      }
     
     }

     model.addAttribute("filename", convFilename);
     model.addAttribute("callback_func", callBack);
     
     return "board/file_uploader";
    } // writeBoard_html5

   
   
   @RequestMapping(value="/boardDetail")
   public ModelAndView boardDetail(HttpServletRequest request, 
         ModelAndView mav, Login lvo, Pboard bvo, Bridge evo) 
         throws ServletException, IOException {
      System.out.println("---boardDetail-----------------------------------------------");

      
      
      HashMap<String,Object> bvoInfo = bDAO.bDetail(bvo);
      System.out.println(bvoInfo);
      
      int id = bvo.getId();
      int replyCount = bDAO.totalRecord_reply(id);
      System.out.println(replyCount);
      
      HttpSession session = request.getSession();
         bDAO.viewCount(bvo);
         
         lvo = (Login)session.getAttribute("Identity");

         
   
         if(lvo != null) {
            
            evo.setPuser_id(lvo.getId());
            evo.setPboard1_id(id);
            request.setAttribute("likeCheck", bDAO.bridgeCheck(evo));
            System.out.println(bDAO.bridgeCheck(evo));
            mav.addObject("bvoInfo", bvoInfo);
            //mav.addObject("replyCount",replyCount);
            mav.setViewName("board/bDetailView");
            }
         
         else {
            mav.addObject("bvoInfo", bvoInfo);
            //mav.addObject("replyCount",replyCount);
            mav.setViewName("board/bDetailView");
         }
            return mav;
   } // boardDetail
            
   
   
   
   @RequestMapping(value="/boardChoice", method = { RequestMethod.GET})
   public @ResponseBody int boardChoice(HttpServletRequest request,
         Login lvo, Bridge evo, Pboard bvo) 
         throws ServletException, IOException {
      System.out.println("---------------boardChoice--------------------");
      HttpSession session = request.getSession();
      lvo = (Login)session.getAttribute("Identity");
      request.getParameter("id");
      evo.setPuser_id(lvo.getId());
      evo.setPboard1_id(bvo.getId()); 
      System.out.println(evo);
      //System.out.println("choice =>" +bDAO.bridgeInsert(evo,bvo));
      return bDAO.bridgeInsert(evo,bvo); 
   } // boardChoice
   
   
   @RequestMapping(value="/choiceCancel", method = { RequestMethod.GET})
   public @ResponseBody int bridgeDelete(HttpServletRequest request, 
         Login lvo, Bridge evo, Pboard bvo) 
         throws ServletException, IOException {
      HttpSession session = request.getSession();
      lvo = (Login)session.getAttribute("Identity");
      request.getParameter("id");
      
      evo.setPuser_id(lvo.getId());
      evo.setPboard1_id(bvo.getId()); 
      System.out.println(evo);
      //System.out.println("choice =>" +bDAO.bridgeInsert(evo,bvo));
      return bDAO.bridgeDelete(evo,bvo); 
   } // bridgeDelete

   @RequestMapping(value="/boardUpdate")
   public ModelAndView boardUpdate(HttpServletRequest request, ModelAndView mav, Pboard bvo) 
         throws ServletException, IOException {
   
   /*   
      
      MultipartFile uploadFile = bvo.getUploadFile();
      String fName1, fName2 = "NoImage";   // 실제 저장경로 : fName1, 앱이 읽을 수 있는 경로 : fName2 => table에 저장되는 값
      
      if(!uploadFile.isEmpty()) {
         fName1 = "C:/Users/compl/Desktop/SpringGit/SpringProject/src/main/webapp/resources/photoUpload/" + uploadFile.getOriginalFilename();
         uploadFile.transferTo(new File(fName1));
         fName2 = "resources/uploadedImages/" + uploadFile.getOriginalFilename();
         bvo.setImage(fName2);
      }      */
      int cnt = bDAO.bUpdate(bvo);
      if(cnt>0) { mav.setViewName("redirect:boardDetail?id="+bvo.getId()); }
      else {
         mav.setViewName("board/bUpdateFailed");
      }
      return mav;
   } // boardUpdate
   
   
   @RequestMapping(value="/searchList")
   public ModelAndView searchList(HttpServletRequest request,@RequestParam(defaultValue="title") String searchOption,
         @RequestParam(defaultValue="") String keyword, @RequestParam(defaultValue="") String tag, 
         Page pvo, ModelAndView mav) throws ServletException, IOException {
   System.out.println("-------------searchList-------------------");
   //System.out.println(pvo);
   String pageSizeStr= "10";
   
   int pageNum=0;
   
   if(pvo !=null && pvo.getPageNum() >0) {
      pageNum = pvo.getPageNum();
   }else {
      pageNum =1;
      pvo.setPageNum(pageNum);
   }
   mav.addObject("pageNum", pageNum);
   System.out.println("pageNum =>"+pageNum);
   //System.out.println(searchOption);
   //System.out.println(keyword);
   int totalRecord = bDAO.searchRecordCount(pvo);
   System.out.println("totalRecord =>"+totalRecord);
   mav.addObject("totalRecord",totalRecord);
   int pageSize = Integer.parseInt(pageSizeStr);
   System.out.println("pageSize =>"+pageSize);
   int totalPage = totalRecord / pageSize;
   if((totalRecord % pageSize) != 0) {
      totalPage ++;
   }
   if (totalPage == 0 ) {
      totalPage ++;
   }
   System.out.println("totalPage=> "+totalPage);
   mav.addObject("totalPage", totalPage);
   
   pvo.setPageSize(pageSize);
   
   System.out.println(tag);
   
      List<Pboard> list = bDAO.getSearchList(pvo);
      System.out.println(list);
      Map<String,Object> map = new HashMap<String,Object>();
      map.put("list", list);
      //map.put("totalRecord", totalRecord);
      map.put("searchOption", searchOption);
      map.put("keyword", keyword);
      map.put("tag", tag);
      System.out.println(map);
      mav.addObject("map",map);
      mav.addObject("tag",tag);
      mav.setViewName("board/searchList");
      return mav;
   } // searchList
   
   
   @RequestMapping(value="/boardDelete")
   public ModelAndView boardDelete(HttpServletRequest request, ModelAndView mav, Pboard bvo) {
     String tag = request.getParameter("tag");
      int cnt = bDAO.bDelete(bvo);
      if(cnt>0) {
         mav.setViewName("redirect:boardList?tag="+tag);
      }else { mav.setViewName("board/bUpdateFailed"); }
      return mav;
   } // boardDelete
   
}