<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		<title>论坛信息详情_我的网站</title>
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
function down1(fujianPath)
{
   var url="updown.jsp?fujianPath="+fujianPath;
   url=encodeURI(url); 
   url=encodeURI(url); 
   window.open(url,"_self");
}
</script>
<script charset="utf-8" src="/fangwuzulinsys/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="/fangwuzulinsys/kindeditor/lang/zh-CN.js"></script>
<script>
	        KindEditor.ready(function(K) {
	                window.editor = K.create('#editor_id');
	        });
	</script>
	<script>

KindEditor.ready(function(K) {

K.create('textarea[name="note"]', {

uploadJson : '/fangwuzulinsys/kindeditor/jsp/upload_json.jsp',

                fileManagerJson : '/fangwuzulinsys/kindeditor/jsp/file_manager_json.jsp',

                allowFileManager : true,

                allowImageUpload : true, 

autoHeightMode : true,

afterCreate : function() {this.loadPlugin('autoheight');},

afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息

});

});

</script>
	<body>
		<div id="container">
		
			<jsp:include page="top.jsp"></jsp:include>

			<div class="breadcrumb-wrapper">
				<div class="container">
					<div class="row">
						<div class="col-md-3 col-sm-4 bcid-cat">${bbs.name }</div>
						<div class="col-md-9 col-sm-8 location"><i class="fa fa-map-marker"></i> &nbsp;<span>当前位置： <a href='javascript:;'>主页</a> > <a href='javascript:;'>论坛信息</a></span></div>
					</div>
				</div>
			</div>
			<div class="page-container" id="innerpage-wrap">
				<div class="container">
					<div class="row">
						<div class="main col-md-9 inner-left" role="main">
							<div class="about-page-wrap">
								<div class="com-cnt page-content"><br />
									<p>
										&nbsp;</p>
									<p >
									<c:forEach items="${ulist }" var="t">
									<c:if test="${t.uid==bbs.uid }">
									 <img  alt="${u.tname }" src="./upload/${t.img }" width="50px;" height="50px;" /> 发布人：${t.tname }
									</c:if>
									</c:forEach>发布时间：${bbs.pubtime }
									</p>
									<hr>
									内容：${bbs.note }
									<hr>
									<div id="pages" class="page"></div>
									 <c:forEach items="${blist }" var="b">
									<p >
									<c:forEach items="${ulist }" var="u">
									<c:if test="${u.uid==b.hid }">
									<img  alt="${u.tname }" src="./upload/${u.img }" width="50px;" height="50px;" />
									回复人：${u.tname }  回复时间：${b.htime }
									</c:if>
									</c:forEach></p>
									<hr>
									回复内容：${b.note2 }
									<hr>
									</c:forEach>
								</div>
								<form action="addBbs_huiFu.do" method="post" >
								<div id="contact-wrap">
								
								   
									<c:if test="${sessionScope.user==null }">
									<p>请登录后操作！</p>
									<h3 class="msg-title"><a href="login.jsp">登录</a></h3>
									<p>
									</c:if>
									<c:if test="${sessionScope.user!=null }">
									<p> <textarea rows="" cols="" id="editor_id" style="width:100%;height:100px;" name="note2"></textarea>  </p>
									<input type="hidden" value="${bbs.id }" name="bid">
									<h3 class="msg-title"></h3>
									<p>
									<input type="submit" value="提交"></p>
									</c:if>
									
									<script type="text/javascript" src="skin/js/jquery.form.js"></script>
									<script type="text/javascript" src="skin/js/jquery.artdialog.js"></script>
									<script type="text/javascript" src="skin/js/iframetools.js"></script>
								</div></form>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			<div class="for-bottom-padding"></div>
				<jsp:include page="foot.jsp"></jsp:include>
		</div>
		 <jsp:include page="foot2.jsp"></jsp:include>