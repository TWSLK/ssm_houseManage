<%-- <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
</head>

<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加内容</strong></div>
  <div class="body-content">
   <form class="add-msg-form" action="login.do"  method="post"><!-- enctype="multipart/form-data" -->
					<div class="form-group">
			        <div class="label">
			          <label>用户名：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50"  name="uname"  id="uname_loss"  placeholder="请输入用户名" onblur="checkLossPwd();" />
			          <div id='checkUname' class="tips"></div>
			        </div>
			        </div>
			        <div class="form-group"   id="showMbanswer" style="display: none">
			        <div class="label" >
			          <label>密保问题：</label>
			        </div>
			        <div class="field">
			         <input  id="mbanswer_loss" class="input w50" type="text"  readonly="readonly"/>
			        </div>
			        </div>
			        
			        <div class="form-group"   id="showQuestion" style="display: none">
			        <div class="label" >
			          <label>密保答案：</label>
			        </div>
			        <div class="field">
			         <input name="question" id="miBaoQuestion" type="text" placeholder="请输入密保答案" onblur="checkMiBao();"/>
					<span id="checkMbquestion"></span>
			        </div>
			        </div>
			          <div class="form-group"  >
			          <div class="label" >
			          <label></label>
			        </div>
					<div class="cf-column col-md-12 submit-column">
						<a href="login.jsp"  class="button bg-main icon-check-square-o">返回登录页面</a>
					</div>
				</div>
			</form>
		</div>
	</div> --%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
</head>

<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加内容</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="addUser.do" >  
      <div class="form-group">
        <div class="label">
          <label>用户名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50"  name="uname"  id="uname_loss"  placeholder="请输入用户名" onblur="checkLossPwd();" />
          <div id='checkUname' class="tips"></div>
        </div>
        </div>
        <div class="form-group"   id="showMbanswer" style="display: none">
        <div class="label" >
          <label>密保问题：</label>
        </div>
        <div class="field">
         <input  id="mbanswer_loss" class="input w50" type="text"  readonly="readonly"/>
        </div>
        </div>
        
        <div class="form-group"    id="showQuestion" style="display: none">
        <div class="label" >
          <label>密保答案：</label>
        </div>
        <div class="field">
         <input name="question" class="input w50" id="miBaoQuestion" type="text" placeholder="请输入密保答案" onblur="checkMiBao();"/>
		<span id="checkMbquestion"></span>
        </div>
        </div>
    
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
        <a class="button bg-main icon-check-square-o" href="login.jsp">返回登录</a>
         <!--  <button  type="submit" onclick="return checkAll()"> 提交</button> -->
        </div>
      </div>
    </form>
  </div>
</div>

</body></html>				
