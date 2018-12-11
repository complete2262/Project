<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE script PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
	function fileAttach(){ 
		fpath = "/resources/photoUpload/";
	    fname = "${filename}";
	    fcode = fpath + fname;
	    
	   
	    try{
	        window.opener.pasteHTML(fcode);
            alert("사진이 업로드되었습니다") ;
	    	window.close();
	    }catch(e){ 
           alert(e); 
	    }
	}
	fileAttach();
	this.window.close();
	
	
	

</script>
