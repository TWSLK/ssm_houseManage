<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="renderer" content="webkit" />
	<meta name="robots" content="index, follow" />
	<title>修改信息_我的网站</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link rel="stylesheet" type="text/css" href="skin/css/font-awesome.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="skin/css/bootstrap.min.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="skin/css/owl.carousel.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="skin/css/owl.theme.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="skin/css/settings.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="skin/css/style-red.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="skin/css/tk.css" media="screen" />
	<script type="text/javascript" src="skin/js/jquery.min.js"></script>
	<script type="text/javascript" src="skin/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="skin/js/owl.carousel.min.js"></script>
</head>
<script type="text/javascript">
	function checkuname() {
		var name = $("#username").val();
		if(name==""||(name.length<3||name.length>12)){
			 $("#checku").html("用户账号不能为空且长度在3～12位之间！");
			 $("input[id=username]").focus();
		} else {
			$("#checku").html("");
			$.ajax({
				url : "checkUname.do",
				type : "post",
				data : "uname=" + name,
				
				dataType : "json",
				success:function(result){
				if(result.info=="ng"){
				$("#checku").html("用户名存在，请更换！");
				$("input[id=username]").focus();
				return false;
				}else{
				$("#checku").html("可以用");
				return true;
				}
				},
				error:function(){
				alert("请求失败！");
				return false;
				}

			});
		}

	}
	 function checkpwd(){
		  var pwd=$("#txtPwd").val();
		  if(pwd==""||pwd.length<6||pwd.length>12){
		 $("#prompt_pwd").html("密码不能为空且长度在6～12位之间！");
		 $("input[id=txtPwd]").html("");
		  $("input[id=txtPwd]").focus();
		 return false;
		}else {
		 $("#prompt_pwd").html("密码格式正确！");
		return true;}

		}

		function checkpwdc(){
		var pwd=$("#txtPwd").val();
		var pwdc=$("#txtConfirmPwd").val();
		if(pwdc==""||pwdc!=pwd){
		  $("#prompt_confirmpwd").html("两次密码要一致 ！");
		  $("input[id=txtConfirmPwd]");
		   // $("input[name=passwordc]").focus();
		  return false;
		  }else{
		  $("#prompt_confirmpwd").html("密码一致 ！");
		  return true;}

		}

		 function checktel(){
		 var tel=$("#txtPhone").val();
		 var regtel=/^(13|15|18|)\d{9}$/;
		 if(tel==""||!regtel.test(tel)){
		  $("#prompt_phone").html("电话号码不能为空，且以13，15，17，18开头的11位");
		  $("input[id=txtPhone]").html("");
		   $("input[id=txtPhone]").focus();
		  return false;
		  }else{
		   $("#prompt_phone").html("电话号码格式正确！");
		  return true;
		  }

		 }
		 function checkname1(){ 
			  var uname=$("#txtName1").val();
			  if(uname==""||uname.length<2){
			  $("#prompt_name1").html("不能为空且长度在2位以上！");
			  $("input[id=txtName1]").html("");
			   $("input[id=txtName1]").focus();
			  return false;
			  }else{
			  
			  $("#prompt_name1").html("ok");
			  return true;
			  }} 
		  
		 function checkname2(){ 
			  var uname=$("#txtName2").val();
			  if(uname==""||uname.length<2){
			  $("#prompt_name1").html("不能为空且长度在2位以上！");
			  $("input[id=txtName2]").html("");
			   $("input[id=txtName2]").focus();
			  return false;
			  }else{
			  
			  $("#prompt_name2").html("ok");
			  return true;
			  }} 
		  
		  
	function check(){
		var flag= checkuname() 
		      &&checkpwd()
			  &&checkpwdc()
			  &&checktel()
			  && checkname1() && checkname2();
		//alert(flag);
		return flag;
	}
	function checkAll(){
		//alert("kkkkk");
		var flag=false;
		var aa = $("#username").val();
		var pwd=$("#txtPwd").val();
		var pwdc=$("#txtConfirmPwd").val();
		var tel=$("#txtPhone").val();
		var name1=$("#txtName1").val();
		var name2=$("#txtName2").val();
		 var regtel=/^(13|15|18|)\d{9}$/;
		 if(aa!=""&&(tel!=""||regtel.test(tel))&&(name1!=""||name1.length>2)&&(name2!=""||name2.length>2)&&
				 (pwd!=""||pwd.length>6||pwd.length<12)&&(pwdc!=""||pwdc==pwd)){
			 flag=true;
		 }else{
			 alert("注册信息不完整或不合规范！");
		 }
		return flag;
		
	}
