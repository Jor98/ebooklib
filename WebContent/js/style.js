$(function () {

    $(".tab-item1").mouseenter(function () {
        //两件事件
        $(this).addClass("active").siblings().removeClass("active");
        var idx = $(this).index();
        $(".yi2a").eq(idx).addClass("selected").siblings().removeClass("selected");
    });
    $(".tab-item2").mouseenter(function () {
        //两件事件
        $(this).addClass("active").siblings().removeClass("active");
        var idx = $(this).index();
        $(".yi4a").eq(idx).addClass("selected").siblings().removeClass("selected");
    });
    $(".tab-item3").mouseenter(function () {
        //两件事件
        $(this).addClass("active").siblings().removeClass("active");
        var idx = $(this).index();
        $(".yi6a").eq(idx).addClass("selected").siblings().removeClass("selected");
    });
    $(".tab-item4").mouseenter(function () {
        //两件事件
        $(this).addClass("active").siblings().removeClass("active");
        var idx = $(this).index();
        $(".yi8a").eq(idx).addClass("selected").siblings().removeClass("selected");
    });

    $(".tab-item5").mouseenter(function () {
        //两件事件
        
    });

    
        $(".wrap>ul>li").mouseenter(function () {

            $(this).css("opacity", "1").siblings().css("opacity", "0.4");
        });

        $(".wrap").mouseleave(function () {
            //让所有的li都变亮
            //$("li");
            //$(".wrap li");
            //$(".wrap>ul>li")

            //$(this).children().children("li");
            $(this).find('li').css("opacity", 1);
        });

    

});