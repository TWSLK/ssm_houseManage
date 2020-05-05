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
          <input type="text" class="input w50"  name="uname"  id="username"  onblur="return checkuname()" />
          <div id='checku' class="tips"></div>
        </div>
      </div>
     <div class="form-group">
        <div class="label">
          <label>姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50"  name="tname"  />
          <div id='checkud' class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>角色：</label>
        </div>
        <div class="field">
        <select name="utype" class="input w50">
        	<option value="会员">会员</option>
        </select>
          <div id='checkud' class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50"   id="txtPwd"   onblur="return checkpwd()"/>
          <div id='prompt_pwd'  class="tips"></div>
        </div>
      </div>
          <div class="form-group">
        <div class="label">
          <label>确认密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" name="pwd"   id="txtConfirmPwd" onblur="return checkpwdc()"/>
          <div id='prompt_confirmpwd' class="tips"></div>
        </div>
      </div>
        <div class="form-group">
          <div class="label">
            <label>手机号：</label>
          </div>
          <div class="field">
           <input name="tel" type="text" class="input w50" id="txtPhone" onblur="return checktel()"/>
            <div  id='prompt_phone' class="tips"></div>
          </div>
        </div>
        <div class="form-group">
          <div class="label">
            <label>地址：</label>
          </div>
          <div class="field">
           <input  type="text" name="address" class="input w50"  />
            <div  id='' class="tips"></div>
          </div>
        </div>
        <div class="form-group">
          <div class="label">
            <label>密保问题：</label>
          </div>
          <div class="field">
           <input  type="text" name="mbanswer" class="input w50" required="required"  />
            <div  id='' class="tips"></div>
          </div>
        </div>
        <div class="form-group">
          <div class="label">
            <label>密保答案：</label>
          </div>
          <div class="field">
           <input  type="text" name="question" class="input w50" required="required" />
            <div  id='' class="tips"></div>
          </div>
        </div>
        
        
      <div class="form-group">
        <div class="label">
          <label>性 别 ：</label>
        </div>
        <div class="field" >
            <input name="sex"   type="radio" id="radio" value="男" checked="checked" />
        男
        <input type="radio"   name="sex" id="radio2" value="女" />
        女
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit" onclick="return checkAll()"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>

</body></html>