</script>
<body>
	<div id="container">
	
		<jsp:include page="top.jsp"></jsp:include>

		<div class="breadcrumb-wrapper">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-4 bcid-cat">修改个人信息</div>
					<div class="col-md-9 col-sm-8 location"><i class="fa fa-map-marker"></i> &nbsp;<span>当前位置： <a href='javascript:;'>主页</a> > <a href='javascript:;'>注册</a></span></div>
				</div>
			</div>
		</div>
		<div class="page-container" id="innerpage-wrap">
			<div class="container">
				<div class="row">
					<div class="main col-md-9 inner-left" role="main">
						<div class="about-page-wrap">
							<div id="contact-wrap">
								<h3 class="msg-title">会员修改</h3>
								<form class="add-msg-form" action="addShowInfo.do" onsubmit="return check();"  method="post" enctype="multipart/form-data" ><!-- enctype="multipart/form-data" -->
									<div class="row">
										<div class="cf-column col-md-12"> 
											<input id="username" type="text" value="${user.uname }" placeholder="登录名" readonly="readonly"   />
											<input type="hidden" name="uid" value="${user.uid }">
											<span id='checku' class="spanInit" ></span>
										</div>
										<div class="cf-column col-md-12"> 
											<input name="tname" value="${user.tname }"  type="text" placeholder="真实姓名" onblur="return checkuname2()"    />
											<span id='checku2' class="spanInit" ></span>
										</div>
										
										<div class="cf-column col-md-12">
											<input name="pwd" id="txtPwd" type="password" value="${user.pwd }" placeholder="密码"  onblur="return checkpwd()"  />
											<span id='prompt_pwd'  class="spanInit" ></span>
										</div>
										
										<div class="cf-column col-md-12">
											<input name="sex" id="sex" type="text" value="${user.sex }" placeholder="请输入性别"  />
											<span id='' class="spanInit" ></span>
										</div>
										
										<div class="cf-column col-md-12">
											<input name="tel" id="txtPhone" value="${user.tel }" type="text" placeholder="电话/手机"  id="txtPhone" onblur="return checktel()" />
											<span id='prompt_phone' class="spanInit" ></span>
										</div>
										<div class="cf-column col-md-12">
												<input name="weixin" id="" type="text" value="${user.weixin }" placeholder="请输入微信"  required="required" />
												<span id='' class="spanInit" ></span>
											</div>
											<div class="cf-column col-md-12">
												<input name="email" id="" type="text"  value="${user.email }" placeholder="请输入邮箱"  required="required" />
												<span id='' class="spanInit" ></span>
											</div>
										<div class="cf-column col-md-12">
											<input name="address" value="${user.address }" id="address" type="text" placeholder="地址" />
										</div>
										<div class="cf-column col-md-12">
											<input name="file"  id="" type="file"  />
										</div>
										<div class="cf-column col-md-12">
												<input name="mbanswer" id="" value="${user.mbanswer }" type="text" placeholder="密保问题" required="required" />
											</div>
											<div class="cf-column col-md-12">
												<input name="question" id="" value="${user.question }" type="text" placeholder="密保答案" required="required"/>
											</div>
										
										<div class="cf-column col-md-12 submit-column">
											<button type="submit" id="submit-btn" class="submit-button" onclick="return checkAll()">修改</button>
										</div>
									</div>
								</form>
								<script type="text/javascript" src="skin/js/jquery.form.js"></script>
								<script type="text/javascript" src="skin/js/jquery.artdialog.js"></script>
								<script type="text/javascript" src="skin/js/iframetools.js"></script>
							</div>
						</div>
					</div>
					<aside class="sidebar col-md-3 inner-right" role="complementary">
					</aside>
				</div>
			</div>
		</div>
		<div class="for-bottom-padding"></div>
		 <jsp:include page="foot.jsp"></jsp:include>
	</div>
	 <jsp:include page="foot2.jsp"></jsp:include>