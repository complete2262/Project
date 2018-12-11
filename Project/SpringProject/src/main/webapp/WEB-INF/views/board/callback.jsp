<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML> 
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>FileUploader Callback</title>
</head>
<body>
  <script type="text/javascript">
		
  
  
        // execute callback script
        try{
        var sUrl = document.location.search.substr(1);
		if (sUrl != "blank") {
			var oParameter = {
					sFileName : "${filename}",
					sFileURL : "http://localhost:8090/project/resources/photoUpload/${filename}",
					bNewLine : true
				}; // query
	        sUrl.replace(/([^=]+)=([^&]*)(&|$)/g, function(){
	            oParameter[arguments[1]] = arguments[2];
	            return "";
	        });//스마트 에디터 플러그인 부분 이걸쓰면 커서 따라감
	        var sFile = oParameter.sFileURL + oParameter.sFileName;
	        document.write(sFile);
	        
	        window.opener.pasteHTML(sFile);
		}}catch(e){
			alert("callback");
			//this.window.close();
		}

    </script>
</body>
</html>

	