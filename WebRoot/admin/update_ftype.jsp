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
<title>更新类别信息</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script type="text/javascript" src="js/login.js"></script>
</head>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>

<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>更新内容</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="" > 
      <div class="form-group">
        <div class="label">
          <label>名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${ftype.name }" name="name" id="ftype" data-validate="required:请输入类别"  onblur="return updateTypeName();" />
          <input type="hidden" id="fid"  value="${ftype.id }" name="id" />
          <div class="tips" id="checkTypeName"></div>
        </div>
      </div>
    
      
    </form>
  </div>
</div>

</body></html>