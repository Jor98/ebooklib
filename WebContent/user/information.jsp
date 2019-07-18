<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人信息</title>
     <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <!--导入自己要使用的CSS文件-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
    <!--需要引入JQuery-->
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/style.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/common.js"></script>
    <!--<script type="text/javascript" src="../js/main.js"></script>-->
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<style type="text/css">
	.logindiv{
		position: absolute;
		background-color: rgba(16, 16, 16, 0.5);
		width: 100%;height: 30px;
	}
	.logindiv span{
		float: right; 
		line-height: 30px; 
		margin: 0 110px;
	}
	.logindiv span a{
		color: white;
		font-family:'微软雅黑';
		font-size: 15px;
		width：40px;
	}
	.logindiv span a:hover{
		color:#9d9d9d;
	}
</style>
<body>
<!--
    1. 总共是5部分
    2. 第一部分是LOGO部分
    3. 第二部分是导航菜单
    4. 第三部分是注册部分
    5. 第四部分是FOOTER图片
    6. 第五部分是一堆超链接

-->
<div class="container">
    <!--导航栏部分-->
    <nav class="navbar navbar-inverse" style="height:60px;">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath }/user/delicious.jsp">首页</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav" style="width: 60%;">
                    <li>
                        <a href="${pageContext.request.contextPath }/user/libdetails.jsp">本馆概况<span class="sr-only">(current)</span></a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/user/rule.jsp">读者服务</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/user/digitalresource.jsp">数字阅读</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/user/locallog.jsp">文献馆</a>
                    </li>
                    <li>
                        <a href="#">参考咨询</a>
                    </li>
                </ul>
                <form class="navbar-form navbar-right" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="输入关键字">
                    </div>

                    <button type="submit" class="btn btn-default"><i class="fa fa-search" style="font-size: 18px;"></i></button>
                </form>

            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    
    
<div style="width: 100%">

    <!--2. 第一部分是LOGO部分-->
    <!--清除浮动-->
    <!--4. 第三部分是注册部分-->
    <div style="background: url(${pageContext.request.contextPath }/img/2.jpg);height: 700px;background-size:100% 100%;">
        <div style="position:absolute;top:200px;left:350px;border: 5px solid darkgray;width: 50%;height: 50%;background-color: white;opacity: 0.9">
            <form>
            <table width="60%" align="center"style="margin-top: 8%;margin-left: 28%;">
                <tr><td>用户名:</td><td><s:property value="#session.exisUser.user_account"/></td></tr>
                <tr><td>email:</td><td><s:property value="#session.exisUser.user_email"/></td>
                </tr><tr><td>姓名:</td><td><s:property value="#session.exisUser.user_name"/></td></tr>
                <tr><td>性别:</td><td>
                	<s:if test="#session.exisUser.user_gender == '0'.toString()">男</s:if>
                	<s:else>女</s:else>
                </td></tr>
                <tr><td>生日:</td><td><s:date name="#session.exisUser.user_birthday" format="yyyy-MM-dd" /></td></tr>
                <tr><td>已借书籍:</td><td><s:property value="#session.exisUser.user_borrowcount"/>本</td></tr>
            </table>
                <div style="position:relative;left: 24%;margin-top:50px">
                    <input type="button" value="修改资料" style="margin-right:7%;" onclick="javascript:window.location.href='${pageContext.request.contextPath }/user/edit.jsp'"/>
                    <input type="button" value="修改密码" style="margin-right:7%;" onclick="javascript:window.location.href='${pageContext.request.contextPath }/user/password.jsp'"/>
                    <input type="button" value="已借图书" style="margin-right:7%;" onclick="javascript:window.location.href='${pageContext.request.contextPath }/user/borrowbook.jsp'"/>
                    <input type="button" value="退出登陆" style="margin-right:7%;" onclick="javascript:window.location.href='${pageContext.request.contextPath }/user_logout.action'">
                </div>
            </form>
        </div>
    </div>
</div>
<!-- footer -->
    <div class="row" style="background:dimgray;border-style:double;height: 250px;width: 100%">
        <!--左边的消息框-->
        <div class="col-md-12" style="float:left;width: 70%;margin-left: 40px">
           <!--上面部分 -->
            <!--左边-->
           <div style="font-family:zFont2;font-size:30px;width:200px;height:40px;margin:40px 30px;float: left;color:white ">真香图书馆</div>
            <!--右边-->
            <div style="height: 100px;margin:20px 250px;width: 75%;text-align: left;color:white;font-size: 13px">Copyright © 2014-2018 真香图书馆 版权所有(第六版)    &nbsp; &nbsp;&nbsp;&nbsp;邮政编码：610041 &nbsp;&nbsp;&nbsp;&emsp;&emsp;设计制作：真香图书馆信息自动化部&爱诚科技 &emsp;&emsp;地址：真香市文翁路98号  &emsp;&emsp;&nbsp;网址：http://www.cdclib.org  &emsp;读者意见邮箱：cdlibdzfw@foxmail.com
                &emsp;&emsp;&emsp;&emsp; 川公网安备 51010502010606号   &emsp;&emsp;  蜀ICP备08104443号-6</div>
            <!--下面部分 -->
            <div style="color:white;text-align: left;margin: 10px 38px;">
                <ul style="float:left;">
                    <li>全国古籍重点保护单位</li>
                    <li>真香市古籍保护中心</li>
                    <li>国家一级图书馆</li>
                    <li>公共文化措施</li>
                    <li>全民阅读示范基地</li>
                </ul>
                <ul style="float:left;margin-left: 100px;margin-right: 100px;">
                    <li>全国古籍重点保护单位</li>
                    <li>真香市古籍保护中心</li>
                    <li>国家一级图书馆</li>
                    <li>公共文化措施</li>
                    <li>全民阅读示范基地</li>
                </ul>
                <ul style="float:left;">
                    <li>全国古籍重点保护单位</li>
                    <li>真香市古籍保护中心</li>
                    <li>国家一级图书馆</li>
                    <li>公共文化措施</li>
                    <li>全民阅读示范基地</li>
                </ul>
                <ul style="float:left;margin-left: 100px;">
                    <li>全国古籍重点保护单位</li>
                    <li>真香市古籍保护中心</li>
                    <li>国家一级图书馆</li>
                    <li>公共文化措施</li>
                    <li>全民阅读示范基地</li>
                </ul>
            </div>
        </div>

        <!--微信栏-->
        <div style="color: white;width: 25%;float: right;height: 100%;position: relative;"><img src="${pageContext.request.contextPath }/img/07.jpg"style="position: absolute;bottom: 0px;left:20%;width: 40%"> </img> </div>
    </div>
</div>
</body>
</html>
