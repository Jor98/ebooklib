<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>


<head>
    <meta charset="UTF-8">
    <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->
    <!--<meta name="viewport" content="width=device-width, initial-scale=1.0">-->
    <title></title>
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
		.sousuo{
		    border:1px solid #000;
		    width: 60%;
		    height:800px;
		    margin-left:20%;
		    margin-top:50px;
		    margin-bottom:30px;
		    padding:3%;
		}
		.list_ul_li{
			height:160px;border-bottom:1px solid #000;
		}
		.list_ul_li div:nth-of-type(1){
			float: left;width:20%;height:100%;
		}
		.list_ul_li div:nth-of-type(2){
			float: left;width:80%;height:100%;
		}
		
		.book_details_left{
			display:block;
			width:20%;height:30px;
			padding:0px 10px;
			float:left;
			font-size:14px;
		}
		.book_details_right{
			display:block;
			width:30%;height:30px;
			float:left;
			font-size:14px;
		}
		.search_page a{
			display:inline;
			color:#337ab7;
		}
		.main_list a:hover{
			color:blue;	
		}
		.tdx{
			text-align:left;
			font-weight:normal;
			color:#212063;
			background-color:#F5F6F7;
			font-size:15px;
			height:20px;
			display:block;
			float:left;
			margin-right:4px;
			margin-top:2px;
		}
		.tdheader{
			text-align:left;
			font-weight:normal;
			color:#212063;
			background-color:gray;
			font-size:14px;
			display:block;
			float:left;
			margin-right:4px;
			margin-top:2px;
			padding-left:16px;
			height:20px;
		}
		.tdmain{
			text-align:left;
			font-weight:normal;
			background-color:#F5F6F7;
			font-size:14px;
			display:block;
			float:left;
			margin-right:4px;
			margin-top:2px;
			padding-left:6px;
			height:25px;
		}
		.tdmain a:hover{
			color:blue;
		}
	</style>
	
	<script type="text/javascript">
	$(function(){
		var user_id = <s:property value="#session.exisUser.user_id"/>;
		$.post("${pageContext.request.contextPath }/user_findUser.action",{"user_id":user_id},function(data){
	    	if(data[0].borrows){
	        	$.each(data[0].borrows,function(){
	        		if(this.is_return == "0" ){
		        		var date_to_return = new Date(this.date_to_return.time);
		        		var result0 = date_to_return.getFullYear() + '-' + (date_to_return.getMonth() + 1) + '-' + date_to_return.getDate();
		        		var date_now = new Date();
		           	 	if(date_now > date_to_return){
		           	 		result1 = "<td class='tdmain' style='color:red;width:10%;padding-left:0px;text-align:center;'>是</td>";
		           	 	}else{
		           	 		result1 = "<td class='tdmain' style='width:10%;padding-left:0px;text-align:center;'>否</td>";
		           	 	}
		        		$('#borrow_list').append("<tr><td class='tdmain' style='width:19%'>" + this.books.books_id + "</td><td class='tdmain' style='width:42%;'>" + this.books.book.book_name + "</td><td class='tdmain' style='width:15%'>" 
		        				+ result0 + "</td>" + result1 + "<td class='tdmain' style='width:10%;text-align:center;padding-left:0px;'><button onclick='transmit_bookreturn("+ 
		        						this.borrow_id +")'>归还</button></td>" +"</tr>");
	        		}
	        	})
	    	}
		},"json");
	});
	
	function transmit_bookreturn(borrow_id) {
		alert("归还成功！");
		$('#borrowreturn_id').val(borrow_id);
		$('#bookreturn').submit();
	}
	
	</script>
</head>

<body>
<!--最外层的布局容器-->
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
        <div style="width:90%;border-bottom:1px solid #000;margin:0 auto;">
        	<h4 style="margin:16px auto;width:13%;">已借图书</h4>
        </div>
            <form id="bookreturn" action="${pageContext.request.contextPath }/borrow_returnbookUser.action" method="post">
            <input name="borrow_id" type="hidden" id="borrowreturn_id">
            <table id="borrow_list" style="margin:0 auto;margin-top: 4%;width:600px;">
            	<tr>
        			<td class="tdheader" style="width: 19%;">书本编号</td>
        			<td class="tdheader" style="width: 42%;">书名</td>
        			<td class="tdheader" style="width: 15%;">应还日期</td>
        			<td class="tdheader" style="width: 10%;padding-left: 0px;">是否超时</td>
        			<td class="tdheader" style="width: 10%;">操作</td>
        		</tr>
        		
            </table>
                <div style="position:relative;left: 46%;margin-top:50px">
                    <input type="button" value="返回" style="margin-right:7%;" onclick="javascript:window.location.href='${pageContext.request.contextPath }/user/information.jsp'"/>
                </div>
            </form>
        </div>
    </div>
</div>
      
        <div style="clear:left;"></div>
        
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
 
function to_page(page){
	if(page){
		$("#page").val(page);
	}
	document.bookForm.submit();
}

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