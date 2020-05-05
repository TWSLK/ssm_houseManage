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
<title>更新用户信息</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<%-- <script src="js/pintuer.js"></script> --%>
</head>

<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>更新内容</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="updateUser.do" >  
      <div class="form-group">
        <div class="label">
          <label>用户名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${user.uname }" name="uname"  readonly="readonly"/>
          <input type="hidden"  value="${user.uid }" name="uid" />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>密码：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${user.pwd }" name="pwd"  />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>电话：</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="tel" class="input w50" value="${user.tel}" />
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>性别：</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="sex" class="input w50" value="${user.sex}" />
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>地址：</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="address" class="input w50" value="${user.address}" />
        </div>
      </div> 
       <div class="form-group">
        <div class="label">
          <label>微信：</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="weixin" class="input w50" value="${user.weixin}" />
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>邮箱：</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="email" class="input w50" value="${user.email}" />
        </div>
      </div> 
         <div class="form-group">
        <div class="label">
          <label>密保问题：</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="mbanswer" class="input w50" value="${user.mbanswer}" />
        </div>
      </div> 
        <div class="form-group">
        <div class="label">
          <label>密保答案：</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="question" class="input w50" value="${user.question}" />
        </div>
      </div> 
      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>

</body></html>