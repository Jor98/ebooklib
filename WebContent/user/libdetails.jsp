<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>


<head>
    <meta charset="UTF-8">
    <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->
    <!--<meta name="viewport" content="width=device-width, initial-scale=1.0">-->
    <title>本馆概况</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
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
		
		.div11{
    		width: 100%;
    		height: 80px;
    		background:#93a5e4;
    		text-align: center;
    		line-height: 80px;
    		font-size: 20px;
    		border-bottom: 2px solid white;
    	}
    	.div11:hover{
    		background-color: #9eaee7;
    	}
	</style>
</head>

<body>
<!--最外层的布局容器-->
<div class="container">
    <!--LOGO部分-->
    <div class="row">
    	<div class="logindiv">
			<s:if test="#session.exisUser == null">
    			<span ><a href="${pageContext.request.contextPath }/user/login.jsp">登录</a></span>
    		</s:if>
    		<s:else>
    			<span ><a href="${pageContext.request.contextPath }/user/information.jsp"><s:property value="#session.exisUser.user_name" /></a></span>
    		</s:else>
    	</div>
        <div >
            <img src="${pageContext.request.contextPath }/img/001.jpg"  width="100%" height=200px/>
        </div>
    </div>

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
    
    <div style="height: 800px;color: black;">
    	
    	<div style="width: 15%;height: 100%;float: left;" >
    		<div style=" width: 100%;height: 80px;background:#6986eb;text-align: center;line-height: 80px;font-size: 30px;font-family: '楷体';"><b style="color: black;">本馆概况</b></div>
    		<div class="div11"><b style="color: black;"><a style="color: black;" href="${pageContext.request.contextPath }/user/libdetails.jsp">本馆简介</a></b></div>
    		<div class="div11"><b style="color: black;"><a style="color: black;" href="${pageContext.request.contextPath }/user/opentime.jsp">开放时间</a></b></div>
    		<div class="div11"><b style="color: black;"><a style="color: black;" href="${pageContext.request.contextPath }/user/traffic.jsp">交通指南</a></b></div>  		
    	</div>
    	
    	<div style="background-color: ;float: left; width: 85%;height: 100%;text-align: center;" >
    		<br>
    		<b style="font-family: '楷体';font-size: 40px;color: black">本馆简介</b>
    		<hr>
    		<h1><b style="font-size: 25px;">使命</b></h1>
    		<p style="text-indent:2em; text-align: left;font-size: 18px;line-height: 22px;">“发展天府文化，建设书香肇庆”</p>
    		<p style="text-indent:2em; text-align: left;font-size: 18px;line-height: 22px;">提升文献海量信息资源建设，构筑肇庆市公共图书馆 联盟，实现市、区（市）县、街道（乡镇）、社区（村社）全覆盖的通借通还服务，加强 24 小时街区图书馆建设，完善服务网络，面向市民开展丰富阅读活动，提供城乡均等化的知识信息服务，提升市民科学文化素质，保障市民基本文化权益，为肇庆建设成为“书香肇庆”和“文化之都”提供智力支持。</p>
    		
    		<h1><b style="font-size: 25px;">愿景</b></h1>
    		<p style="text-indent:2em; text-align: left;font-size: 18px;line-height: 22px;">“发展天府文化，建设书香肇庆”</p>
    		<p style="text-indent:2em; text-align: left;font-size: 18px;line-height: 22px;">将真香图书馆建设成国内一流、西部领先的现代化城 市中心图书馆。立足“城市文献信息中心、市民终身教育中心”的功能定位，建立与肇庆国家中心城市相匹配的城市图书馆。顺应肇庆城市发展和市民素质提升的需要，在新馆建设中体现出“读者第一、服务至上、公益性、人性化”的办馆宗旨和“创新与品牌”的服务理念。</p>
    		<p style="text-indent:2em; text-align: left;font-size: 18px;line-height: 22px;">真香图书馆创建于1912年，馆名先后称：广东图书馆、肇庆市立图书馆、肇庆通俗教育馆分部、肇庆市图书馆；2003年9月，更名为真香图书馆，是市委、市政府“为民办实事”项目，于2003年10月1日正式对外开放。</p>
    		
    		<h1><b style="font-size: 25px;">本馆简介</b></h1>
    		<p style="text-indent:2em; text-align: left;font-size: 18px;line-height: 22px;">真香图书馆在第五次公共图书馆评估定级中被评为国家一级图书馆，是全国公共文化设施管理先进单位、全国古籍重点保护单位、全民阅读先进单位、全民阅读示范基地、第三届文化部“创新奖”获奖单位、肇庆市首批青少年科普教育场馆、肇庆市青少年校外活动示范基地。2010年，真香图书馆增挂肇庆市古籍保护中心牌子，2016年获得省文物局颁发的“可移动文物修复资质”。</p>
    		<p style="text-indent:2em; text-align: left;font-size: 18px;line-height: 22px;">在数字图书馆建设方面，拥有4个独立域名网站，即真香图书馆网站（www.zqu.ZHlibrary.com）。</p>
    		<p style="text-indent:2em; text-align: left;font-size: 18px;line-height: 22px;">馆内实现365天开馆，开放中文图书外借室、中文期刊外借室、少儿阅览室、中文图书阅览室、期刊阅览室、报刊阅览室、古籍查阅室、研究阅览室、电子阅览室、外文阅览室、地方文献阅览室、各类文献提供中心等服务窗口。</p>
    		<p style="text-indent:2em; text-align: left;font-size: 18px;line-height: 22px;">馆内现有纸本文献277万册，数字资源100.39TB，2016年接待读者109万人次。全域肇庆已实现市馆——区（市）县馆通借通还工作，读者用身份证在全市任一图书馆免费注册后，即可享受全市纸本和数字资源的共享免费服务。</p>
    	</div>

    	
    </div>



    <<!-- footer -->
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


