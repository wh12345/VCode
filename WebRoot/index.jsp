<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-1.11.0.min.js"></script>
</head>
<body>
    <h2>测试验证码：</h2>
    请输入验证码：<input type="text" name="code" /><img id="codeimg" height="30px" src="${pageContext.request.contextPath }/createCode" onclick="changeImg()"><a href="javascript:void(0);" onclick="changeImg()">看不清，换一张</a>
    <button onclick="submit()">提交</button>
    <script type="text/javascript">
    
        //改变验证码事件
        function changeImg(){
            var src = "${pageContext.request.contextPath }/createCode?x=" + Math.floor(Math.random()*100);
            $("#codeimg").attr("src",src);
        }
        
        //提交验证并验证验证码
        function submit(){
            var code = $("input[name='code']").val();
            //ajax提交
            var xhr = new XMLHttpRequest();
            
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4 && xhr.status == 200) {
                    alert(xhr.responseText);
                }  
            }
            
            xhr.open('get','${pageContext.request.contextPath }/verifyCode?code=' + code);
            xhr.send(null);
            
        }
        
        
        
    </script>
</body>
</html>