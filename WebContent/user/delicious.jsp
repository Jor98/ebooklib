<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->
    <!--<meta name="viewport" content="width=device-width, initial-scale=1.0">-->
    <title>图书馆</title>
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
	</style>
	
	<script type="text/javascript">
	function transmit_returnbook(){
		var user_id = null;
		<s:if test="#session.exisUser != null">
			user_id=<s:property value="#session.exisUser.user_id"/>;
		</s:if>
		
		if(user_id == null){
			alert("用户未登录！");
			window.location="${pageContext.request.contextPath }/user/login.jsp";
		}else{
			window.location="${pageContext.request.contextPath }/user/borrowbook.jsp";
		}
	}
	</script>
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

    <!--公告部分以及右边的功能框-->
    <div class="gg" style="height: 530px;">

        <div class="declare" style="float:left"  >
            <!--左边的公告栏-->
            <div class="yi" style="float: left" >
                <ul class="yi1" >
                    <li class="tab-item1 active"><i class="fa fa-institution"></i>真图公告</li>
                    <li class="tab-item1">真图展厅</li>
                    <li class="tab-item1">锦诚讲堂</li>
                    <li class="tab-item1">图书馆联盟</li>
                </ul>
                <div class="yi2">
                    <div class="yi2a selected">
                    <ul class="yi21">
                        <li>
                            <a href="50.html">
                            真图书馆2018年12月公益讲座安排
                            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                            2018-12-27
                            </a>
                        </li>
                        <li>
                            <a href="51.html">
                            真图书友会 2018年12月安排
                            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                            2018-11-21
                            </a>
                        </li>
                        <li>
                            <a href="52.html">
                            非身份证注册读者办理押金退还业务
                            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                            2018-10-23
                            </a>
                        </li>
                        <li>
                            <a href="53.html">
                            肇庆市图书馆即将推出读者信用积分服务
                            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                            2018-9-24
                            </a>
                        </li>
                    </ul>
                    </div>
                    <div class="yi2a">
                        <ul class="yi21">
                            <li >
                                <a href="54.html">
                                梨园贺岁·百戏昇平”戏曲文化知识展
                                &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                2018-12-27
                                </a>
                            </li>
                            <li>
                                <a href="55.html">
                                    道德模范图片展览
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-11-27
                                </a>
                            </li>
                            <li>
                                <a href="56.html">
                                    另一种智慧-文献艺术展
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-10-23
                                </a>
                            </li>
                            <li>
                                <a href="57.html">
                                    展览：蹊径
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-10-25
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="yi2a">
                        <ul class="yi21">
                            <li >
                                <a href="58.html">
                                    培养高情商的孩子
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-12-27
                                </a>
                            </li>
                            <li>
                                <a href="59.html">
                                    让孩子远离焦虑
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-11-27
                                </a>
                            </li>
                            <li>
                                <a href="60.html">
                                    创业企业家精神与实践
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-10-23
                                </a>
                            </li>
                            <li>
                                <a href="61.html">
                                    心身疾病的动因与疗愈
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-10-25
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="yi2a">
                        <ul class="yi21">
                            <li >
                                <a href="62.html">
                                    肇庆市龙泉驿区
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-12-27
                                </a>
                            </li>
                            <li>
                                <a href="63.html">
                                    大邑县图书馆
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-11-27
                                </a>
                            </li>
                            <li>
                                <a href="64.html">
                                    简阳市图书馆
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-10-26
                                </a>
                            </li>
                            <li>
                                <a href="65.html">
                                    青白江区图书馆
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-9-27
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="er" >
                <ul class="yi3" >
                    <li class="tab-item2 active;"><i class="fa fa-paper-plane"></i>少儿活动</li>
                    <li class="tab-item2">阳光课堂</li>
                    <li class="tab-item2">亲子阅读成长</li>
                    <li class="tab-item2">义务小馆员</li>
                </ul>
                <div class="yi4">
                    <div class="yi4a selected">
                        <ul class="yi41">
                            <li>
                                <a href="66.html">
                                    真图阳光课堂2018年9月活动安排
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-11-21
                                </a>
                            </li>
                            <li>
                            <a href="67.html">
                                真图阳光课堂2018年10月活动安排
                                &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                2018-11-13
                            </a>
                            </li>
                            <li>
                            <a href="68.html">
                                真图阳光课堂2018年11月活动安排
                                &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                2018-11-07
                            </a>
                            </li>
                            <li>
                            <a href="69.html">
                                真图阳光课堂2018年12月活动安排
                                &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                2018-10-21
                            </a>
                            </li>
                        </ul>
                    </div>
                    <div class="yi4a">
                        <ul class="yi41">
                            <li>
                                <a href="66.html">
                                    真图阳光课堂2018年9月活动安排
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-11-21
                                </a>
                            </li>
                            <li>
                            <a href="67.html">
                                真图阳光课堂2018年10月活动安排
                                &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                2018-11-13
                            </a>
                            </li>
                            <li>
                            <a href="68.html">
                                真图阳光课堂2018年11月活动安排
                                &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                2018-11-07
                            </a>
                            </li>
                            <li>
                            <a href="69.html">
                                真图阳光课堂2018年12月活动安排
                                &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                2018-10-21
                            </a>
                            </li>
                        </ul>
                    </div>
                    <div class="yi4a">
                        <ul class="yi41">
                            <li>
                                <a href="70.html">
                                    “点亮阅读、开启梦想”系列阅读推广活动
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-12-27
                                </a>
                            </li>
                            <li>
                                <a href="71.html">
                                    金猪贺新年，图图有锦鲤
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-11-21
                                </a>
                            </li>
                            <li>
                                <a href="72.html">
                                    少儿经典英语短片赏析活动热闹开场
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-10-23
                                </a>
                            </li>
                            <li>
                                <a href="73.html">
                                    图书馆经典英语短片赏析活动开始啦！
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-9-24
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="yi4a">
                        <ul class="yi41">
                            <li>
                                <a href="74.html">
                                    “小小馆长”及义务小馆员颁奖仪式开始啦！
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-12-27
                                </a>
                            </li>
                            <li>
                                <a href="75.html">
                                    “小小馆长”及义务小馆员招募
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-11-21
                                </a>
                            </li>
                            <li>
                                <a href="76.html">
                                    真香图书馆2018年暑假义务小馆员招募
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-10-23
                                </a>
                            </li>
                            <li>
                                <a href="77.html">
                                    义务小馆员活动结束啦！
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-9-24
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div style="clear:both"></div>
            <div class="san" >
                <ul class="yi5" >
                    <li class="tab-item3 active"><i class="fa fa-css3"></i>阅创空间</li>
                    <li class="tab-item3">创客宝典</li>
                    <li class="tab-item3">团队信息</li>
                    <li class="tab-item3">创客活动</li>
                </ul>
                <div class="yi6">
                    <div class="yi6a selected">
                        <ul class="yi61">
                            <li><a href="78.html">“直播+” 内容日趋多元化 不断创造互联网新的商业模式</a></li>
                            <li><a href="79.html">那些引领行业的龙头都厉害在哪里呢？ ‖ 发现中国“义利99”</a></li>
                            <li><a href="80.html">请回答2017互联网：谁不是一边成为历史，一边忙着再造自己？</a></li>
                            <li><a href="81.html">投资人怎么看内容创业2018？就算不融资也值得看</a></li>
                        </ul>
                    </div>
                    <div class="yi6a">
                        <ul class="yi61">
                            <li><a href="78.html">“直播+” 内容日趋多元化 不断创造互联网新的商业模式</a></li>
                            <li><a href="79.html">那些引领行业的龙头都厉害在哪里呢？ ‖ 发现中国“义利99”</a></li>
                            <li><a href="80.html">请回答2017互联网：谁不是一边成为历史，一边忙着再造自己？</a></li>
                            <li><a href="81.html">投资人怎么看内容创业2018？就算不融资也值得看</a></li>
                        </ul>
                    </div>
                    <div class="yi6a">
                        <ul class="yi61">
                            <li><a href="82.html">真香图书馆：翻到了“阅创空间”这一页</a></li>
                            <li><a href="83.html">号外，号外！人见人爱的图图又得新奖章啦！</a></li>
                            <li><a href="84.html">图书馆组建话剧社 不仅上演好戏还培养演员</a></li>
                            <li><a href="85.html">阅创•木朵丨木朵成为成都医学城独家合作公关公司</a></li>
                        </ul>
                    </div>
                    <div class="yi6a">
                        <ul class="yi61">
                            <li><a href="87.html">2018年成图·麋鹿青年成长计划课程</a></li>
                            <li><a href="88.html">打开阅创空间的N种方式——阅创灵慧VS蹊径私属旅行</a></li>
                            <li><a href="89.html">相约最美书店，来一场旅行与读书的跨界分享！</a></li>
                            <li><a href="90.html">越来越火的东欧，究竟应该怎么玩才能制霸朋友圈？</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="si" >
                <ul class="yi7" >
                    <li class="tab-item4 active"><i class="fa fa-mortar-board"></i>讲座预告</li>
                    <li class="tab-item4">公益讲座</li>
                    <li class="tab-item4">真图书友会</li>
                    <li class="tab-item4">阳光课堂</li>
                </ul>
                <div class="yi8">
                    <div class="yi8a selected">
                        <ul class="yi81">
                            <li>
                                <a href="#">
                                    涂岩送~~讲座预告！青少年如何成功
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-12-27
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    屠渤海~~讲座预告！成功道路如何走
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-11-21
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    谢花开~~讲座预告！心理的自我管理
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-10-23
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    卿德珠~~讲座预告！演员的自我修养
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    2018-9-24
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="yi8a">
                        <ul class="yi81">
                            <li><a href="#">聋哑儿童慈善讲座</a></li>
                            <li><a href="#">保护动物慈善讲座</a></li>
                            <li><a href="#">保护环境慈善讲座</a></li>
                            <li><a href="#">能源节约慈善讲座</a></li>
                        </ul>
                    </div>
                    <div class="yi8a">
                        <ul class="yi81">
                            <li><a href="#">儿童书友会</a></li>
                            <li><a href="#">青少年书友会</a></li>
                            <li><a href="#">承认书友会</a></li>
                            <li><a href="#">老年书友会</a></li>
                        </ul>
                    </div>
                    <div class="yi8a">
                        <ul class="yi81">
                            <li><a href="#">更多功能，敬请期待</a></li>
                            <li><a href="#">更多功能，敬请期待</a></li>
                            <li><a href="#">更多功能，敬请期待</a></li>
                            <li><a href="#">更多功能，敬请期待</a></li>
                        </ul>
                    </div>
                </div>
            </div>


        </div>
        <!--右边的功能搜索框-->
        <div class="wu" >
               <div class="wuyi" style="background: rgba(16, 16, 16, 1);height: 50px;line-height: 50px;font-weight: bold">快捷服务</div>
               <div class="wuer" onclick="javascript:window.location.href='${pageContext.request.contextPath }/book_findAllBook.action'">
                   <div><i class="fa fa-book"></i></div>
                   <div>本馆书目检索</div>
               </div>
               <div class="wusan" onclick="transmit_returnbook()">
                   <div><i class="fa fa-share-alt-square"></i></div>
                   <div>书籍归还</div>
               </div>
               <div class="wusi">
                   <div><i class="fa fa-ambulance"></i></div>
                   <div>意见反馈</div>
               </div>
               <div class="wuwu">
                   <div><i class="fa fa-users"></i></div>
                   <div>读者荐购</div>
               </div>
               <div class="wuliu">
                   <div><i class="fa fa-cc-discover"></i></div>
                   <div>随书光盘</div>
               </div>
               <div class="wuqi">
                   <div><i class="fa fa-building"></i></div>
                   <div>常见问题</div>
               </div>
        </div>
    </div>
     <!--好书推荐-->
    <div class="row">
        <div class="col-md-12" style="padding: 30px;margin: 10px;">
            <h1 style="font-family:zFont2;  font-size:40px;"> 真香图书馆好书推荐</h1>
        </div>
    </div>
    <!--好书推荐轮播图-->
    <div class="all" id='box' style="float:left">
        <div class="screen"><!--相框-->
            <ul>
                <li><a href="${pageContext.request.contextPath }/book_bookDetails.action?book_id=18"><img src="${pageContext.request.contextPath }/img/08fb01e742ac47acb324cc30ecd9cf31.png"  height="400" width="100%"/></a></li>
                <li><a href="${pageContext.request.contextPath }/book_bookDetails.action?book_id=16"><img src="${pageContext.request.contextPath }/img/a7f166c34878439bbb30c414e3492818.png"  height="400" width="100%"/></a></li>
                <li><a href="${pageContext.request.contextPath }/book_bookDetails.action?book_id=9"><img src="${pageContext.request.contextPath }/img/f0008689884446d49f7d0e542fe80aae.jpg"  height="400" width="100%"/></a></li>
                <li><a href="${pageContext.request.contextPath }/book_bookDetails.action?book_id=19"><img src="${pageContext.request.contextPath }/img/b217a5a38fcc450599214c799b3b2844.png"  height="400" width="100%"/></a></li>
                <li><a href="${pageContext.request.contextPath }/book_bookDetails.action?book_id=20"><img src="${pageContext.request.contextPath }/img/12e9b8a6982f42c1b79757ad764989fe.png"  height="400" width="100%"/></a></li>
            </ul>
            <ol>
            </ol>
        </div>
        <div id="arr"><span id="left">&lt;</span><span id="right">&gt;</span></div>
    </div>
    <!--突出显示-->
    <div class="wrap">
        <ul>
            <li style="width: 180px"><a href="#"><img src="${pageContext.request.contextPath }/img/01.jpg" alt="" width="100%" height="186px"/></a></li>
            <li style="width: 180px"><a href="#"><img src="${pageContext.request.contextPath }/img/02.jpg" alt=""width="100%" height="186px"/></a></li>
            <li style="width: 180px"><a href="#"><img src="${pageContext.request.contextPath }/img/03.jpg" alt=""width="100%" height="186px"/></a></li>
            <li style="width: 180px"><a href="#"><img src="${pageContext.request.contextPath }/img/04.jpg" alt=""width="100%" height="186px"/></a></li>
            <li style="width: 180px"><a href="#"><img src="${pageContext.request.contextPath }/img/05.jpg" alt=""width="100%" height="186px"/></a></li>
            <li style="width: 180px"><a href="#"><img src="${pageContext.request.contextPath }/img/06.jpg" alt=""width="100%" height="186px"/></a></li>
        </ul>
    </div>
    <!--好书推荐-->
    <!-- 
    <div class="row">
        <div class="col-md-12" style="padding: 30px;margin: 10px;">
            <h1 style="font-family:zFont2; font-weight:100; font-size:40px;"> 真香图书馆各大图书排行榜</h1>
        </div>
    </div>
	 -->

    <!--好书推荐列表-->
    <!-- 
    <div class="tui">
        <div class="a " style="float: left;">

            <ul id="a1" style="height: 615px;list-style-type:none;">
                <li  style="height: 70px;font-family: zFont2">少&nbsp;儿&nbsp; 图&nbsp;书</li>
                <li class="tab-item5 " style="height: 55px;"><a class="a11 on" href="#">1、世界小地图 &emsp;&emsp;&emsp;&emsp;&emsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">2、淘气包马小跳&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">漫画图书</font></a> </li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">3、小熊宝宝绘本&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">漫画图书</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">4、学会爱自己 &emsp;&emsp;&emsp;&emsp;&emsp;<font size="1px">启蒙读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">5、中国历史&emsp; &emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">6、中国历史 &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">7、中国历史&emsp; &emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">8、中国历史 &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">9、中国历史&emsp; &emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">10、 更多书籍 &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">点击查看</font></a></li>
            </ul>
        </div>

        <div class="b" style="float: left;">
            <ul style="height: 615px;list-style-type:none;">
                <li style="height: 70px;font-family: zFont2">考&nbsp;研&nbsp;资&nbsp;料</li>
                <li class="tab-item5 " style="height: 55px;"><a class="a11 on" href="#">1、世界小地图&emsp; &emsp;&emsp;&emsp;&emsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">2、淘气包马小跳&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">漫画图书</font></a> </li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">3、小熊宝宝绘本&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">漫画图书</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">4、学会爱自己 &emsp;&emsp;&emsp;&emsp;&emsp;<font size="1px">启蒙读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">5、中国历史&emsp; &emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">6、中国历史&emsp; &emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">7、中国历史 &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">8、中国历史&emsp; &emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">9、中国历史&emsp; &emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">10、 更多书籍 &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">点击查看</font></a></li>
            </ul>
        </div>
        <div class="c" style="float: left;">
            <ul style="height: 615px;list-style-type:none;">
                <li style="height: 70px;font-family: zFont2">经&nbsp;典&nbsp;励&nbsp;志</li>
                <li class="tab-item5 " style="height: 55px;"><a class="a11 on" href="#">1、世界小地图&emsp; &emsp;&emsp;&emsp;&emsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">2、淘气包马小跳&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">漫画图书</font></a> </li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">3、小熊宝宝绘本&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">漫画图书</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">4、学会爱自己&emsp; &emsp;&emsp;&emsp;&emsp;<font size="1px">启蒙读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">5、中国历史 &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">6、中国历史 &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">7、中国历史 &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">8、中国历史&emsp; &emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">9、中国历史 &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">10、 更多书籍&emsp; &emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">点击查看</font></a></li>
            </ul>
        </div>
        <div class="d" style="float: left;">
            <ul style="height: 615px;list-style-type:none;">
                <li style="height: 70px;font-family: zFont2">文&nbsp;学&nbsp;经&nbsp;典</li>
                <li class="tab-item5 " style="height: 55px;"><a class="a11 on" href="#">1、世界小地图 &emsp;&emsp;&emsp;&emsp;&emsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">2、淘气包马小跳&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">漫画图书</font></a> </li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">3、小熊宝宝绘本&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">漫画图书</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">4、学会爱自己&emsp; &emsp;&emsp;&emsp;&emsp;<font size="1px">启蒙读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">5、中国历史 &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">6、中国历史 &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">7、中国历史 &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">8、中国历史 &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">9、中国历史 &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">科普读物</font></a></li>
                <li class="tab-item5 " style="height: 55px;"><a href="#">10、 更多书籍 &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="1px">点击查看</font></a></li>
            </ul>
        </div>

    </div>
    -->
    <!--LOGO部分-->

    <!--<div class="container1">-->
        <!--<div class="cover atvImg">-->
            <!--<div class="atvImg-layer" data-img="../img/visa-bg.jpg"></div>-->
            <!--<div class="atvImg-layer" data-img="../img/visa.png"></div>-->
        <!--</div>-->

        <!--<div class="cover atvImg">-->
            <!--<div class="atvImg-layer" data-img="../img/visa-bg-2.jpg"></div>-->
            <!--<div class="atvImg-layer" data-img="../img/visa.png"></div>-->
        <!--</div>-->

        <!--<div class="cover atvImg">-->
            <!--<div class="atvImg-layer" data-img="../img/visa-bg-3.jpg"></div>-->
            <!--<div class="atvImg-layer" data-img="../img/visa.png"></div>-->
        <!--</div>-->
    <!--</div>-->
    <div>

    </div>
    <div class="row">
        <div class="col-md-12" style="padding: 30px;margin: 10px;">
            <h1 style="font-family:zFont2;  font-size:40px;"> 各大精美图书馆</h1>
        </div>
    </div>
    <!--底部标签栏-->
    <div class="low" style="background:grey;height: 20%">
        <div style="padding-top: 20px;width: 100%;text-align: center">
            <a href="http://www.library.sh.cn/" target="_blank" style="display:inline;"><img src="${pageContext.request.contextPath }/img/6.png" width="13%" style="margin-right: 20px"></a>
            <a href="http://www.dglib.cn/" target="_blank" style="display:inline;"><img src="${pageContext.request.contextPath }/img/7.png" width="13%" style="margin-right: 20px"></a>
            <a href="http://www.nlc.cn/" target="_blank" style="display:inline;"><img src="${pageContext.request.contextPath }/img/8.png" width="13%" style="margin-right: 20px"></a>
            <a href="http://cdarchive.chengdu.gov.cn/" target="_blank" style="display:inline;"><img src="${pageContext.request.contextPath }/img/9.png" width="13%" style="margin-right: 20px"></a>
            <a href="http://www.sclib.org/" target="_blank" style="display:inline;"><img src="${pageContext.request.contextPath }/img/10.png"width="13%" style="margin-right: 20px"></a>
            <a href="http://sqjy.scopen.net/" target="_blank" style="display:inline;"><img src="${pageContext.request.contextPath }/img/11.png"width="13%" ></a>
        </div>
        <div style="margin-top: 20px;width: 100%;text-align: center">
            <a href="http://www.hzlib.net/" target="_blank" style="display:inline;"><img src="${pageContext.request.contextPath }/img/12.png" width="13%" style="margin-right: 20px;"></a>
            <a href="http://www.xmlib.net/" target="_blank" style="display:inline;"><img src="${pageContext.request.contextPath }/img/13.png"width="13%" style="margin-right: 20px"></a>
            <a href="http://www.ndlib.cn/" target="_blank" style="display:inline;"><img src="${pageContext.request.contextPath }/img/14.png"width="13%" style="margin-right: 20px"></a>
            <a href="https://www.mct.gov.cn/" target="_blank" style="display:inline;"><img src="${pageContext.request.contextPath }/img/15.png"width="13%" style="margin-right: 20px"></a>
            <a href="http://www.gzlib.gov.cn/" target="_blank" style="display:inline;"><img src="${pageContext.request.contextPath }/img/16.png"width="13%" style="margin-right: 20px"></a>
            <a href="http://www.chengduwenhua.gov.cn/" target="_blank" style="display:inline;"><img src="${pageContext.request.contextPath }/img/17.png"width="13%" ></a>
        </div>
    </div>
    <!--最新商品-->

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