<script>
    //获取最外面的div
    var box = my$("box");
    //获取相框
    var screen = box.children[0];
    //获取相框的宽度
    var imgWidth = screen.offsetWidth;
    //获取ul
    var ulObj = screen.children[0];
    //获取ul中的所有的li
    var list = ulObj.children;
    //获取ol
    var olObj = screen.children[1];
    //焦点的div
    var arr = my$("arr");

    var pic = 0;//全局变量
    //创建小按钮----根据ul中的li个数
    for (var i = 0; i < list.length; i++) {
        //创建li标签,加入到ol中
        var liObj = document.createElement("li");
        olObj.appendChild(liObj);
        liObj.innerHTML = (i + 1);
        //在每个ol中的li标签上添加一个自定义属性,存储索引值
        liObj.setAttribute("index", i);
        //注册鼠标进入事件
        liObj.onmouseover = function () {
            //先干掉所有的ol中的li的背景颜色
            for (var j = 0; j < olObj.children.length; j++) {
                olObj.children[j].removeAttribute("class");
            }
            //设置当前鼠标进来的li的背景颜色
            this.className = "current";
            //获取鼠标进入的li的当前索引值
            pic = this.getAttribute("index");
            //移动ul
            animate(ulObj, -pic * imgWidth);
        };
    }
    //设置ol中第一个li有背景颜色
    olObj.children[0].className = "current";


    //克隆一个ul中第一个li,加入到ul中的最后=====克隆
    ulObj.appendChild(ulObj.children[0].cloneNode(true));

    //自动播放
    var timeId= setInterval(clickHandle,2000);
    //鼠标进入到box的div显示左右焦点的di
    box.onmouseover = function () {
        arr.style.display = "block";
        //鼠标进入废掉之前的定时器
        clearInterval(timeId);
    };
    //鼠标离开到box的div隐藏左右焦点的div
    box.onmouseout = function () {
        arr.style.display = "none";
        //鼠标离开自动播放
        timeId= setInterval(clickHandle,2000);
    };
    //右边按钮
    my$("right").onclick =clickHandle;
    function clickHandle() {
        //如果pic的值是5,恰巧是ul中li的个数-1的值,此时页面显示第六个图片,而用户会认为这是第一个图,
        //所以,如果用户再次点击按钮,用户应该看到第二个图片
        if (pic == list.length - 1) {
            //如何从第6个图,跳转到第一个图
            pic = 0;//先设置pic=0
            ulObj.style.left = 0 + "px";//把ul的位置还原成开始的默认位置
        }
        pic++;//立刻设置pic加1,那么此时用户就会看到第二个图片了
        animate(ulObj, -pic * imgWidth);//pic从0的值加1之后,pic的值是1,然后ul移动出去一个图片
        //如果pic==5说明,此时显示第6个图(内容是第一张图片),第一个小按钮有颜色,
        if (pic == list.length - 1) {
            //第五个按钮颜色干掉
            olObj.children[olObj.children.length - 1].className = "";
            //第一个按钮颜色设置上
            olObj.children[0].className = "current";
        } else {
            //干掉所有的小按钮的背景颜色
            for (var i = 0; i < olObj.children.length; i++) {
                olObj.children[i].removeAttribute("class");
            }
            olObj.children[pic].className = "current";
        }

    };
    //左边按钮
    my$("left").onclick = function () {
        if (pic == 0) {
            pic = 5;
            ulObj.style.left = -pic * imgWidth + "px";
        }
        pic--;
        animate(ulObj, -pic * imgWidth);
        //设置小按钮的颜色---所有的小按钮干掉颜色
        for (var i = 0; i < olObj.children.length; i++) {
            olObj.children[i].removeAttribute("class");
        }
        //当前的pic索引对应的按钮设置颜色
        olObj.children[pic].className = "current";

    };

    //设置任意的一个元素,移动到指定的目标位置
    function animate(element, target) {
        clearInterval(element.timeId);
        //定时器的id值存储到对象的一个属性中
        element.timeId = setInterval(function () {
            //获取元素的当前的位置,数字类型
            var current = element.offsetLeft;
            //每次移动的距离
            var step = 10;
            step = current < target ? step : -step;
            //当前移动到位置
            current += step;
            if (Math.abs(current - target) > Math.abs(step)) {
                element.style.left = current + "px";
            } else {
                //清理定时器
                clearInterval(element.timeId);
                //直接到达目标
                element.style.left = target + "px";
            }
        }, 10);
    }
</script>
</body>

</html>